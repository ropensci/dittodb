db_pkgs <- list(
  "odbc" = list(
    odbc::odbc(),
    Driver = odbc_driver,
    Server = "127.0.0.1",
    Database = "nycflights",
    UID = db_user,
    PWD = db_pass,
    Port = 5432
  ),
  "RMariaDB" = list(
    RMariaDB::MariaDB(),
    dbname = "nycflights",
    host = "127.0.0.1",
    username = "travis",
    password = ""
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

lapply(names(db_pkgs), function(pkg) {
  context(glue("Integration tests for {pkg}"))
  test_that(glue("Isolate {pkg}"), {
    skip_env(pkg)
    # skip_locally("use (postgres|mariadb)-docker.sh and test manually")

    # setup the database that will be mocked and then tested
    con <- do.call(DBI::dbConnect, db_pkgs[[pkg]])

    if (pkg == "odbc") {
      schema <- "nycflights"
      con <- nycflights13_sql(con, schema = schema)
      airlines_table <- paste(schema, "airlines", sep = ".")
    } else {
      con <- nycflights13_sql(con)
      airlines_table <- "airlines"
    }



    test_that("The fixture is what we expect", {
      # we check just that the tables are there since other tests will add other tables
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

        test_that("Our connection is a mock connection", {
          expect_is(
            con,
            "DBIMockConnection"
          )
        })
        test_that("We can use mocks for dbGetQuery", {
          expect_identical(
            dbGetQuery(con, glue("SELECT * FROM {airlines_table} LIMIT 2")),
            data.frame(
              carrier = c("9E", "AA"),
              name = c("Endeavor Air Inc.", "American Airlines Inc."),
              stringsAsFactors = FALSE
            )
          )
        })

        test_that("We can use mocks for dbSendQuery", {
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

        test_that("A different query uses a different mock", {
          expect_identical(
            dbGetQuery(con, glue("SELECT * FROM {airlines_table} LIMIT 1")),
            data.frame(
              carrier = c("9E"),
              name = c("Endeavor Air Inc."),
              stringsAsFactors = FALSE
            )
          )
        })

        test_that("dbListTables()", {
          out <- dbListTables(con)
          expect_identical(tables, out)
        })

        dbDisconnect(con)
      })
    })
  })
})
