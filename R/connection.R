#' Methods for interacting with DB mocks instead of an actual database
#'
#' Various methods (`dbSendQuery`, `dbFetchQuery`) that are mocks of the
#' [DBI](https://CRAN.R-project.org/package=DBI) methods of the same name.
#' Instead of actually interacting with a database, they read in mock responses
#' and the code proceeds after that. These aren't used directly, but are part of
#' how {dittodb} works.
#'
#' @param conn a database connection (for dispatch with these methods, it should
#'   be of class `DBIMockConnection`)
#' @param statement an SQL statement to execute
#' @param res a result object (for dispatch with these methods, it should be of
#'   class `DBIMockResult`)
#' @param n number of results to fetch (ignored)
#' @param name name of the table (for [`dbListFields`], [`dbWriteTable`],
#'   [`dbRemoveTable`])
#' @param x a name to quote (for [`dbQuoteIdentifier`])
#' @param ... arguments passed on inside of the methods
#' @param dbObj a database object (a connection, result, etc.) for use in
#'   [`dbGetInfo`]
#' @param value a value (generally a `data.frame`) for use in [`dbWriteTable`]
#' @param drv a DB driver for use in [`dbConnect`]
#'
#' @name mock-db-methods
NULL

#' @import DBI
#' @rdname mock-db-methods
#' @export
setClass(
  "DBIMockConnection",
  slots = c(
    # TODO: change path to dbname to better reflect what's going on
    path = "character",
    original_class = "character"
  ),
  contains = "DBIConnection"
)

#' @rdname mock-db-methods
#' @export
setMethod(
  "dbDisconnect", signature("DBIMockConnection"),
  function(conn, ...) {
    return(NULL)
  }
)

# TODO: should this function also include some specifications of the original
# connection? During tests those won't matter, but for setup and interactive
# debugging it could be helpful to try and fallback to a real connection if
# the mock connection isn't working for some reason.
#' @rdname mock-db-methods
#' @importFrom utils getFromNamespace
#' @export
dbMockConnect <- function(drv, ...) {
  # find a place to store the data
  dots <- list(...)

  # TODO: is there a more programatic way to do this?
  if (inherits(drv, "SQLiteDriver")) {
    mock_class <- "DBIMockSQLiteConnection"
    original_class <- "SQLiteConnection"
  } else if (inherits(drv, "PostgreSQLDriver")) {
    mock_class <- "DBIMockRPostgreSQLConnection"
    original_class <- "PostgreSQLConnection"
  } else if (inherits(drv, "PqDriver")) {
    mock_class <- "DBIMockRPostgresConnection"
    original_class <- "PqConnection"
  } else if (inherits(drv, "MariaDBDriver")) {
    mock_class <- "DBIMockMariaDBConnection"
    original_class <- "MariaDBConnection"
  } else if (inherits(drv, "OdbcDriver")) {
    mock_class <- "DBIMockOdbcConnection"
    original_class <- "OdbcConnection"
  } else {
    warning(
      as.character(class(drv)),
      " is an unknown driver, dittodb will have limited functionality."
    )
    mock_class <- "DBIMockConnection"
    original_class <- "DBIConnection"
  }

  path <- get_dbname(dots, drv = drv)

  # retrieve the dbplyr_edition for the original connection, if it exists (and
  # if dbplyr is installed)
  if (requireNamespace("dbplyr", quietly = TRUE)) {
    orig_dbplyr_edition <- tryCatch(
      getFromNamespace(paste0("dbplyr_edition.", original_class), "dbplyr"),
      error = function(e) {
        getFromNamespace("dbplyr_edition.default", "dbplyr")
      }
    )

    # register dbplyr_edition
    s3_register("dbplyr::dbplyr_edition", mock_class, method = orig_dbplyr_edition)

    # If we have an odbc connection, pretend that it is postgres for the purposes
    # of db_supports_table_alias_with_as
    if (original_class == "OdbcConnection") {
      s3_register("dbplyr::db_supports_table_alias_with_as", "DBIMockOdbcConnection", method = function(con) TRUE)
    }
  }

  return(new(mock_class, path = path, original_class = original_class))
}
