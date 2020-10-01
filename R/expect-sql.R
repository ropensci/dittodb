#' Detect if a specific SQL statement is sent
#'
#' Sometimes all you need to check is if a specific SQL statement has been sent
#' and you don't care about retrieving the results.
#'
#' This works by raising an error that contains the statement that is sent to the
#' database as well as the location of the result
#'
#' @param object the expression to evaluate
#' @param regexp the statement to match
#' @param ... arguments passed to [`testthat::expect_error()`]
#'
#' @export
#'
expect_sql <- function(object,
                       regexp = NULL,
                       ...) {
  expect_error(object = object, regexp = regexp, ...)
}
