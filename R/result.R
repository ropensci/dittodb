#' @import DBI
setClass("DBIMockResult",
         slots = c(
           "type" = "character",
           "hash" = "character",
           "path" = "character"
         ),
         contains = "DBIResult")

#' @rdname mock-db-methods
#' @importFrom methods setMethod new
#' @export
setMethod(
  "dbSendQuery", signature("DBIMockConnection", "character"),
  function(conn, statement, ...) {
    # create a new mock result with the type and a hash of the statement.
    # TODO: extract the type from the statement instead of hard coding it.
    return(new("DBIMockResult", type = "SELECT", hash = hash(statement), path = conn@path))
  }
)

#' @rdname mock-db-methods
#' @export
setMethod(
  "dbFetch", signature("DBIMockResult"),
  function(res, n, ...) {
    if (n != -1) {
      warning("dbFetch `n` is ignored while mocking databases.")
    }
    path <- make_path(res@path, res@type, res@hash)
    return(read_file(find_file(path)))
  }
)

#' @rdname mock-db-methods
#' @export
setMethod(
  "dbClearResult", signature("DBIMockResult"),
  function(res, n, ...) return(NULL)
)
