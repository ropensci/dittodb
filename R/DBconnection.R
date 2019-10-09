#' @import DBI
setClass("DBIMockConnection", contains = "DBIConnection")

#' @import DBI
setClass("DBIMockResult", slots = list("type" = "character", hash = "character"), contains = "DBIResult")

#' @importFrom methods setMethod
#' @export
setMethod(
  "dbSendQuery", signature("DBIMockConnection", "character"),
  function(conn, statement, ...) {
    return(new("DBIMockResult", type = "SELECT", hash = hash(statement)))
  }
)

#' @export
setMethod(
  "dbFetch", signature("DBIMockResult"),
  function(res, n, ...) {
    # TODO: make the file path not be hard coded
    mock_path <- file.path("mocks", paste0(res@type, res@hash, ".R"))
    return(source(mock_path)$value)
  }
)

#' @export
setMethod(
  "dbClearResult", signature("DBIMockResult"),
  function(res, n, ...) return(NULL)
)

#' @importMethodsFrom DBI dbDisconnect
#' @importFrom methods setMethod
#' @export
setMethod(
  "dbDisconnect", signature("DBIMockConnection"),
  function(conn, ...) return(NULL)
)

#' @importFrom digest digest
hash <- function (string, n=6) substr(digest(string), 1, n)

turn_on_query_tracing <- function() {
  trace("dbGetQuery", quote(browser()), signature = c(conn = "DBIConnection", statement = "character"))
}

turn_on_fetch <- function() {
  trace("dbFetchQuery", quote(browser()), signature = c(conn = "DBIConnection", statement = "character"))
}


dbMockConnect <- function(...) {
  return(new("DBIMockConnection"))
}
