context("Recording db interactions")
# This should be run first so that the .dbtest_env environment is clean.

test_that("We can capture db interactions", {
  # our state environment is empty
  expect_null(.dbtest_env$curr_file_path)
  expect_null(.dbtest_env$db_path)

  start_db_capturing()
  con <- nycflights13_sqlite()

  # our state has been updated
  expect_identical(.dbtest_env$db_path, file.path(temp_dir, "_memory_"))

  # make a query
  result <- dbSendQuery(con, "SELECT * FROM airlines")

  # our state has been updated
  expect_identical(
    .dbtest_env$curr_file_path,
    file.path(temp_dir, "_memory_/SELECT-b1fffc.R")
  )

  # get a query
  dbFetch(result)

  # ensure the file is saved
  expect_true(file.exists(file.path(temp_dir, "_memory_/SELECT-b1fffc.R")))

  # clear result, disconnect
  dbClearResult(result)
  dbDisconnect(con)
  stop_db_capturing()
})

test_that("We can specify the path when starting capture", {
  new_path <- file.path(temp_dir, "start_capture_path")
  start_db_capturing(new_path)
  con <- nycflights13_sqlite()

  # our state has been updated
  expect_identical(.dbtest_env$db_path, file.path(new_path, "_memory_"))

  dbDisconnect(con)
  stop_db_capturing()
})
