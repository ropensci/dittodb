context("Test against dbplyr")
library(dbplyr)
library(dplyr)

temp_path <- file.path(temp_dir, "dbplyr_integration")

# testing against built-in sqlite database
con <- nycflights13_create_sqlite(temp_path)

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
start_db_capturing()
con <- dbConnect(RSQLite::SQLite(), temp_path)
dbListTables(con)

# record mocks for a few queries we are planning to execute below
flights_db <- tbl(con, "flights")

simple_select <- flights_db %>%
  select(year:day, dep_delay, arr_delay) %>%
  collect()

simple_filter <- flights_db %>%
  filter(dep_delay > 240) %>%
  collect()

dest_time_expect <- flights_db %>%
  group_by(dest) %>%
  summarise(delay = mean(dep_time, na.rm = TRUE)) %>%
  collect()

tailnum_delay <- flights_db %>%
  group_by(tailnum) %>%
  summarise(
    delay = mean(arr_delay, na.rm = TRUE),
    n = n()
  ) %>%
  arrange(desc(delay)) %>%
  filter(n > 100) %>%
  collect()

dbDisconnect(con)
stop_db_capturing()

# now try the whole thing again, but this time with the mock db.
with_mock_db({
  con <- dbConnect(RSQLite::SQLite(), temp_path)

  test_that("We can mock it", {
    expect_is(
      con,
      "DBIMockConnection"
    )
  })

  test_that("We can list tables", {
    expect_equal(
      dbListTables(con),
      c("airlines", "airports", "flights", "planes", "weather")
    )
  })

  # our flights table
  expect_warning(
    flights_db <- tbl(con, "flights"),
    "dbFetch `n` is ignored while mocking databases\\."
  )

  test_that("We can select columns", {
    result <- flights_db %>%
      select(year:day, dep_delay, arr_delay) %>%
      collect()

    expect_identical(result, simple_select)
  })

  test_that("We get a simple select with filter", {
    result <- flights_db %>%
      filter(dep_delay > 240) %>%
      collect()

    expect_identical(result, simple_filter)
  })

  test_that("We get a simple group by query", {
    result <- flights_db %>%
      group_by(dest) %>%
      summarise(delay = mean(dep_time, na.rm = TRUE)) %>%
      collect()

    expect_identical(result, dest_time_expect)
  })

  test_that("A more complicated 'surprising' query", {
    result <- flights_db %>%
      group_by(tailnum) %>%
      summarise(
        delay = mean(arr_delay, na.rm = TRUE),
        n = n()
      ) %>%
      arrange(desc(delay)) %>%
      filter(n > 100) %>%
      collect()

    expect_identical(result, tailnum_delay)
  })

  dbDisconnect(con)
})
