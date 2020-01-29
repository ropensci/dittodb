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


skip_locally("use postgres-docker.sh and then this can be unskipped locally")

# psql ----

# odbc ----

con_odbc <- DBI::dbConnect(
  odbc::odbc(),
  Driver = odbc_driver,
  Server = "127.0.0.1",
  Database = "postgres",
  UID = db_user,
  PWD = db_pass,
  Port = 5432
)

test_that("DBI, with a new schema creation and odbc package", {
  expect_message(
    nycflights13_sql(con_odbc, schema = "new_schema"),
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
    nycflights13_sql(con_odbc, schema = "new_schema"),
    "Creating the testing database from nycflights13"
  )
})

dbDisconnect(con_odbc)

# rpostgresql ----

con_rpostgresql <- RPostgreSQL::dbConnect(
  drv = DBI::dbDriver("PostgreSQL"),
  host = "127.0.0.1",
  dbname = "postgres",
  user = db_user,
  password = db_pass,
  port = 5432
)

test_that("DBI, with a new schema creation and rpostgresql package", {
  expect_message(
    nycflights13_sql(con_rpostgresql, schema = "new_schema_rpostgresql"),
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
    nycflights13_sql(con_rpostgresql, schema = "new_schema_rpostgresql"),
    "Creating the testing database from nycflights13"
  )
})

dbDisconnect(con_rpostgresql)

# rpostgres ----
test_that("RPostgres", {
  skip_env("RPostgres")

  con_rpostgres <- DBI::dbConnect(
    drv = RPostgres::Postgres(),
    host = "127.0.0.1",
    dbname = "postgres",
    user = db_user,
    password = db_pass,
    port = 5432
  )

  test_that("DBI, with a new schema creation and rpostgres package", {
    expect_message(
      nycflights13_sql(con_rpostgres, schema = "new_schema"),
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
      nycflights13_sql(con_rpostgres, schema = "new_schema"),
      "Creating the testing database from nycflights13"
    )
  })

  dbDisconnect(con_rpostgres)
})
