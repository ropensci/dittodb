test_that("Error handling", {
  expect_warning(
    dbMockConnect(data.frame(), dbname = "name"),
    paste0(
      "data.frame is an unknown driver, dittodb will have limited functionality"
    )
  )
})

test_that("register_table_alias_with_as registers when dbplyr has the generic", {
  # dbplyr >= 2.6.0 doesn't have db_supports_table_alias_with_as(), so mock
  # both branches to test regardless of which dbplyr is installed
  registered <- NULL
  local_mocked_bindings(
    dbplyr_has_table_alias_with_as = function() TRUE,
    s3_register = function(generic, class, method) {
      registered <<- list(generic = generic, class = class, method = method)
    }
  )

  register_table_alias_with_as("DBIMockFakeConnection", FALSE)
  expect_identical(registered$generic, "dbplyr::db_supports_table_alias_with_as")
  expect_identical(registered$class, "DBIMockFakeConnection")
  expect_false(registered$method(NULL))

  register_table_alias_with_as("DBIMockFakeConnection", TRUE)
  expect_true(registered$method(NULL))
})

test_that("register_table_alias_with_as skips when dbplyr lacks the generic", {
  local_mocked_bindings(
    dbplyr_has_table_alias_with_as = function() FALSE,
    s3_register = function(...) stop("s3_register should not be called")
  )

  expect_silent(register_table_alias_with_as("DBIMockFakeConnection", TRUE))
})

test_that("And that RSQLite, without anything captures", {
  capture_db_requests(
    {
      con <- dbConnect(RSQLite::SQLite())
      expect_identical(.dittodb_env$db_path, file.path(temp_dir, "ephemeral_sqlite"))
      dbDisconnect(con)
    },
    path = temp_dir
  )
})


with_mock_db({
  test_that("Our connection is a mock connection", {
    # ":memory:" is non-portable, so using something close, but portable
    con <- dbConnect(RSQLite::SQLite(), "memory")
    expect_s4_class(con, "DBIMockConnection")
    expect_identical(con@path, "memory")
    expect_identical(con@original_class, "SQLiteConnection")

    dbDisconnect(con)
  })

  test_that("And that RSQLite, without anything works", {
    con <- dbConnect(RSQLite::SQLite())
    expect_s4_class(con, "DBIMockConnection")
    expect_identical(con@path, "ephemeral_sqlite")
    expect_identical(con@original_class, "SQLiteConnection")

    dbDisconnect(con)
  })
})
