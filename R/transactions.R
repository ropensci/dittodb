#' @rdname mock-db-methods
#' @export
setMethod(
  "dbBegin",
  "DBIMockConnection",
  function(conn, ..., name = NULL) {
    return(invisible(TRUE))
  }
)

#' @rdname mock-db-methods
#' @export
setMethod(
  "dbCommit",
  "DBIMockConnection",
  function(conn, ..., name = NULL) {
    return(invisible(TRUE))
  }
)

#' @rdname mock-db-methods
#' @export
setMethod(
  "dbRollback",
  "DBIMockConnection",
  function(conn, ..., name = NULL) {
    return(invisible(TRUE))
  }
)
