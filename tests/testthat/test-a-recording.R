context("Recording db interactions")
# TODO: Figure out why if this is run after a section `with_mock_db` it errors
# during testing. It doesn't appear to impact interactive use.

# use a temp directory so we don't have to cleanup later
temp_dir <- tempdir()
.mockPaths(temp_dir)

test_that("We can capture db interactions", {
  # our state environment is empty
  expect_null(.dbtest_env$curr_file_path)
  expect_null(.dbtest_env$db_path)

  start_capturing()


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

  stop_capturing()
})
