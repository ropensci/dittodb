dbs <- list(
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
  ),
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
  )
)

lapply(names(dbs), function(db) {
  context(glue::glue("Integration tests for {db}"))
  test_that("foo",{
    skip_env(db)
    # skip_locally("use (postgres|mariadb)-docker.sh and test manually")

    library(db, character.only = TRUE)

    # setup the database that will be mocked and then tested
    con <- do.call(DBI::dbConnect, dbs[[db]])

    con <- nycflights13_sql(con)

    test_that("The fixture is what we expect", {
      # we check just that the tables are there since other tests will add other tables
      expect_true(all(
        c("airlines", "airports", "flights", "planes", "weather") %in% dbListTables(con)
      ))

      expect_identical(
        dbGetQuery(con, "SELECT * FROM airlines LIMIT 2"),
        data.frame(
          carrier = c("9E", "AA"),
          name = c("Endeavor Air Inc.", "American Airlines Inc."),
          stringsAsFactors = FALSE
        )
      )
    })

    dbDisconnect(con)

    with_mock_path(path = file.path(temp_dir, glue::glue("{db}_integration")), {
      start_capturing()

      con <- do.call(DBI::dbConnect, dbs[[db]])

      dbGetQuery(con, "SELECT * FROM airlines LIMIT 2")
      dbGetQuery(con, "SELECT * FROM airlines LIMIT 1")

      tables <- dbListTables(con)

      dbDisconnect(con)
      stop_capturing()


      with_mock_db({
        con <- do.call(DBI::dbConnect, dbs[[db]])

        test_that("Our connection is a mock connection", {
          expect_is(
            con,
            "DBIMockConnection"
          )
        })

        test_that("We can use mocks for dbGetQuery", {
          expect_identical(
            dbGetQuery(con, "SELECT * FROM airlines LIMIT 2"),
            data.frame(
              carrier = c("9E", "AA"),
              name = c("Endeavor Air Inc.", "American Airlines Inc."),
              stringsAsFactors = FALSE
            )
          )
        })

        test_that("We can use mocks for dbSendQuery", {
          result <- dbSendQuery(con, "SELECT * FROM airlines LIMIT 2")
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
            dbGetQuery(con, "SELECT * FROM airlines LIMIT 1"),
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
  detach(db, unload=TRUE)
})
