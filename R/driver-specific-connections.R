#' Driver-specific mock classes
#'
#' Each of the drivers that are supported have their own mock connection class.
#' They all inherit from `DBIMockConnection` as well as their own driver's connection
#' class. Each is only really available if the corresponding package is installed.
#'
#' @name driver-specifc-mock-connections
#'
NULL

#' @rdname driver-specifc-mock-connections
#' @export
setClass("DBIMockSQLiteConnection")

#' @rdname driver-specifc-mock-connections
#' @export
setClass("DBIMockRPostgreSQLConnection")

#' @rdname driver-specifc-mock-connections
#' @export
setClass("DBIMockRPostgresConnection")

#' @rdname driver-specifc-mock-connections
#' @export
setClass("DBIMockMariaDBConnection")

.onLoad <- function(libname, pkgname) {
  custom_classes <- list(
    list(
      pkg = "RSQLite",
            mock_conn = "DBIMockSQLiteConnection",
            real_conn = "SQLiteConnection"
      ),
    list(
      pkg = "RPostgreSQL",
      mock_conn = "DBIMockRPostgreSQLConnection",
      real_conn = "PostgreSQLConnection"
    ),
    list(
      pkg = "RPostgres",
      mock_conn = "DBIMockRPostgresConnection",
      real_conn = "PqConnection"
    ),
    list(
      pkg = "RMariaDB",
      mock_conn = "DBIMockMariaDBConnection",
      real_conn = "MariaDBConnection"
    )
  )

  lapply(custom_classes, function(x){
    set_driver_class(
      pkg = x[["pkg"]],
      mock_conn = x[["mock_conn"]],
      real_conn = x[["real_conn"]]
    )
  })
}

set_driver_class <- function(pkg, mock_conn, real_conn) {
  # following the convention from Writing R Extensions
  # https://cran.r-project.org/doc/manuals/r-release/R-exts.html#Suggested-packages
  if (requireNamespace(pkg, quietly = TRUE)) {
    methods::setClass(mock_conn, contains = c("DBIMockConnection", real_conn))
  }
}
