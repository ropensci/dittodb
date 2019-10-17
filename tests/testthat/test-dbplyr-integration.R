context("Test against dbplyr")

# testing against built-in sqlite database
con <- nycflights13_sqlite(method = "dplyr")

test_that("The fixture is what we expect", {
  expect_identical(
    DBI::dbListTables(con),
    c("airlines", "airports", "flights", "planes",  "sqlite_stat1",
      "sqlite_stat4", "weather")
  )

  expect_identical(
    DBI::dbGetQuery(con, "SELECT * FROM airlines"),
    as.data.frame(nycflights13::airlines)
  )
})

dbDisconnect(con)

# test with the mock db using some captured mocks
start_capturing()
con <- nycflights13_sqlite(method = "dplyr")
dbListTables(con) # we have to list tables in order to have the mocks work below

# record mocks for a few queries we are planning to execute below
DBI::dbGetQuery(con, "SELECT * FROM airlines")

dbDisconnect(con)
stop_capturing()

# now try the whole thing again, but this time with the mock db.
with_mock_db({
  con <- nycflights13_sqlite(method = "dplyr")

  test_that("We can mock it", {
    expect_is(
      con,
      "DBIMockConnection"
    )
  })

  test_that("We get our special query", {
    expect_identical(
      DBI::dbGetQuery(con, "SELECT * FROM airlines"),
      as.data.frame(nycflights13::airlines)
    )
  })

  dbDisconnect(con)
})
