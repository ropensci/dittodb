# should be only DBIMockRPostgresConnection?
#' @rdname mock-db-methods
#' @export
setMethod("dbQuoteIdentifier", c("DBIMockRPostgresConnection", "character"), function(conn, x, ...) {
  return(SQL(glue('"{x}"'), names = names(x)))
})

#' @rdname mock-db-methods
#' @export
setMethod("dbQuoteIdentifier", c("DBIMockRPostgresConnection", "SQL"), function(conn, x, ...) {
  return(x)
})
