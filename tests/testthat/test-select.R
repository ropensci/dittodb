context("Test fixture")
library(DBI)

# testing against built-in sqlite database
con <- nycflights13_sqlite()

test_that("The fixture is what we expect", {
  expect_identical(
    DBI::dbListTables(con),
    c("airlines", "airports", "flights", "planes", "weather")
  )

  expect_identical(
    DBI::dbGetQuery(con, "SELECT * FROM airlines"),
    nycflights13::airlines
  )
})

rm(con)

# test with the mock db using the mocks in the tests/testthat/mocks/ directory
with_mock_db({
  con <- nycflights13_sqlite()

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
