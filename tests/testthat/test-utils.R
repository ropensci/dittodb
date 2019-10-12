context("utils")

test_that("can check for packages", {
  expect_true(check_for_pkg("testthat"))

  expect_error(
    check_for_pkg("not_a_package"),
    paste0(
      "The package not_a_package isn't installed but is required for this ",
      "function. \nPlease install it with install.packages(\"not_a_package\") ",
      "and try again."
    ),
    fixed = TRUE
  )
})


test_that("path sanitization", {
  expect_identical(
    db_path_sanitize(":memory:"),
    "_memory_"
  )
})
