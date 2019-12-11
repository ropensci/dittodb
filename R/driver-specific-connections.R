.onLoad <- function(libname, pkgname) {
  set_driver_class(
    pkg = "RSQLite",
    mock_conn = "DBIMockSQLiteConnection",
    real_conn = "SQLiteConnection"
  )

  set_driver_class(
    pkg = "RPostgreSQL",
    mock_conn = "DBIMockRPostgreSQLConnection",
    real_conn = "PostgreSQLConnection"
  )

  set_driver_class(
    pkg = "RPostgres",
    mock_conn = "DBIMockRPostgresConnection",
    real_conn = "PqConnection"
  )

  set_driver_class(
    pkg = "RMariaDB",
    mock_conn = "DBIMockMariaDBConnection",
    real_conn = "MariaDBConnection"
  )
}

set_driver_class <- function(pkg, mock_conn, real_conn) {
  # following the convention from Writing R Extensions
  # https://cran.r-project.org/doc/manuals/r-release/R-exts.html#Suggested-packages
  if (requireNamespace(pkg, quietly = TRUE)) {
    methods::setClass(mock_conn, contains = c("DBIMockConnection", real_conn))
  }
}
