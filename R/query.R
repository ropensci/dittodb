setMethod(
  "dbGetRowsAffected", signature("DBIMockResult"),
  # TODO: this should be mocked/read not just return 0
  function(res, n, ...) return(0)
)

setMethod(
  "dbWriteTable", signature("DBIMockConnection"),
  function(conn, name, value, ...) return(NULL)
)

setMethod(
  "dbCommit", signature("DBIMockConnection"),
  function(conn, ...) return(NULL)
)
