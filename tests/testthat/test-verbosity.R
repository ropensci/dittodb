# capture output to quiet testthat
capture_output({
  test_that("level 1 includes statements and hashes", {
    withr::with_options(c(
      "dittodb.debug" = 1,
      dittodb.mock.paths = file.path(temp_dir, "verbosity_mock")
    ), {
      suppressMessages(expect_message(start_db_capturing()))
      suppressMessages(con <- nycflights13_create_sqlite())
      expect_message(
        expect_message(
          dbGetQuery(con, "SELECT * FROM airlines LIMIT 2"),
          paste0(
            "The statement: \nSELECT * FROM airlines LIMIT 2\nis being hased to:",
            " f2090b"
          ),
          fixed = TRUE
        ),
        "Writing to .*SELECT-f2090b.R"
      )

      dbDisconnect(con)
      suppressMessages(stop_db_capturing())

      with_mock_db({
        con <- dbConnect(RSQLite::SQLite(), ":memory:")
        expect_message(
          dbGetQuery(con, "SELECT * FROM airlines LIMIT 2"),
          paste0(
            "Sending a query for the statement: \nSELECT * FROM airlines LIMIT",
            " 2\nis being hased to: f2090b"
          ),
          fixed = TRUE
        )
        dbDisconnect(con)
      })
    })
  })


  test_that("level 2 includes more", {
    withr::with_options(c(
      "dittodb.debug" = 2,
      dittodb.mock.paths = file.path(temp_dir, "verbosity_mock")
    ), {
      suppressMessages(expect_message({
          start_db_capturing()
          con <- nycflights13_create_sqlite()
        }, ".*Tracing.*"
      ))
      expect_message(
        expect_message(
          dbGetQuery(con, "SELECT * FROM airlines LIMIT 2"),
          paste0(
            "The statement: \nSELECT * FROM airlines LIMIT 2\nis being hased to:",
            " f2090b"
          ),
          fixed = TRUE
        )
      )
      dbDisconnect(con)
      suppressMessages(stop_db_capturing())

      with_mock_db({
        con <- dbConnect(RSQLite::SQLite(), ":memory:")
        expect_message(
          dbGetQuery(con, "SELECT * FROM airlines LIMIT 2"),
          paste0(
            "Sending a query for the statement: \nSELECT * FROM airlines LIMIT",
            " 2\nis being hased to: f2090b"
          ),
          fixed = TRUE
        )
        dbDisconnect(con)
      })
    })
  })
})
