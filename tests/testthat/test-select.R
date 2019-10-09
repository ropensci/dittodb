context("Test fixture")
library(DBI)

con <- DBI::dbConnect(RSQLite::SQLite(), test_path("data/nycflights13.sqlite"))
test_that("The fixture is what we expect", {
  expect_identical(
    DBI::dbListTables(con),
    c("airlines", "flights", "sqlite_stat1", "sqlite_stat4")
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

with_mock_dbi({
  con <- DBI::dbConnect(RSQLite::SQLite(), test_path("data/nycflights13.sqlite"))
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

