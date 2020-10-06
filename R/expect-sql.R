#' Detect if a specific SQL statement is sent
#'
#' \Sexpr[results=rd, stage=render]{lifecycle::badge("experimental")}
#'
#' Sometimes all you need to check is if a specific SQL statement has been sent
#' and you don't care about retrieving the results.
#'
#' This works by raising an error that contains the statement that is sent to the
#' database as well as the location of the result. Currently, `expect_sql()` only
#' works with [`DBI::dbSendQuery()`] (and most implementations of [`DBI::dbGetQuery()`]
#' which call [`DBI::dbSendQuery()`] internally).
#'
#' *Note:* this function is experimental and will likely evolve over time. Please
#' be prepared that new releases might break backwards compatibility.
#'
#' @param object the expression to evaluate
#' @param regexp the statement to match
#' @param ... arguments passed to [`testthat::expect_error()`]
#'
#' @export
#'
#' @examples
#' if (check_for_pkg("RSQLite", message)) {
#'   with_mock_db({
#'     con <- dbConnect(RSQLite::SQLite(), dbname = "not_a_db")
#'
#'     expect_sql(
#'       dbGetQuery(con, "SELECT carrier, name FROM airlines LIMIT 3"),
#'       "SELECT carrier, name FROM airlines LIMIT 3"
#'     )
#'   })
#' }
expect_sql <- function(object,
                       regexp = NULL,
                       ...) {
  .dittodb_env$expecting <- TRUE
  on.exit(.dittodb_env$expecting <- FALSE)

  testthat::expect_error(object = object, regexp = regexp, ...)
}
