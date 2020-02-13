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
    return(new(
      "DBIMockResult",
      type = get_type(statement),
      hash = hash(statement),
      path = conn@path,
      statement = statement
    ))
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
setMethod("dbFetch", signature("DBIMockResult", "ANY"), mock_fetch)

# All new DBI drivers should use dbFetch, but some old ones (like RPostgreSQL)
# use only fetch, so we need to mock both. The complication is that DBI's
# dbFetch by default simply calls fetch which might lead to duplication

# the @alaises shouldn't be necesary here, but neverthless is.
#' @rdname mock-db-methods
#' @aliases fetch,DBIMockResult-method
#' @export
setMethod("fetch", signature("DBIMockResult", "ANY"), mock_fetch)

# This is needed for RPostgreSQL to make doc building work
#' @rdname mock-db-methods
#' @export
setMethod("fetch", signature("DBIMockResult", "missing"), mock_fetch)

#' @rdname mock-db-methods
#' @export
setMethod(
  "dbClearResult", signature("DBIMockResult"),
  function(res, n, ...) return(invisible(TRUE))
)

# TODO: this should be smarter than just always saying things are done
#' @rdname mock-db-methods
#' @export
setMethod(
  "dbHasCompleted", signature("DBIMockResult"),
  function(res, ...) return(invisible(TRUE))
)


#' @rdname mock-db-methods
#' @importFrom methods setMethod new
#' @export
setMethod(
  "dbGetQuery", signature("DBIMockRPostgreSQLConnection", "character"),
  function(conn, statement, ...) {
    # TODO: this is really only needed for RPostgreSQL, and even for that, we
    # likely could instead just mock `isPostgresqlIdCurrent` to return a valid
    # value
    # https://github.com/tomoakin/RPostgreSQL/blob/master/RPostgreSQL/R/PostgreSQLSupport.R#L266
    res <- dbSendQuery(conn, statement, ...)
    return(mock_fetch(res, -1))
  }
)


#' @rdname mock-db-methods
#' @importFrom methods setMethod new
#' @export
setMethod(
  "dbGetQuery", signature("DBIMockRPostgreSQLConnection", "character"),
  function(conn, statement, ...) {
    # TODO: this is really only needed for RPostgreSQL, and even for that, we
    # likely could instead just mock `isPostgresqlIdCurrent` to return a valid
    # value
    # https://github.com/tomoakin/RPostgreSQL/blob/master/RPostgreSQL/R/PostgreSQLSupport.R#L266
    res <- dbSendQuery(conn, statement, ...)
    return(mock_fetch(res, -1))
  }
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
