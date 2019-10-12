context("Test against dbplyr")
library(DBI)

# testing against built-in sqlite database
con <- nycflights13_sql(sqlite = TRUE, use = "dplyr")

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

rm(con)

skip("For now, dplyr connections don't work")
# test with the mock db using some captured mocks
start_capturing()
con <- nycflights13_sql(sqlite = TRUE, use = "dplyr")
stop_capturing()

with_mock_db({
  con <- nycflights13_sql(sqlite = TRUE, use = "dplyr")

  # nycflights13_sqlite(use == "DBI") returns
  # unable to find an inherited method for function ‘dbListTables’ for signature ‘"DBIMockConnection"’

  # nycflights13_sqlite(use == "dplyr") returns
  # Error in RSQLite::initExtension(con) :
  # no slot of name "loadable.extensions" for this object of class "DBIMockConnection"

  test_that("We can mock it", {
    expect_is(
      con,
      "DBIMockConnection"
    )
  })

  test_that("We get our special query", {
    expect_identical(
      DBI::dbGetQuery(con, "SELECT * FROM airlines"),
      nycflights13::airlines
    )
  })
})
