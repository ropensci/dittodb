#' @rdname mock-db-methods
#' @export
setMethod(
  "dbBegin",
  "DBIMockRPostgresConnection",
  function(conn, ..., name = NULL) {
    return(invisible(TRUE))
  })

#' @rdname mock-db-methods
#' @export
setMethod(
  "dbCommit",
  "DBIMockRPostgresConnection",
  function(conn, ..., name = NULL) {
    return(invisible(TRUE))
  })


#' @rdname mock-db-methods
#' @export
setMethod(
  "dbRollback",
  "DBIMockRPostgresConnection",
  function(conn, ..., name = NULL) {
    return(invisible(TRUE))
  })

# very hacky — to get around dbplyr's analyze of table
#' @rdname mock-db-methods
#' @export
setMethod(
  "dbGetRowsAffected",
  "DBIMockResult",
  function(res, ...) {
    return(invisible(1))
  })
