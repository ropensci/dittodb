#' Set an alternate directory for mock API fixtures
#'
#' By default, `with_mock_api` will look for mocks relative to the current
#' working directory (or the test directory). If you want to look in other places,
#' you can call `.mockPaths` to add directories to the search path.
#'
#' It works like [base::.libPaths()]: any directories you specify will be added
#' to the list and searched first. The default directory will be searched last.
#' Only unique values are kept: if you provide a path that is already found in
#' `.mockPaths`, the result effectively moves that path to the first position.
#'
#' For finer-grained control, or to completely override the default behavior
#' of searching in the current working directory, you can set the option
#' "dbtest.mock.paths" directly.
#'
#' This function is an extension of [httptest::.mockPaths()] from
#' [httptest](https://CRAN.R-project.org/package=httptest)
#'
#' @param new Either a character vector of path(s) to add, or `NULL` to reset
#' to the default.
#' @return If `new` is omitted, the function returns the current search paths, a
#' a character vector. If `new` is provided, the updated value will be returned
#' invisibly.
#' @examples
#' identical(.mockPaths(), c("tests/testthat/", "."))
#' .mockPaths("/var/somewhere/else")
#' identical(.mockPaths(), c("/var/somewhere/else", "tests/testthat/", "."))
#' .mockPaths(NULL)
#' identical(.mockPaths(), c("tests/testthat/", "."))
#' @rdname mockPaths
#' @export
.mockPaths <- function(new) {
  # use both "." and testthat::test_path(".") in case they are different
  def <- unique(c("tests/testthat/", "."))

  current <- getOption("dbtest.mock.paths", default = def)
  if (missing(new)) {
    ## We're calling the function to get the list of paths
    return(current)
  } else if (is.null(new)) {
    ## We're calling the function to reset to the default
    options(dbtest.mock.paths = new)
    return(invisible(current))
  } else {
    ## We're adding one or more paths
    current <- unique(c(new, current))
    options(dbtest.mock.paths = current)
    return(invisible(current))
  }
}

with_mock_path <- function(path, expr, replace = FALSE) {
  oldmp <- .mockPaths()
  if (replace) {
    options(dbtest.mock.paths = path)
  } else {
    ## Append
    .mockPaths(path)
  }
  on.exit(options(dbtest.mock.paths = oldmp))
  return(eval.parent(expr))
}
