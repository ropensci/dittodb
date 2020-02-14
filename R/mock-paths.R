#' Set an alternate directory for mock API fixtures
#'
#' By default, `with_mock_api` will look for mocks relative to the current
#' working directory (or the test directory). If you want to look in other
#' places, you can call `.db_mock_paths` to add directories to the search path.
#'
#' It works like [base::.libPaths()]: any directories you specify will be added
#' to the list and searched first. The default directory will be searched last.
#' Only unique values are kept: if you provide a path that is already found in
#' `.db_mock_paths`, the result effectively moves that path to the first
#' position.
#'
#' For finer-grained control, or to completely override the default behavior
#' of searching in the current working directory, you can set the option
#' "dittodb.mock.paths" directly.
#'
#' This function is similar to [.mockPaths()] from
#' [httptest](https://CRAN.R-project.org/package=httptest)
#'
#' @param new Either a character vector of path(s) to add, or `NULL` to reset
#' to the default.
#' @return If `new` is omitted, the function returns the current search paths, a
#' character vector. If `new` is provided, the updated value will be returned
#' invisibly.
#' @examples
#' identical(.db_mock_paths(), c("tests/testthat/", "."))
#' .db_mock_paths("/var/somewhere/else")
#' identical(.db_mock_paths(), c("/var/somewhere/else", "tests/testthat/", "."))
#' .db_mock_paths(NULL)
#' identical(.db_mock_paths(), c("tests/testthat/", "."))
#' @rdname mockPaths
#' @export
.db_mock_paths <- function(new) {
  # use both "." and testthat::test_path(".") in case they are different
  def <- unique(c("tests/testthat/", "."))

  current <- getOption("dittodb.mock.paths", default = def)
  if (missing(new)) {
    ## We're calling the function to get the list of paths
    return(current)
  } else if (is.null(new)) {
    ## We're calling the function to reset to the default
    options(dittodb.mock.paths = new)
    return(invisible(current))
  } else {
    ## We're adding one or more paths
    current <- unique(c(new, current))
    options(dittodb.mock.paths = current)
    return(invisible(current))
  }
}

# for backwards compatibility
#' @export
#' @keywords internal
.mockPaths <- .db_mock_paths

#' Run the DBI queries in an alternate mock directory
#'
#' When testing with dittodb, wrap your tests in `with_mock_path({})` to use the
#' database fixtures located in other directories. `dittodb` will look for
#' fixtures in the directory specified by the user, which can be a temporal
#' or permanent location.
#'
#' @param path the alternate directory
#' @param expr the expression to execute
#' @param replace foobar
#'
#' @return nothing
#' @export
with_mock_path <- function(path, expr, replace = FALSE) {
  oldmp <- .db_mock_paths()
  if (replace) {
    options(dittodb.mock.paths = path)
  } else {
    ## Append
    .db_mock_paths(path)
  }
  on.exit(options(dittodb.mock.paths = oldmp))
  return(eval.parent(expr))
}
