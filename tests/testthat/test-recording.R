context("Recording db interactions")

test_that("We can capture db interactions", {

  # our state environment is empty
  expect_null(.dbtest_env$curr_file_path)
  expect_null(.dbtest_env$db_path)

  start_capturing()

  con <- nycflights13_sql(sqlite = TRUE)

  # our state has been updated
  expect_identical(.dbtest_env$db_path, "_memory_")

  # make a query
  result <- dbSendQuery(con, "SELECT * FROM airlines")

  # our state has been updated
  expect_identical(
    .dbtest_env$curr_file_path,
    "_memory_/SELECT-b1fffc.R"
  )

  # get a query
  dbFetch(result)

  # ensure the file is saved
  expect_true(file.exists("_memory_/SELECT-b1fffc.R"))

  dbDisconnect(con)

  stop_capturing()
})
