db_pkgs <- list(
  "RMariaDB" = list(
    RMariaDB::MariaDB(),
    dbname = "nycflights",
    host = "127.0.0.1",
    username = "travis",
    password = ""
  ),
  "odbc" = list(
    odbc::odbc(),
    Driver = odbc_driver,
    Server = "127.0.0.1",
    Database = "nycflights",
    UID = db_user,
    PWD = db_pass,
    Port = 5432
  ),
  "RPostgres" = list(
    RPostgres::Postgres(),
    dbname = "nycflights",
    host = "127.0.0.1",
    user = db_user,
    password = db_pass
  ),
  "RPostgreSQL" = list(
    RPostgreSQL::PostgreSQL(),
    dbname = "nycflights",
    host = "127.0.0.1",
    user = db_user,
    password = db_pass
  )
)
# db_pkgs <- db_pkgs["RMariaDB"]
for (pkg in names(db_pkgs)) {
  context(glue("Integration tests for {pkg}"))
  test_that(glue("Isolate {pkg}"), {
    skip_env(pkg)
    # skip_locally("use (postgres|mariadb)-docker.sh and test manually")

    # setup the database that will be mocked and then tested
    con <- do.call(DBI::dbConnect, db_pkgs[[pkg]])

    # Setup unique schemas for each of the Postgres-using drivers
    if (pkg == "odbc") {
      schema <- "odbc"
    } else if (pkg == "RPostgreSQL") {
      schema <- "rpostgresql"
    } else if (pkg == "RPostgres") {
      schema <- "rpostgres"
    } else {
      schema <- ""
    }
    con <- nycflights13_sql(con, schema = schema)


    if (schema == "") {
      airlines_table <- "airlines"
    } else {
      airlines_table <- paste(schema, "airlines", sep = ".")
    }




    test_that(glue("The fixture is what we expect: {pkg}"), {
      # we check just that the tables are there since other tests will add other tables
      print(dbListTables(con))
      expect_true(all(
        c("airlines", "airports", "flights", "planes", "weather") %in% dbListTables(con)
      ))

      expect_identical(
        dbGetQuery(con, glue("SELECT * FROM {airlines_table} LIMIT 2")),
        data.frame(
          carrier = c("9E", "AA"),
          name = c("Endeavor Air Inc.", "American Airlines Inc."),
          stringsAsFactors = FALSE
        )
      )
    })

    dbDisconnect(con)

    with_mock_path(path = file.path(temp_dir, glue("{pkg}_integration")), {
      start_capturing()

      con <- do.call(dbConnect, db_pkgs[[pkg]])

      dbGetQuery(con, glue("SELECT * FROM {airlines_table} LIMIT 2"))
      dbGetQuery(con, glue("SELECT * FROM {airlines_table} LIMIT 1"))

      tables <- dbListTables(con)

      dbDisconnect(con)
      stop_capturing()


      with_mock_db({
        con <- do.call(DBI::dbConnect, db_pkgs[[pkg]])

        test_that(glue("Our connection is a mock connection {pkg}"), {
          expect_is(
            con,
            "DBIMockConnection"
          )
        })
        test_that(glue("We can use mocks for dbGetQuery {pkg}"), {
          expect_identical(
            dbGetQuery(con, glue("SELECT * FROM {airlines_table} LIMIT 2")),
            data.frame(
              carrier = c("9E", "AA"),
              name = c("Endeavor Air Inc.", "American Airlines Inc."),
              stringsAsFactors = FALSE
            )
          )
        })

        test_that(glue("We can use mocks for dbSendQuery {pkg}"), {
          result <- dbSendQuery(con, glue("SELECT * FROM {airlines_table} LIMIT 2"))
          expect_identical(
            dbFetch(result),
            data.frame(
              carrier = c("9E", "AA"),
              name = c("Endeavor Air Inc.", "American Airlines Inc."),
              stringsAsFactors = FALSE
            )
          )
        })

        test_that(glue("A different query uses a different mock {pkg}"), {
          expect_identical(
            dbGetQuery(con, glue("SELECT * FROM {airlines_table} LIMIT 1")),
            data.frame(
              carrier = c("9E"),
              name = c("Endeavor Air Inc."),
              stringsAsFactors = FALSE
            )
          )
        })

        test_that(glue("dbListTables() {pkg}"), {
          out <- dbListTables(con)
          expect_identical(tables, out)
        })

        dbDisconnect(con)
      })
    })
  })
}
