context("Test against dbplyr")
library(dbplyr)
library(dplyr)

temp_path <- file.path(temp_dir, "dbplyr_integration")

# testing against built-in sqlite database
con <- nycflights13_sqlite(temp_path)

test_that("The fixture is what we expect", {
  expect_identical(
    dbListTables(con),
    c("airlines", "airports", "flights", "planes", "weather")
  )

  expect_identical(
    dbGetQuery(con, "SELECT * FROM airlines"),
    as.data.frame(nycflights13::airlines)
  )
})

dbDisconnect(con)

# test with the mock db using some captured mocks
start_capturing()
con <- dbConnect(RSQLite::SQLite(), temp_path)
dbListTables(con) # we have to list tables in order to have the mocks work below

# record mocks for a few queries we are planning to execute below
tbl(con, "flights") %>%
  filter(dep_delay > 240) %>%
  collect()

dbDisconnect(con)
stop_capturing()

# now try the whole thing again, but this time with the mock db.
with_mock_db({
  con <- dbConnect(RSQLite::SQLite(), temp_path)

  test_that("We can mock it", {
    expect_is(
      con,
      "DBIMockConnection"
    )
  })

  test_that("We get our special query", {
    expect_warning({
      result <- tbl(con, "flights") %>%
        filter(dep_delay > 240) %>%
        collect()
    },
    "dbFetch `n` is ignored while mocking databases."
    )


    expected <- as_tibble(nycflights13::flights)[1:1000,]
    expected <- subset(expected, dep_delay > 240)
    # because sqlite doesn't handle datetimes well, convert to numeric
    expected$time_hour <- as.numeric(expected$time_hour)

    expect_identical(result, expected)
  })

  dbDisconnect(con)
})
