
test_that("stop_mock_db() doesn't fail if there is no DB being mocked", {
  expect_message(
    expect_null(stop_mock_db()),
    "There is no mock database being used."
  )
})

start_mock_db()

con <- dbConnect(RSQLite::SQLite(), dbname = "new_db")
test_that("The connection has a new path", {
  expect_identical(con@path, "new_db")
})

test_that("We can use mocks from the new path", {
  expect_identical(
    dbGetQuery(con, "SELECT * FROM airlines LIMIT 3"),
    data.frame(
      carrier = c("9E", "AA", "AS"),
      name = c(
        "Endeavor Air Inc.",
        "American Airlines Inc.",
        "Alaska Airlines Inc."
      ),
      stringsAsFactors = FALSE
    )
  )
})

dbDisconnect(con)

stop_mock_db()

test_that("stop_mock_db() doesn't fail if there is no DB being mocked", {
  expect_message(
    expect_null(stop_mock_db()),
    "There is no mock database being used."
  )
})
