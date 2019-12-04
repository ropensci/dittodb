# This is only strictly necesary for odbc, RPostgres, RPostgreSQL, and RMariaDB
# use standard queries to list tables.
# TODO: investigate if it is better to have a special case for ODBC and use
# the standard sql for the others or use this code for all.
mock_list_tables <- function(conn, ...) {
  return(read_file(find_file(file.path(conn@path, "table_list.R"))))
}

#' @rdname mock-db-methods
#' @export
setMethod("dbListTables", signature("DBIMockConnection"), mock_list_tables)

