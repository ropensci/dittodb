context("File paths")

test_that("path operations work", {
  expect_identical(make_path("foo", "bar", "feef"), "foo/bar-feef.R")

  expect_true(ensure_file(test_path("test-paths.R")))
  expect_false(ensure_file(test_path("not-here.R")))

  expect_error(
    read_file("not-here.R"),
    "Couldn't find the file at not-here.R"
  )
})


test_that("path sanitization", {
  expect_identical(
    db_path_sanitize(":memory:"),
    "_memory_"
    )

  long_path <- paste0(rep(letters, 11), collapse =)
  expect_identical(
    db_path_sanitize(long_path),
    substr(long_path, 1, 255)
  )
})
