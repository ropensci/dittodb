# should be only DBIMockRPostgresConnection?
#' @rdname mock-db-methods
#' @export
setMethod("dbQuoteIdentifier", c("DBIMockRPostgresConnection", "character"), function(conn, x, ...) {
  if (anyNA(x)) {
    stop("Cannot pass NA to dbQuoteIdentifier()", call. = FALSE)
  }
  return(SQL(glue('"{x}"'), names = names(x)))
})

#' @rdname mock-db-methods
#' @export
setMethod("dbQuoteIdentifier", c("DBIMockRPostgresConnection", "SQL"), function(conn, x, ...) {
  return(x)
})
