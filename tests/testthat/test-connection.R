context("Mock connection")

test_that("Error handling", {
  expect_warning(
    dbMockConnect(data.frame(), dbname = "name"),
    paste0(
      "data.frame is an unknown driver, dittodb will have limited functionality."
    )
  )
})

with_mock_db({
  test_that("Our connection is a mock connection", {
    # ":memory:" is non-portable, so using something close, but portable
    con <- dbConnect(RSQLite::SQLite(), "memory")
    expect_is(con, "DBIMockConnection")
    expect_identical(con@path, "memory")
    expect_identical(con@original_class, "SQLiteConnection")

    dbDisconnect(con)
  })
})
