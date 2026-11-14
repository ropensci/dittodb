#' @include driver-specific-connections.R
NULL

#' @rdname mock-db-methods
#' @import DBI
#' @export
setClass(
  "DBIMockResult",
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

db_send_query <- function(conn, statement, ...) {
  # create a new mock result with the type and a hash of the statement.
  if (dittodb_debug_level(2)) {
    message(
      "Sending a query for the statement: \n", statement,
      "\nwhich has been cleaned to: \n", clean_statement(statement),
      "\nis being hased to: ", hash(statement)
    )
  } else if (dittodb_debug_level(1)) {
    message(
      "Sending a query for the statement: \n", statement,
      "\nis being hased to: ", hash(statement)
    )
  }

  # TDOO: if we are in expect_sql, then we should emit an error (or warning?) with SQL here
  if (is_expecting()) {
    error_msg <- glue::glue(
      "Fixture: {make_path(conn@path, get_type(statement), hash(statement))}
      {clean_statement(statement)}"
    )

    rlang::abort(error_msg)
  }

  return(new(
    "DBIMockResult",
    type = get_type(statement),
    hash = hash(statement),
    path = conn@path,
    statement = statement
  ))
}

#' @rdname mock-db-methods
#' @importFrom methods setMethod new
#' @export
setMethod("dbSendQuery", signature("DBIMockConnection", "character"), db_send_query)

#' @rdname mock-db-methods
#' @importFrom methods setMethod new
#' @export
setMethod("dbSendQuery", signature("DBIMockConnection", "SQL"), db_send_query)

#' @rdname mock-db-methods
#' @importFrom methods setMethod new
#' @export
setMethod("dbSendStatement", signature("DBIMockConnection", "character"), db_send_query)

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

# the @alaises shouldn't be necesary here, but nevertheless is.
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
  "dbClearResult",
  signature("DBIMockResult"),
  function(res, n, ...) {
    return(invisible(TRUE))
  }
)

# TODO: this should be smarter than just always saying things are done
#' @rdname mock-db-methods
#' @export
setMethod(
  "dbHasCompleted",
  signature("DBIMockResult"),
  function(res, ...) {
    return(invisible(TRUE))
  }
)

#' @rdname mock-db-methods
#' @importFrom methods setMethod new
#' @export
setMethod(
  "dbGetQuery",
  signature("DBIMockRPostgreSQLConnection", "character"),
  function(conn, statement, ...) {
    # TODO: this is really only needed for RPostgreSQL, and even for that, we
    # likely could instead just mock `isPostgresqlIdCurrent` to return a valid
    # value
    # https://github.com/tomoakin/RPostgreSQL/blob/master/RPostgreSQL/R/PostgreSQLSupport.R#L266 #nolint
    res <- dbSendQuery(conn, statement, ...)
    return(mock_fetch(res, -1))
  }
)

#' @rdname mock-db-methods
#' @export
setMethod(
  "dbGetRowsAffected",
  "DBIMockResult",
  function(res, ...) {
    path <- make_path(res@path, "dbGetRowsAffected", res@hash)
    return(read_file(find_file(path)))
  }
)
