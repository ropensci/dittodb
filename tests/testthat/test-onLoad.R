context("Testing setup of .onLoad()")

test_that(".onLoad add custom classes for all drivers that are available.", {
  callr::r(function() {
    library(testthat)
    custom_connections <- c("DBIMockSQLiteConnection")

    # ensure they have all been removed
    for (class_name in custom_connections) {
      expect_error(getClass(class_name), "is not a defined class")
    }

    # "load" the package
    library(dbtest)

    # now we have them all back
    for (class_name in custom_connections) {
      expect_is(getClass(class_name), "classRepresentation")
    }
  })
})

# TODO: can we mock what packages are available and show that nothing bad happens?
