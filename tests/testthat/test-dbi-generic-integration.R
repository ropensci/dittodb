# A list of connections to be made and then used for integreation tests. This
# allows us to write each integration test once and then run them on all of the
# supported DB packages.
#
# The reason we are quoting the connection and evaluating and that RMariaDB must
# be first is that RMariDB and RPostgres interact in funny ways when they are
# called in the other order, see: https://github.com/r-dbi/RMariaDB/issues/119
# This should be resolved already, but it still sometimes crops up.
db_pkgs <- list(
  "RMariaDB" = quote(dbConnect(
    RMariaDB::MariaDB(),
    dbname = "nycflights",
    host = "127.0.0.1",
    username = db_user,
    password = "",
    port = testing_port("maria")
  )),
  "odbc" = quote(dbConnect(
    odbc::odbc(),
    Driver = odbc_driver,
    Server = "127.0.0.1",
    Database = "nycflights",
    UID = db_user,
    PWD = db_pass,
    Port = testing_port("postgres")
  )),
  "RPostgreSQL" = quote(dbConnect(
    RPostgreSQL::PostgreSQL(),
    dbname = "nycflights",
    host = "127.0.0.1",
    user = db_user,
    password = db_pass,
    port = testing_port("postgres")
  )),
  "RPostgres" = quote(dbConnect(
    RPostgres::Postgres(),
    dbname = "nycflights",
    host = "127.0.0.1",
    user = db_user,
    password = db_pass,
    port = testing_port("postgres")
  ))
)

