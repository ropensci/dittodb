#' Set an alternate directory for mock API fixtures
#'
#' By default, `with_mock_api` will look for mocks relative to the current
#' working directory (or the test directory). If you want to look in other
#' places, you can call `db_mock_paths` to add directories to the search path.
#'
#' It works like [base::.libPaths()]: any directories you specify will be added
#' to the list and searched first. The default directory will be searched last.
#' Only unique values are kept: if you provide a path that is already found in
#' `db_mock_paths`, the result effectively moves that path to the first
#' position.
#'
#' When you are capturing fixtures (e.g. with [`start_db_capturing`]), the first
#' path is used as the path to save the fixtures in. For this reason, you may
#' want to set the `last` argument to `TRUE` if you want to read from a
#' directory but don't want to write to it.
#'
#' For finer-grained control, or to completely override the defaults or any
#' additions made by calls to `db_mock_paths(...)`, you can set the option
#' "dittodb.mock.paths". If the option "dittodb.mock.paths" is set it will be
#' used instead of any paths set with `db_mock_paths(...)` or even inside of
#' `with_mock_path()`
#'
#' This function is similar to `.mockPaths()` from
#' [httptest](https://CRAN.R-project.org/package=httptest)
#'
#' The function `.db_mock_paths` is the same as `db_mock_paths` although it is
#' deprecated and should not be used.
#'
#' @param new either a character vector of path(s) to add, or `NULL` to reset
#' to the default.
#' @param last a logical, should the new path given be added to the end of the
#' list of paths? (default: `FALSE`)
#' @param replace logical, should the path replace the current mock paths
#' (`TRUE`) or should they be appended (to the beginning) of the current mock
#' paths (default, `FALSE`)
#'
#' @return If `new` is omitted, the function returns the current search paths, a
#' character vector. If `new` is provided, the updated value will be returned
#' invisibly.
#' @examples
#' # reset mock paths to default
#' db_mock_paths(NULL)
#'
#' identical(db_mock_paths(), c("tests/testthat/", "."))
#' db_mock_paths("/var/somewhere/else")
#' identical(db_mock_paths(), c("/var/somewhere/else", "tests/testthat/", "."))
#' db_mock_paths(NULL)
#' identical(db_mock_paths(), c("tests/testthat/", "."))
#' db_mock_paths("/var/somewhere/else", last = TRUE)
#' identical(db_mock_paths(), c("tests/testthat/", ".", "/var/somewhere/else"))
#' @name mockPaths
#' @export
db_mock_paths <- function(new, last = FALSE, replace = FALSE) {
  # We're calling the function to get the list of paths
  if (missing(new)) {
    return(get_db_mock_paths())
  }

  # We're calling the function to reset to the default
  if (is.null(new)) {
    return(set_default_db_mock_paths())
  }

  # We're replacing paths
  if (replace) {
    .dittodb_env$mock_paths <- new
    return(invisible(get_db_mock_paths()))
  }

  # We're adding one or more paths
  current <- get_db_mock_paths()
  if (last) {
    # if we are post-pending
    current <- unique(c(current, new), fromLast = TRUE)
  } else {
    # if we are pre-pending
    current <- unique(c(new, current))
  }

  .dittodb_env$mock_paths <- current
  return(invisible(get_db_mock_paths()))
}

get_db_mock_paths <- function() {
  # If paths are set with the dittodb.mock.paths option, those will always be
  # used regardless of what is set in `.dittodb_env$mock_paths`
  env_paths <- .dittodb_env$mock_paths
  options_paths <- getOption("dittodb.mock.paths")
  if (length(options_paths) > 0) {
    return(options_paths)
  }
  return(env_paths)
}

# reset mock paths to the default
set_default_db_mock_paths <- function() {
  .dittodb_env$mock_paths <- c("tests/testthat/", ".")
  return(invisible(get_db_mock_paths))
}

# for backwards compatibility
#' @export
#' @rdname mockPaths
#' @keywords internal
.db_mock_paths <- function(new) {
  .Deprecated("db_mock_paths")
  return(db_mock_paths(new))
}

#' Run the DBI queries in an alternate mock directory
#'
#' When testing with dittodb, wrap your tests in `with_mock_path({})` to use the
#' database fixtures located in other directories. {dittodb} will look for
#' fixtures in the directory specified by the user, which can be a temporary
#' or permanent location.
#'
#' @param path the alternate directory
#' @param expr the expression to execute
#' @param replace logical, should the path replace the current mock paths
#' (`TRUE`) or should they be appended (to the beginning) of the current mock
#' paths (default, `FALSE`)
#'
#' @return nothing, called to execute the expression(s) in `expr`
#' @export
#'
#' @examples
#' with_mock_path(
#'   system.file("nycflight_mocks", package = "dittodb"),
#'   with_mock_db({
#'     con <- DBI::dbConnect(
#'       RSQLite::SQLite(),
#'       dbname = "nycflights"
#'     )
#'
#'     one_airline <- dbGetQuery(
#'       con,
#'       "SELECT carrier, name FROM airlines LIMIT 1"
#'     )
#'     testthat::test_that("We get one airline", {
#'       testthat::expect_s3_class(one_airline, "data.frame")
#'       testthat::expect_equal(nrow(one_airline), 1)
#'       testthat::expect_equal(one_airline$carrier, "9E")
#'       testthat::expect_equal(one_airline$name, "Endeavor Air Inc.")
#'     })
#'     one_airline
#'   })
#' )
with_mock_path <- function(path, expr, replace = FALSE) {
  oldmp <- db_mock_paths()
  if (replace) {
    .dittodb_env$mock_paths <- NULL
    db_mock_paths(path)
  } else {
    # Append
    db_mock_paths(path)
  }
  on.exit({
    .dittodb_env$mock_paths <- NULL
    db_mock_paths(oldmp)
  })
  return(eval.parent(expr))
}
