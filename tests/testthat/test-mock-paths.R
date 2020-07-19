context("Mock paths")

# use a new temp directory so we don't have to cleanup later
with_mock_path(path = "new_mock_path", {
  # we can use an entirely different mock path (and with a named argument)
  with_mock_db({
    con <- dbConnect(RSQLite::SQLite(), dbname = "new_db")
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
    dbDisconnect(con)
  })
})

withr::with_options(
  c(dittodb.mock.paths = "new_one"), {
    test_that("dittodb.mock.paths is used", {
      expect_identical(db_mock_paths(), "new_one")
    })
  })

with_mock_path(
  c("new_one"),
  replace = TRUE, {
    test_that("the one mockpath is used", {
      expect_identical(db_mock_paths(), "new_one")
    })

    test_that("and we can unset", {
      db_mock_paths(NULL)
      expect_identical(db_mock_paths(), c("tests/testthat/", "."))
    })

    test_that("we can add to the beginning", {
      db_mock_paths("beginning")
      expect_identical(db_mock_paths(), c("beginning", "tests/testthat/", "."))
      # cleanup
      db_mock_paths(NULL)
    })

    test_that("and we can add to the end", {
      db_mock_paths("end", last = TRUE)
      expect_identical(db_mock_paths(), c("tests/testthat/", ".", "end"))
      # cleanup
      db_mock_paths(NULL)
    })

    test_that("and we can replace", {
      db_mock_paths("replace", replace = TRUE)
      expect_identical(db_mock_paths(), c("replace"))
      # cleanup
      db_mock_paths(NULL)
    })

    test_that("with_mock_path can replace", {
      with_mock_path("baz", replace = TRUE, {
        expect_identical(db_mock_paths(), "baz")
      })
    })

    test_that(".db_mock_paths is deprecated", {
      expect_warning(
        expect_identical(.db_mock_paths(), c("tests/testthat/", ".")),
        "'.db_mock_paths' is deprecated.\nUse 'db_mock_paths' instead.",
        fixed = TRUE
      )
    })
  }
)
