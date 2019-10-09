context("Test fixture")
library(dplyr)
library(nycflights13)

# testing against built-in sqlite database
con <- nycflights13_sqlite()

test_that("The fixture is what we expect", {
  expect_identical(
    src_tbls(con),
    c("airlines", "airports", "flights", "planes", "sqlite_stat1", "sqlite_stat4", "weather")
  )

  expect_identical(
    tbl(con, "airlines") %>% collect(),
    as_tibble(airlines)
  )
})

rm(con)

# test with the mock db using the mocks in the tests/testthat/mocks/ directory
with_mock_db({
  con <- nycflights13_sqlite()

  test_that("We can mock it", {
    expect_is(
      con,
      "DBIMockConnection"
    )
  })

  test_that("We get our special query", {
    expect_identical(
      tbl(con, "airlines") %>% collect(),
      as_tibble(airlines)
    )
  })
})
