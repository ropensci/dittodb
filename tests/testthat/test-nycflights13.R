context("nycflights13 writing functions")

test_that("nycflights sqlite can be created", {
  # with DBI
  con <- nycflights13_sqlite()
  expect_is(con, "SQLiteConnection")
  expect_identical(
    dbListTables(con),
    c("airlines", "airports", "flights", "planes", "weather")
  )
  dbDisconnect(con)

  # with dplyr
  con <- nycflights13_sqlite(method = "dplyr")
  expect_is(con, "SQLiteConnection")
  expect_identical(
    dbListTables(con),
    c("airlines", "airports", "flights", "planes", "sqlite_stat1", "sqlite_stat4", "weather")
  )
  dbDisconnect(con)
})
