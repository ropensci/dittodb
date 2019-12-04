mock_list_tables <- function(conn, ...) {
  return(read_file(find_file(file.path(conn@path, "table_list.R"))))
}

#' @rdname mock-db-methods
#' @export
setMethod("dbListTables", signature("DBIMockODBCConnection"), mock_list_tables)

