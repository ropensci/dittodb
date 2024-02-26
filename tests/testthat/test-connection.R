test_that("Error handling", {
  expect_warning(
    dbMockConnect(data.frame(), dbname = "name"),
    paste0(
      "data.frame is an unknown driver, dittodb will have limited functionality"
    )
  )
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