# The lintr complains about cyclomatic complexity here because of the stacked
# calls needed for test_that + dittodb + database calls.
# nolint start
for (pkg in names(db_pkgs)) {
  test_that(glue("Integration tests for {pkg}"), {
    skip_env(pkg)

    # setup the database that will be mocked and then tested
    con <- eval(db_pkgs[[pkg]])
    expect_s4_class(con, "DBIConnection")

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

    if (schema == "") {
      airlines_table <- "airlines"
      flights_table <- "flights"
    } else {
      airlines_table <- paste(schema, "airlines", sep = ".")
      flights_table <- paste(schema, "flights", sep = ".")
    }

    test_that(glue("The fixture is what we expect: {pkg}"), {
      expect_identical(
        dbGetQuery(con, glue("SELECT * FROM {airlines_table} LIMIT 2")),
        data.frame(
          carrier = c("9E", "AA"),
          name = c("Endeavor Air Inc.", "American Airlines Inc."),
          stringsAsFactors = FALSE
        )
      )

      # we check just that the tables are there since other tests will add other
      # tables For some reason, RPostgres responds that there are 0 tables with
      # dbListTables() even though there are and other functions work (including
      # the subsequent calls later) Skipping for now, since there isn't much
      # doubt that RPostgres is setup ok given our other tests.
      if (pkg == "RPostgres") {
        skip("RPostgres has something funny with dbListTables()")
      }
      expect_true(all(
        c("airlines", "airports", "flights", "planes", "weather") %in%
          dbListTables(con))
      )
    })

    dbDisconnect(con)

    with_mock_path(path = file.path(temp_dir, glue("{pkg}_integration")), {
      # recording ----
      start_db_capturing()

      con <- eval(db_pkgs[[pkg]])

      # dbGetQuery ====
      dbGetQuery(con, glue("SELECT * FROM {airlines_table} LIMIT 2"))
      dbGetQuery(con, glue("SELECT * FROM {airlines_table} LIMIT 1"))

      # dbListTables ====
      tables <- dbListTables(con)

      # dbListFields ====
      # dbListFields is ever so slightly different for each
      if (pkg == "RMariaDB") {
        fields_flights <- dbListFields(con, "flights")
      } else if (pkg == "odbc") {
        fields_flights <- dbListFields(
          con,
          Id(schema = schema, table = "flights")
        )
      } else if (pkg == "RPostgreSQL") {
        fields_flights <- dbListFields(con, c(schema, "flights"))
      } else if (pkg == "RPostgres") {
        fields_flights <- dbListFields(
          con,
          Id(schema = schema, table = "flights")
        )
      }

      # dbReadTable ====
      if (pkg == "RMariaDB") {
        airlines_expected <- dbReadTable(con, "airlines")
      } else if (pkg == "odbc") {
        airlines_expected <- dbReadTable(
          con,
          Id(schema = schema, table = "airlines")
        )
      } else if (pkg == "RPostgreSQL") {
        airlines_expected <- dbReadTable(con, c(schema, "airlines"))
      } else if (pkg == "RPostgres") {
        airlines_expected <- dbReadTable(
          con, Id(schema = schema, table = "airlines")
        )
      }

      # dbClearResult ====
      res <- dbSendQuery(con, glue("SELECT * FROM {airlines_table} LIMIT 2"))
      airlines_col_info <- dbColumnInfo(res)
      dbClearResult(res)

      # dbGetInfo ====
      con_info <- dbGetInfo(con)

      result <- dbSendQuery(con, glue("SELECT * FROM {airlines_table} LIMIT 4"))
      result_info <- dbGetInfo(result)
      dbClearResult(result)

      # dbExistsTable ====
      # dbExistsTable is ever so slightly different for each
      if (pkg == "RMariaDB") {
        table_exists <- dbExistsTable(con, "airlines")
        table_does_not_exist <- dbExistsTable(con, "doesnotexist")
      } else if (pkg == "odbc") {
        table_exists <- dbExistsTable(
          con,
          Id(schema = schema, table = "airlines")
        )
        table_does_not_exist <- dbExistsTable(
          con,
          Id(schema = schema, table = "doesnotexist")
        )
      } else if (pkg == "RPostgreSQL") {
        table_exists <- dbExistsTable(con, c(schema, "airlines"))
        table_does_not_exist <- dbExistsTable(con, c(schema, "doesnotexist"))
      } else if (pkg == "RPostgres") {
        table_exists <- dbExistsTable(
          con,
          Id(schema = schema, table = "airlines")
        )
        table_does_not_exist <- dbExistsTable(
          con,
          Id(schema = schema, table = "doesnotexist")
        )
      }

      dbDisconnect(con)
      stop_db_capturing()

      # capturing with redaction ----
      redact_columns <- c("year", "origin", "distance", "time_hour")
      start_db_capturing(redact_columns = redact_columns)

      con <- eval(db_pkgs[[pkg]])

      unredacted_flights <- dbGetQuery(
        con,
        glue("SELECT * FROM {flights_table} LIMIT 2")
      )

      dbDisconnect(con)
      stop_db_capturing()

      # using fixtures ----
      with_mock_db({
        con <- eval(db_pkgs[[pkg]])

        # connection object ====
        test_that(glue("Our connection is a mock connection {pkg}"), {
          expect_s4_class(con, "DBIMockConnection")
        })

        # dbGetQuery/dbSendquery ====
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
          result <- dbSendQuery(
            con,
            glue("SELECT * FROM {airlines_table} LIMIT 2")
          )
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

        # dbListTables ====
        test_that(glue("dbListTables() {pkg}"), {
          out <- dbListTables(con)
          expect_identical(out, tables)
        })

        # dbListFields ====
        test_that(glue("dbListFields() {pkg}"), {
          # dbListFields is ever so slightly different for each
          if (pkg == "RMariaDB") {
            out <- dbListFields(con, "flights")
          } else if (pkg == "odbc") {
            out <- dbListFields(con, Id(schema = schema, table = "flights"))
          } else if (pkg == "RPostgreSQL") {
            out <- dbListFields(con, c(schema, "flights"))
          } else if (pkg == "RPostgres") {
            out <- dbListFields(con, Id(schema = schema, table = "flights"))
          }
          expect_identical(out, fields_flights)
          expect_identical(out, c(
            "year", "month", "day", "dep_time", "sched_dep_time", "dep_delay",
            "arr_time", "sched_arr_time", "arr_delay", "carrier", "flight",
            "tailnum", "origin", "dest", "air_time", "distance", "hour",
            "minute", "time_hour"
          ))
        })

        # dbReadTable ====
        test_that(glue("dbReadTable() {pkg}"), {
          if (pkg == "RMariaDB") {
            out <- dbReadTable(con, "airlines")
          } else if (pkg == "odbc") {
            out <- dbReadTable(con, Id(schema = schema, table = "airlines"))
          } else if (pkg == "RPostgreSQL") {
            out <- dbReadTable(con, c(schema, "airlines"))
          } else if (pkg == "RPostgres") {
            out <- dbReadTable(con, Id(schema = schema, table = "airlines"))
          }
          expect_identical(out, airlines_expected)
        })

        # dbClearResult====
        test_that(glue("dbClearResult {pkg}"), {
          result <- dbSendQuery(
            con,
            glue("SELECT * FROM {airlines_table} LIMIT 3")
          )
          expect_true(dbClearResult(result))
        })

        # dbColumnInfo ====
        test_that(glue("dbColumnInfo {pkg}"), {
          res_out <- dbSendQuery(
            con,
            glue("SELECT * FROM {airlines_table} LIMIT 2")
          )
          out <- dbColumnInfo(res_out)
          expect_identical(out, airlines_col_info)
          dbClearResult(res_out)
        })

        # dbGetInfo ====
        test_that("dbGetInfo", {
          skip_if(pkg == "RPostgreSQL")
          out <- dbGetInfo(con)
          expect_identical(out, con_info)
        })

        test_that("dbGetInfo", {
          result <- dbSendQuery(
            con,
            glue("SELECT * FROM {airlines_table} LIMIT 4")
          )
          out <- dbGetInfo(result)
          dbClearResult(result)
          expect_identical(out, result_info)
        })

        # dbExistsTable ====
        test_that("dbGetInfo", {
          if (pkg == "RMariaDB") {
            expect_true(table_exists <- dbExistsTable(con, "airlines"))
            expect_false(table_does_not_exist <- dbExistsTable(con, "doesnotexist"))
          } else if (pkg == "odbc") {
            expect_true(table_exists <- dbExistsTable(
              con,
              Id(schema = schema, table = "airlines")
            ))
            expect_false(table_does_not_exist <- dbExistsTable(
              con,
              Id(schema = schema, table = "doesnotexist")
            ))
          } else if (pkg == "RPostgreSQL") {
            expect_true(table_exists <- dbExistsTable(con, c(schema, "airlines")))
            expect_false(table_does_not_exist <- dbExistsTable(con, c(schema, "doesnotexist")))
          } else if (pkg == "RPostgres") {
            expect_true(table_exists <- dbExistsTable(
              con,
              Id(schema = schema, table = "airlines")
            ))
            expect_false(table_does_not_exist <- dbExistsTable(
              con,
              Id(schema = schema, table = "doesnotexist")
            ))
          }
        })

        # dbWriteTable ====
        test_that("dbWriteTable", {
          expect_true(dbWriteTable(con, "mtcars", mtcars))
        })

        # dbRemoveTable ====
        test_that("dbRemoveTable", {
          expect_true(dbRemoveTable(con, "mtcars"))
        })

        # query with redaction ----
        test_that("a redacted query is what we expect", {
          # the output of the recorded query is _not_ redacted, so we'll need to
          # redact them before checking
          redacted_flights <- unredacted_flights
          redacted_flights$year <- 9L
          redacted_flights$origin <- "[redacted]"
          redacted_flights$distance <- 9
          timezone <- attributes(redacted_flights$time_hour)$tzone %||% "EST"
          redacted_flights$time_hour <- as.POSIXct(
            "1988-10-11T17:00:00",
            tz = timezone
          )

          out <- dbGetQuery(con, glue("SELECT * FROM {flights_table} LIMIT 2"))
          expect_identical(out, redacted_flights)

          expect_equal(out$year, rep(9L, 2))
          expect_equal(out$origin, rep("[redacted]", 2))
          expect_equal(out$distance, rep(9, 2))
          expect_equal(
            out$time_hour,
            rep(as.POSIXct("1988-10-11T17:00:00", tz = timezone), 2)
          )
        })

        dbDisconnect(con)
      })
    })
  })
}

# nolint end
