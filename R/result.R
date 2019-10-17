#' @rdname mock-db-methods
#' @import DBI
#' @export
setClass("DBIMockResult",
  slots = c(
    type = "character",
    hash = "character",
    path = "character",
    statement = "character",
    fetched = "logical"
  ),
  prototype = list(
    type = NA_character_,
    hash = NA_character_,
    path = NA_character_,
    statement = NA_character_,
    fetched = FALSE
  ),
  contains = "DBIResult"
)

#' @rdname mock-db-methods
#' @importFrom methods setMethod new
#' @export
setMethod(
  "dbSendQuery", signature("DBIMockConnection", "character"),
  function(conn, statement, ...) {
    # create a new mock result with the type and a hash of the statement.
    # TODO: extract the type from the statement instead of hard coding it.
    if (dbtest_debug_level(1)) {
      message(
        "Sending a query for the statement: \n", statement,
        "\nis being hased to: ", hash(statement)
      )
    }
    return(new("DBIMockResult", type = "SELECT", hash = hash(statement), path = conn@path, statement = statement))
  }
)

mock_fetch <- function(res, n, ...) {
  if (n != -1) {
    warning("dbFetch `n` is ignored while mocking databases.")
  }
  path <- make_path(res@path, res@type, res@hash)
  return(read_file(find_file(path)))
}

#' @rdname mock-db-methods
#' @export
setMethod("dbFetch", signature("DBIMockResult"), mock_fetch)

# All new DBI drivers should use dbFetch, but some old ones (like RPostgreSQL)
# use only fetch, so we need to mock both. The complication is that DBI's
# dbFetch by default simply calls fetch which might lead to duplication
#' @rdname mock-db-methods
#' @export
setMethod("fetch", signature("DBIMockResult"), mock_fetch)

#' @rdname mock-db-methods
#' @export
setMethod(
  "dbClearResult", signature("DBIMockResult"),
  function(res, n, ...) return(NULL)
)
