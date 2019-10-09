#' Run the DBI queries inside against a mocked db
#'
#' @param expr the expression to execute
#'
#' @return nothing
#' @importFrom testthat with_mock
#' @export
with_mock_db <- function (expr) {
  with_mock(
    dbConnect = dbMockConnect,
    .env = "DBI",
    expr)
}
