setMethod(
  "dbGetRowsAffected", signature("DBIMockResult"),
  function(res, n, ...) {
    path <- make_path(res@path, res@type, res@hash)
    return(read_file(find_file(path)))
  }
)

setMethod(
  "dbWriteTable", signature("DBIMockConnection"),
  function(conn, name, value, ...) return(NULL)
)

setMethod(
  "dbCommit", signature("DBIMockConnection"),
  function(conn, ...) return(NULL)
)
