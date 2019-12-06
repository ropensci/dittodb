#' Methods for interacting with DB mocks instead of an actual database
#'
#' Various methods (`dbSendQuery`, `dbFetchQuery`) that are mocks of the DBI
#' methods of the same name. Instead of actually interacting with a database,
#' they read in mock responses and the code proceeds after that.
#'
#' @param conn a database connection (for dispatch with these methods, it should
#' be of class `DBIMockConnection`)
#' @param statement an SQL statement to execute
#' @param res a result object (for dispatch with these methods, it should
#' be of class `DBIMockResult`)
#' @param n number of results to fetch (ignored)
#' @param name name of the table (for [`dbListFields`])
#' @param ... arguments passed on inside of the methods
#'
#' @name mock-db-methods
NULL

#' @import DBI
#' @rdname mock-db-methods
#' @export
setClass("DBIMockConnection",
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
  function(conn, ...) return(NULL)
)

# TODO: should this function also include some specifications of the original
# connection? During tests those won't matter, but for setup and interactive
# debugging it could be helpful to try and fallback to a real connection if
# the mock connection isn't working for some reason.
dbMockConnect <- function(drv, ...) {
  # find a place to store the data
  dots <- list(...)

  # TODO: is there a more programatic way to do this?
  if (inherits(drv, "SQLiteDriver")) {
    mock_class <- "DBIMockSQLiteConnection"
    original_class <- "SQLiteConnection"
  } else if (inherits(drv, "PostgreSQLDriver")) {
    mock_class <- "DBIMockConnection"
    original_class <- "PostgreSQLConnection"
  } else if (inherits(drv, "PqDriver")) {
    mock_class <- "DBIMockConnection"
    original_class <- "PqConnection"
  } else if (inherits(drv, "MariaDBDriver")) {
    mock_class <- "DBIMockConnection"
    original_class <- "MariaDBConnection"
  } else if (inherits(drv, "OdbcDriver")) {
    mock_class <- "DBIMockConnection"
    original_class <- "OdbcConnection"
  } else {
    warning(as.character(class(drv)), " is an unknown driver, dbtest will have limited functionality.")
    mock_class <- "DBIMockConnection"
    original_class <- "DBIConnection"
  }

  path <- get_dbname(dots)

  return(new(mock_class, path = path, original_class = original_class))
}


#' Get the `dbname` from a connection call
#'
#' @param dots from the argument being passed to the connection
#'
#' @return the name, sanitized if needed
#'
#' @keywords internal
#'
#' @export
get_dbname <- function(dots) {
  # look through dots to grab either dbname or the first unnammed argument
  named_dbname <- !is.null(dots$dbname) && dots$dbname != ""
  named_Database <- !is.null(dots$Database) && dots$Database != ""
  unnamed_dbname <- length(dots) > 0 &&
    (is.null(names(dots[1])) || names(dots[1]) == "")
  # if there is no name, or it's empty
  if (named_dbname) {
    path <- dots$dbname
  } else if (named_Database) {
    path <- dots$Database
  } else if (unnamed_dbname) {
    path <- dots[[1]]
  } else {
    stop("There was no dbname, so I don't know where to look for mocks.")
  }
  return(db_path_sanitize(path))
}


# DBI methods from the respective DBI DB implementations
# TODO: make a list of these so that it's not just copy/paste?

#' @rdname mock-db-methods
#'
#' @importFrom methods getMethod
#'
#' @export
setMethod(
  "dbListTables", signature("DBIMockConnection"),
  function(conn, ...) {
    getMethod("dbListTables", signature = conn@original_class)(conn, ...)
  }
)
