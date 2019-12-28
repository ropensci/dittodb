context("Testing setup of .onLoad()")

# for coverage, we run in this session
# If the package namespace is locked (e.g. during R CMD check) .onLoad errors
# when trying to make the class, so test that that is the error (as evidence
# that the code is being executed)
# During devtools::test() the package is not locked, so we must check for that.
if (environmentIsLocked(asNamespace("dbtest"))) {
  # the environment is locked, this should error
  expect_error(
    .onLoad(),
    "class .*DBIMockSQLiteConnection.* has a locked definition in package .*dbtest.*"
  )
} else {
  expect_silent(.onLoad())
}

test_that("set_driver_class is no-op for a non-existent package", {
  expect_silent(
    set_driver_class(
      pkg = "notApackage",
      mock_conn = "superFakeClass",
      real_conn = "superRealClass"
    )
  )
  expect_error(getClass("superFakeClass"), "is not a defined class")
})


# Test with callr, in a separate function to ensure that the behavior of .onLoad
# is what we expect.
# standard, all packages installed
callr::r(function() {
  library(testthat)
  custom_connections <- c("DBIMockSQLiteConnection")

  test_that(".onLoad add custom classes for all drivers that are available.", {
    # ensure they have all been removed
    for (class_name in custom_connections) {
      expect_error(getClass(class_name), "is not a defined class")
    }

    # load the package
    library(dbtest)

    # now we have them all back
    for (class_name in custom_connections) {
      expect_is(getClass(class_name), "classRepresentation")
    }
  })
})

