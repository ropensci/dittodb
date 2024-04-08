# This should be run first so that the .dittodb_env environment is clean.

test_that("We can capture db interactions", {
  # our state environment is empty
  expect_null(.dittodb_env$curr_file_path)
  expect_null(.dittodb_env$db_path)

  start_db_capturing()
  suppressMessages(con <- nycflights13_create_sqlite(verbose = FALSE))

  # our state has been updated
  expect_identical(.dittodb_env$db_path, file.path(temp_dir, "_memory_"))

  # make a query
  result <- dbSendQuery(con, "SELECT * FROM airlines")

  # our state has been updated
  expect_identical(
    .dittodb_env$curr_file_path,
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
  suppressMessages(con <- nycflights13_create_sqlite())

  # our state has been updated
  expect_identical(.dittodb_env$db_path, file.path(new_path, "_memory_"))

  dbDisconnect(con)
  stop_db_capturing()
})

test_that("dbGetQuery error checking", {
  # Check to make sure con was not created before start_db_capturing()
  suppressMessages(con <- nycflights13_create_sqlite(verbose = FALSE))

  start_db_capturing()

  # Testthat sets this to "tests/testthat//_memory_"
  # Setting this to NULL so it will mimic a developers experience
  .dittodb_env$db_path <- NULL

  regex_db <- "^Database capture failed"

  error_get_query <- expect_error(
    object = dbGetQuery(con, "SELECT * FROM airlines"),
    regexp = regex_db
  )

  testthat_transition(
    old = expect_error(dbListTables(con), regex_db),
    new = expect_error(expect_error(dbListTables(con)), regex_db)
  )

  testthat_transition(
    old = expect_error(dbListFields(con, "airlines"), regex_db),
    new = expect_error(expect_error(dbListFields(con, "airlines")), regex_db)
  )

  testthat_transition(
    old = expect_error(dbExistsTable(con, "airlines"), regex_db),
    new = expect_error(expect_error(dbExistsTable(con, "airlines")), regex_db)
  )

  error_tbl <- expect_error(dplyr::tbl(con, "airlines"), regex_db)

  suppressWarnings(dbDisconnect(con))
  stop_db_capturing()
})
