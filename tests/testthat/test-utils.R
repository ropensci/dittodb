context("utils")

test_that("can check for packages", {
  expect_true(check_for_pkg("testthat"))

  expect_error(
    check_for_pkg("not_a_package"),
    paste0(
      "The package not_a_package isn't installed but is required for this ",
      "function. \nPlease install it with install.packages(\"not_a_package\") ",
      "and try again."
    ),
    fixed = TRUE
  )
})


test_that("path sanitization", {
  expect_identical(
    db_path_sanitize(":memory:"),
    "_memory_"
  )
})

test_that("we can remove the unique dbplyr names", {
  with_unique <- "SELECT *\nFROM `airlines` AS `zzz26`"
  with_dbplyr <- "SELECT *\nFROM `airlines` AS `dbplyr_009`"
  no_unique <- "SELECT *\nFROM `airlines` AS `my_special_airlines_table`"
  with_quotes <- "SELECT *\nFROM \"airlines\" AS \"zzz16\""
  with_unique_long <- "SELECT *\nFROM `airlines` AS `zzz26666`"
  with_unique_where <- "SELECT *\nFROM `airlines` AS `zzz26`\n WHERE (0 = 1)"

  expected <- "SELECT *\nFROM `airlines` AS `removed_unique_dplyr_name`"

  expect_identical(ignore_dbplyr_unique_names(with_unique), expected)
  expect_identical(ignore_dbplyr_unique_names(with_dbplyr), expected)
  expect_identical(ignore_dbplyr_unique_names(no_unique), no_unique)
  expect_identical(ignore_dbplyr_unique_names(with_unique_long), expected)
  expect_identical(
    ignore_dbplyr_unique_names(ignore_quotes(with_quotes)),
    expected
    )
  expect_identical(
    ignore_dbplyr_unique_names(with_unique_where),
    paste0(expected, "\n WHERE (0 = 1)")
  )
})

test_that("debugging helper", {
  expect_true(dbtest_debug_level(-1))
  expect_true(dbtest_debug_level(0))
  expect_false(dbtest_debug_level(1))
  expect_false(dbtest_debug_level(2))
  expect_false(dbtest_debug_level(3))
  withr::with_options(
    c("dbtest.debug" = 2), {
      expect_true(dbtest_debug_level(-1))
      expect_true(dbtest_debug_level(0))
      expect_true(dbtest_debug_level(1))
      expect_true(dbtest_debug_level(2))
      expect_false(dbtest_debug_level(3))
    }
  )
})

test_that("We ignore quote differences in statements", {
  string_with_quotes <- "Wow\"there'are`a lot of quotes here!"
  expect_identical(
    ignore_quotes(string_with_quotes),
    "Wow`there`are`a lot of quotes here!"
  )
})
