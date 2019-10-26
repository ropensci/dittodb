# sqlite ----

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
})


# skip_locally("use postgres-docker.sh and then this can be unskipped locally")

# psql ----

connections <- list(
  odbc = DBI::dbConnect(
    odbc::odbc(),
    Driver   = "PostgreSQL Unicode",
    Server   = "127.0.0.1",
    Database = "postgres",
    UID      = "travis",
    PWD      = "",
    Port     = 5432
  ),
  rpostgresql = RPostgreSQL::dbConnect(
    drv      = DBI::dbDriver("PostgreSQL"),
    host     = "127.0.0.1",
    dbname   = "postgres",
    user     = "travis",
    password = "",
    port     = 5432
  ),
  rpostgres = DBI::dbConnect(
    drv      = RPostgres::Postgres(),
    host     = "127.0.0.1",
    dbname   = "postgres",
    user     = "travis",
    password = "",
    port     = 5432
  )
)

# odbc ----

test_that("DBI, with a new schema creation and odbc package", {
  expect_message(
    nycflights13_sql(connections$odbc, schema = "new_schema"),
    paste0(c(
      "Creating the testing database from nycflights13",
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

test_that("DBI, with a same schema creation and odbc package", {
  expect_message(
    nycflights13_sql(connections$odbc, schema = "new_schema"),
    "Creating the testing database from nycflights13"
  )
})

dbDisconnect(connections$odbc)

# rpostgresql ----

test_that("DBI, with a new schema creation and rpostgresql package", {
  expect_message(
    nycflights13_sql(connections$rpostgresql, schema = "new_schema"),
    paste0(c(
      "Creating the testing database from nycflights13",
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

test_that("DBI, with a same schema creation and rpostgresql package", {
  expect_message(
    nycflights13_sql(connections$rpostgresql, schema = "new_schema"),
    "Creating the testing database from nycflights13"
  )
})

dbDisconnect(connections$rpostgresql)

# rpostgres ----

test_that("DBI, with a new schema creation and rpostgres package", {
  expect_message(
    nycflights13_sql(connections$rpostgres, schema = "new_schema"),
    paste0(c(
      "Creating the testing database from nycflights13",
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

test_that("DBI, with a same schema creation and rpostgres package", {
  expect_message(
    nycflights13_sql(connections$rpostgres, schema = "new_schema"),
    "Creating the testing database from nycflights13"
  )
})

dbDisconnect(connections$rpostgres)
