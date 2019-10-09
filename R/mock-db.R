with_mock_dbi <- function (expr) {
  with_mock(
    dbConnect = dbMockConnect,
    .env = "DBI",
    expr)
}

