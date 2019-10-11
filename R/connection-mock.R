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

#' @import DBI
#' @rdname mock-db-methods
#' @export
setClass("DBIMockConnection", slots = c(path = "character"), contains = "DBIConnection")

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

  path <- get_dbname(dots)

  return(new("DBIMockConnection", path = path))
}


#' Get the `dbname` from a connection call
#'
#' @param dots from the argument being passed to the connection
#'
#' @return the name, sanitized if needed
#' @export
get_dbname <- function(dots) {
  # look through dots to grab either dbname or the first unnammed argument
  named_dbname <- !is.null(dots$dbname) && dots$dbname != ""
  unnamed_dbname <- length(dots) > 0 &&
    ( is.null(names(dots[1])) || names(dots[1]) == "" )
  # if there is no name, or it's empty
  if (named_dbname) {
    path <- dots$dbname
  } else if (unnamed_dbname) {
    path <- dots[[1]]
  } else {
    stop("There was no dbname, so I don't know where to look for mocks.")
  }
  return(db_path_sanitize(path))
}
