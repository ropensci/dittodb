#' Run the DBI queries inside against a mocked db
#'
#' When testing with dbtest, wrap your tests in `with_mock_db({})` to use the
#' database fixtures. `dbtest` will look for fixtures in all entries of
#' [`.db_mock_paths`].
#'
#' Connections should be made inside of `with_mock_db()` because `dbtest` uses
#' the database name (given in `dbname` or `Database` argument of [`dbConnect`]
#'depending on the driver) to separate different fixtures.
#'
#' @param expr the expression to execute
#'
#' @return nothing
#' @importFrom testthat with_mock
#' @export
#'
#' @examples
#' \dontrun{
#' with_mock_db({
#'   con <- dbConnect(
#'     RPostgreSQL::PostgreSQL(),
#'     dbname = "nycflights",
#'     host = "127.0.0.1",
#'     user = "travis",
#'     password = ""
#'   )
#'
#'   test_that("We get one airline", {
#'     one_airline <- dbGetQuery(
#'       con,
#'       "SELECT carrier, name FROM airlines LIMIT 1"
#'     )
#'     expect_is(one_airline, "data.frame")
#'     expect_equal(nrow(one_airline), 1)
#'     expect_equal(one_airline$carrier, "9E")
#'     expect_equal(one_airline$name, "Endeavor Air Inc.")
#'   })
#' })
#' }
with_mock_db <- function(expr) {
  with_mock(
    dbConnect = function(...) dbMockConnect(...),
    .env = "DBI",
    expr
  )
}
