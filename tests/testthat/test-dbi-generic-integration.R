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

    # slightly different ways to refer to tables/schemas
    if (pkg == "RMariaDB") {
      flights_table_obj <- "flights"
      airlines_table_obj <- "airlines"
      doesnotexist_table_obj <- "doesnotexist"
    } else if (pkg == "RPostgreSQL") {
      flights_table_obj <- c(schema = schema, table = "flights")
      airlines_table_obj <- c(schema = schema, table = "airlines")
      doesnotexist_table_obj <- c(schema = schema, table = "doesnotexist")
    } else if (pkg %in% c("odbc", "RPostgres")) {
      flights_table_obj <- Id(schema = schema, table = "flights")
      airlines_table_obj <- Id(schema = schema, table = "airlines")
      doesnotexist_table_obj <- Id(schema = schema, table = "doesnotexist")
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
      # tables. For some reason, RPostgres responds that there are 0 tables with
      # dbListTables() even though there are and other functions work (including
      # the subsequent calls later) Skipping for now, since there isn't much
      # doubt that RPostgres is setup ok given our other tests.
      if (pkg == "RPostgres") {
        skip("RPostgres has something funny with dbListTables()")
      }
      if (pkg == "RPostgreSQL") {
        expect_true(all(
          c("airlines", "airports", "flights", "planes", "weather") %in%
            dbListTables(con))
        )
      } else {
        expect_true(all(
          c("airlines", "airports", "flights", "planes", "weather") %in%
            dbListTables(con, schema_name = schema))
        )
      }
    })

    dbDisconnect(con)

    with_mock_path(path = file.path(temp_dir, glue("{pkg}_integration")), {
      # recording ----
      start_db_capturing()

      con <- eval(db_pkgs[[pkg]])

      # dbGetQuery ====
      dbGetQuery(con, glue("SELECT * FROM {airlines_table} LIMIT 2"))
      dbGetQuery(con, glue("SELECT * FROM {airlines_table} LIMIT 1"))

      # dbGetQuery + regex ====
      if (pkg == "RMariaDB") {
        dot_name_regex <- "`name` REGEXP '\\.'"
      } else if (pkg == "RPostgres") {
        dot_name_regex <- "\"name\" ~ E'\\.'"
      } else if (pkg %in% c("odbc", "RPostgreSQL")) {
        dot_name_regex <- "\"name\" ~ '\\.'"
      }
      dot_names <- dbGetQuery(
        con,
        glue("SELECT * FROM {airlines_table} WHERE ({dot_name_regex}) LIMIT 3")
      )

      # dbListTables ====
      if (pkg == "RPostgreSQL") {
        tables <- dbListTables(con)
      } else {
        tables <- dbListTables(con, schema_name = schema)
      }

      # dbListFields ====
      # dbListFields is ever so slightly different for RPostgresql
      fields_flights <- dbListFields(con, flights_table_obj)

      # dbReadTable ====
      airlines_expected <- dbReadTable(con, airlines_table_obj)

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
      table_exists <- dbExistsTable(con, airlines_table_obj)
      table_does_not_exist <- dbExistsTable(con, doesnotexist_table_obj)

      # dplyr + a string ====
      require(dbplyr, quietly = TRUE)
      require(dplyr,  quietly = TRUE, warn.conflicts = FALSE)
      if (pkg == "RPostgreSQL") {
        # The _one_ place where RPostgreSQL needs `Id()` and not `c(schema, table)`
        dest_ord <- tbl(con, Id(flights_table_obj)) %>%
          filter(dest == "ORD") %>%
          collect()
      } else {
        dest_ord <- tbl(con, flights_table_obj) %>%
          filter(dest == "ORD") %>%
          collect()
      }

      # dplyr + a regex ====
      if (pkg == "RPostgreSQL") {
        # The _one_ place where RPostgreSQL needs `Id()` and not `c(schema, table)`
        dot_names_dplyr <- tbl(con, Id(airlines_table_obj)) %>%
          filter(str_detect(name, "\\.")) %>%
          collect()
      } else {
        dot_names_dplyr <- tbl(con, airlines_table_obj) %>%
          filter(str_detect(name, "\\.")) %>%
          collect()
      }

      # joins with df ====
      local_df <- nycflights13::airlines
      local_df$name_cleaned <- gsub(" Inc.", "", local_df$name)
      local_df$name <- NULL
      # RPostgreSQL does not support creation of temp tables
      if (pkg != "RPostgreSQL") {
        airlines_and_cleaned <- tbl(con, airlines_table_obj) %>%
          left_join(local_df, by = "carrier", copy = TRUE) %>%
          collect()
      }

      # dbGetRowsAffected ====
      res <- dbSendStatement(
        con,
        glue("CREATE TABLE new_one AS SELECT * FROM {airlines_table} LIMIT 4")
      )
      rows_affected <- dbGetRowsAffected(res)
      dbClearResult(res)
      # cleanup
      dbClearResult(dbSendStatement(con, "DROP TABLE new_one"))

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


        # dbGetQuery + regex ====
        # dot_name_regex is from above
        out <- dbGetQuery(
          con,
          glue("SELECT * FROM {airlines_table} WHERE ({dot_name_regex}) LIMIT 3")
        )
        expect_identical(out, dot_names)

        # dbListTables ====
        test_that(glue("dbListTables() {pkg}"), {
          if (pkg == "RPostgreSQL") {
            out <- dbListTables(con)
          } else {
            out <- dbListTables(con, schema_name = schema)
          }
          expect_identical(out, tables)
        })

        # dbListFields ====
        test_that(glue("dbListFields() {pkg}"), {
          out <- dbListFields(con, flights_table_obj)
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
          expect_identical(dbReadTable(con, airlines_table_obj), airlines_expected)
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
        test_that(glue("dbGetInfo {pkg}"), {
          skip_if(pkg == "RPostgreSQL")
          out <- dbGetInfo(con)
          expect_identical(out, con_info)
        })

        test_that(glue("simple query {pkg}"), {
          result <- dbSendQuery(
            con,
            glue("SELECT * FROM {airlines_table} LIMIT 4")
          )
          out <- dbGetInfo(result)
          dbClearResult(result)
          expect_identical(out, result_info)
        })

        # dbExistsTable ====
        test_that(glue("dbExistsTable {pkg}"), {
          expect_true(table_exists <- dbExistsTable(con, airlines_table_obj))
          expect_false(table_does_not_exist <- dbExistsTable(con, doesnotexist_table_obj))
        })

        # dbWriteTable ====
        test_that(glue("dbWriteTable {pkg}"), {
          expect_true(dbWriteTable(con, "mtcars", mtcars))
        })

        # dbRemoveTable ====
        test_that(glue("dbRemoveTable {pkg}"), {
          expect_true(dbRemoveTable(con, "mtcars"))
        })

        # dplyr + a string ----
        test_that(glue("dplyr + a string {pkg}"), {
          if (pkg == "RPostgreSQL") {
            out <- tbl(con, Id(flights_table_obj)) %>%
              filter(dest == "ORD") %>%
              collect()
          } else {
            out <- tbl(con, flights_table_obj) %>%
              filter(dest == "ORD") %>%
              collect()
          }

          expect_identical(out, dest_ord)
        })

        # dplyr + a regex ====
        test_that(glue("dplyr + a regex {pkg}"), {
          if (pkg == "odbc") {
            skip("odbc class inheritence isn't yet supported for dbplyr translations")
          }
          if (pkg == "RPostgreSQL") {
            out <- tbl(con, Id(airlines_table_obj)) %>%
              filter(str_detect(name, "\\.")) %>%
              collect()
          } else {
            out <- tbl(con, airlines_table_obj) %>%
              filter(str_detect(name, "\\.")) %>%
              collect()
          }

          expect_identical(out, dot_names_dplyr)
        })

        # joins with df ====
        test_that(glue("a join {pkg}"), {
          local_df <- nycflights13::airlines
          local_df$name_cleaned <- gsub(" Inc.", "", local_df$name)
          local_df$name <- NULL
          if (pkg == "RPostgreSQL") {
            skip("RPostgreSQL does not support creation of temp tables")
          } else {
            out <- tbl(con, airlines_table_obj) %>%
              left_join(local_df, by = "carrier", copy = TRUE) %>%
              collect()
          }

          expect_identical(out, airlines_and_cleaned)
        })


        # dbGetRowsAffected ====
        test_that(glue("dbGetRowsAffected {pkg}"), {
          res <- dbSendStatement(
            con,
            glue("CREATE TABLE new_one AS SELECT * FROM {airlines_table} LIMIT 4")
          )
          out <- dbGetRowsAffected(res)
          expect_identical(out, rows_affected)
          dbClearResult(res)
          # cleanup
          dbClearResult(dbSendStatement(con, "DROP TABLE new_one"))
        })

        # query with redaction ----
        test_that(glue("a redacted query is what we expect {pkg}"), {
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

        expect_sql(
          dbGetQuery(con, "SELECT carrier FROM airlines LIMIT 4"),
          "SELECT carrier FROM airlines LIMIT 4"
        )

        dbDisconnect(con)
      })
    })
  })
}
