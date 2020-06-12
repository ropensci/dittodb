.dbExistsTable <- function(conn, name, ...) {
  name <- sanitize_table_id(name, ...)
  return(list_helper(glue("dbExistsTable-{name}"), conn, ...))
}

#' @rdname mock-db-methods
#' @export
setMethod(
  "dbExistsTable",
  signature("DBIMockConnection", "character"),
  .dbExistsTable
)

#' @rdname mock-db-methods
#' @export
setMethod(
  "dbExistsTable",
  signature("DBIMockConnection", "Id"),
  .dbExistsTable
)
