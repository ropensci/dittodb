#' @include dbQueries-Results.R
NULL

# Miscellaneous DBI methods from the respective DBI DB implementations
# TODO: make a list of these so that it's not just copy/paste?

#' @rdname mock-db-methods
#'
#' @importFrom methods getMethod
#'
#' @export
setMethod("dbGetInfo", signature("DBIMockConnection"), function(dbObj, ...) {
  path <- make_path(dbObj@path, "conInfo", "")
  return(read_file(find_file(path)))
})

# TODO: should we also implement signature("DBIMockConnection", "character",
# "character") most backends warn that it isn't well supported.
#' @rdname mock-db-methods
#' @export
setMethod(
  "dbWriteTable", signature("DBIMockConnection", "character", "data.frame"),
  function(conn, name, value, ...) return(TRUE)
)

#' @rdname mock-db-methods
#' @export
setMethod(
  "dbRemoveTable", signature("DBIMockConnection", "character"),
  function(conn, name, ...) return(TRUE)
)

# This is only strictly necesary for odbc, RPostgres, RPostgreSQL, and RMariaDB
# use standard queries to list tables.
# TODO: investigate if it is better to have a special case for ODBC and use
# the standard sql for the others or use this code for all.
#' @rdname mock-db-methods
#'
#' @importFrom glue glue
#'
#' @export
setMethod("dbColumnInfo", signature("DBIMockResult"), function(res, ...) {
  path <- make_path(res@path, "columnInfo", res@hash)
  return(read_file(find_file(path)))
})

#' @rdname mock-db-methods
#'
#' @export
setMethod("dbGetInfo", signature("DBIMockResult"), function(dbObj, ...) {
  path <- make_path(dbObj@path, "resultInfo", dbObj@hash)
  return(read_file(find_file(path)))
})
