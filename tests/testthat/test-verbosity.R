context("verbosity")

# capture output to quiet testthat
capture_output({
  test_that("level 1 includes statements and hashes", {
    withr::with_options(
      c("dbtest.debug" = 1, dbtest.mock.paths = "verbosity_mock"), {
        start_capturing()
        con <- nycflights13_sqlite()
        expect_message(
          dbGetQuery(con, "SELECT * FROM airlines LIMIT 2"),
          "The statement: \nSELECT * FROM airlines LIMIT 2\nis being hased to: f2090b",
          fixed = TRUE
        )
        stop_capturing()

        with_mock_db({
          con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
          expect_message(
            dbGetQuery(con, "SELECT * FROM airlines LIMIT 2"),
            "Sending a query for the statement: \nSELECT * FROM airlines LIMIT 2\nis being hased to: f2090b",
            fixed = TRUE
          )
        })
      })
  })


  test_that("level 2 includes more", {
    withr::with_options(
      c("dbtest.debug" = 2, dbtest.mock.paths = "verbosity_mock"), {
        expect_message({
          start_capturing()
          con <- nycflights13_sqlite()
        },
        ".*Tracing.*"
        )
        expect_message(
          dbGetQuery(con, "SELECT * FROM airlines LIMIT 2"),
          "The statement: \nSELECT * FROM airlines LIMIT 2\nis being hased to: f2090b",
          fixed = TRUE
        )
        stop_capturing()

        with_mock_db({
          con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
          expect_message(
            dbGetQuery(con, "SELECT * FROM airlines LIMIT 2"),
            "Sending a query for the statement: \nSELECT * FROM airlines LIMIT 2\nis being hased to: f2090b",
            fixed = TRUE
          )
        })
      })
  })
})
