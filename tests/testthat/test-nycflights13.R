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


skip_locally("use postgres-docker.sh and then this can be unskipped locally")

con <- dbConnect(
  RPostgreSQL::PostgreSQL(),
  dbname = "nycflights",
  host = "127.0.0.1",
  user = "travis",
  password = ""
)

test_that("DBI, with a new schema creation", {
  expect_message(
    nycflights13_sql(con, schema = "new_schema"),
    paste0(c(
      "using DBI to create the database",
      "Creating table: airlines",
      "Creating table: airports",
      "Creating table: flights",
      "Creating table: planes",
      "Creating table: weather"
    ),
    collapse = "|"
    )
  )
})

test_that("DBI, with a same schema creation", {
  expect_message(
    nycflights13_sql(con, schema = "new_schema"),
    "using DBI to create the database"
  )
})

test_that("dplyr, with a new schema creation", {
  expect_message(
    nycflights13_sql(con, method = "dplyr", schema = "other_schema"),
    paste0(c(
      "using dplyr to create the database",
      "Creating table: airlines",
      "Creating table: airports",
      "Creating table: flights",
      "Creating table: planes",
      "Creating table: weather"
    ),
    collapse = "|"
    )
  )
})

dbDisconnect(con)
