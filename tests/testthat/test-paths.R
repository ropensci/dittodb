test_that("path operations work", {
  expect_identical(make_path("foo", "bar", "feef"), "foo/bar-feef.R")

  expect_error(
    find_file("not-here.R"),
    "Couldn't find the file not-here.R in any of the mock directories."
  )
})
