list_helper <- function(kind, conn, ...) {
  path <- file.path(conn@path, glue("{kind}.R"))
  return(read_file(find_file(path)))
}

# This is only strictly necesary for odbc, RPostgres, RPostgreSQL, and RMariaDB
# use standard queries to list tables.
# TODO: investigate if it is better to have a special case for ODBC and use
# the standard sql for the others or use this code for all.
#' @rdname mock-db-methods
#'
#' @importFrom glue glue
#'
#' @export
setMethod("dbListTables", signature("DBIMockConnection"), function(conn, ...) {
  return(list_helper("dbListTables", conn, ...))
})


# We need to be overly-specific with multiple dispatch here because "ANY", even
# in the second argument won't over-ride the built-in methods.
.dbListFields <- function(conn, name, ...) {
  name <- sanitize_table_id(name, ...)
  return(list_helper(glue("dbListFields-{name}"), conn, ...))
}

#' @rdname mock-db-methods
#' @export
setMethod("dbListFields", signature("DBIMockConnection", "character"), .dbListFields)

#' @rdname mock-db-methods
#' @export
setMethod("dbListFields", signature("DBIMockConnection", "Id"), .dbListFields)

#' @rdname mock-db-methods
#' @export
setMethod("dbListFields", signature("DBIMockConnection", "ANY"), .dbListFields)
