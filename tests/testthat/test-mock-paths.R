context("Mock paths")

# use a new temp directory so we don't have to cleanup later
with_mock_path(path = "new_mock_path", {
  # we can use an entirely different mock path (and with a named argument)
  with_mock_db({
    con <- DBI::dbConnect(RSQLite::SQLite(), dbname = "new_db")
    test_that("The connection has a new path", {
      expect_identical(con@path, "new_db")
    })

    test_that("We can use mocks from the new path", {
      expect_identical(
        dbGetQuery(con, "SELECT * FROM airlines LIMIT 1"),
        data.frame(
          carrier = c("9E"),
          name = c("Endeavor Air Inc."),
          stringsAsFactors = FALSE
        )
      )
    })
  })
})


