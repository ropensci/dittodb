context("Test fixture")
library(DBI)

# testing against built-in sqlite database
con <- nycflights13_sqlite(use = "DBI")

test_that("The fixture is what we expect", {
  expect_identical(
    DBI::dbListTables(con),
    c("airlines", "airports", "flights", "planes", "weather")
  )

  expect_identical(
    DBI::dbGetQuery(con, "SELECT * FROM airlines LIMIT 2"),
    data.frame(
      carrier = c("9E", "AA"),
      name = c("Endeavor Air Inc.", "American Airlines Inc."),
      stringsAsFactors = FALSE
    )
  )
})

DBI::dbDisconnect(con)

with_mock_db({
  con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  test_that("We can mock it", {
    expect_is(
      con,
      "DBIMockConnection"
    )
  })

  test_that("We get our special query", {
    expect_identical(
      dbGetQuery(con, "SELECT * FROM airlines LIMIT 2"),
      data.frame(
        carrier = c("9E", "AA"),
        name = c("Endeavor Air Inc.", "American Airlines Inc."),
        stringsAsFactors = FALSE
      )
    )
  })
  dbDisconnect(con)
})
