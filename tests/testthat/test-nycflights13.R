context("nycflights13")

test_that("Error checking", {
  expect_error(
    nycflights13_sql("a connection", sqlite = TRUE),
    "Specifying a `connection`con` and `sqlite = TRUE` are incompatible."
  )
})
