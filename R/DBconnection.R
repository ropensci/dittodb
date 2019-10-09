#' @import DBI
setClass("DBIMockConnection", contains = "DBIConnection")

#' @import DBI
setClass("DBIMockResult",
         slots = list("type" = "character", hash = "character"),
         contains = "DBIResult")

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
#' @param ... arguments passed on inside of the methods
#'
#'
#' @name mock-db-methods
NULL

#' @rdname mock-db-methods
#' @importFrom methods setMethod new
#' @export
setMethod(
  "dbSendQuery", signature("DBIMockConnection", "character"),
  function(conn, statement, ...) {
    # create a new mock result with the type and a hash of the statement.
    # TODO: extract the type from the statement instead of hard coding it.
    return(new("DBIMockResult", type = "SELECT", hash = hash(statement)))
  }
)

#' @rdname mock-db-methods
#' @export
setMethod(
  "dbFetch", signature("DBIMockResult"),
  function(res, n, ...) {
    # TODO: make the file path not be hard coded
    mock_path <- file.path("mocks", paste0(res@type, res@hash, ".R"))
    return(source(mock_path)$value)
  }
)

#' @rdname mock-db-methods
#' @export
setMethod(
  "dbClearResult", signature("DBIMockResult"),
  function(res, n, ...) return(NULL)
)

#' @rdname mock-db-methods
#' @export
setMethod(
  "dbDisconnect", signature("DBIMockConnection"),
  function(conn, ...) return(NULL)
)

#' @importFrom digest digest
hash <- function (string, n=6) substr(digest(string), 1, n)

# internal functions to easily turn on tracing for dbGetQuery/dbFetchQuery
turn_on_query_tracing <- function() {
  trace("dbGetQuery", quote(browser()),
        signature = c(conn = "DBIConnection", statement = "character"))
}

turn_on_fetch_tracing <- function() {
  trace("dbFetchQuery", quote(browser()),
        signature = c(conn = "DBIConnection", statement = "character"))
}

# TODO: should this function also include some specifications of the original
# connection? During tests those won't matter, but for setup and interactive
# debugging it could be helpful to try and fallback to a real connection if
# the mock connection isn't working for some reason.
dbMockConnect <- function(...) {
  return(new("DBIMockConnection"))
}
