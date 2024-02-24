# should be only DBIMockRPostgresConnection?
#' @rdname mock-db-methods
#' @export
setMethod(
  "dbQuoteIdentifier",
  c("DBIMockRPostgresConnection", "character"),
  function(conn, x, ...) {
    # double up any quotes we see before quoting
    x <- gsub('"', '""', x)
    return(SQL(glue('"{x}"'), names = names(x)))
  }
)

#' @rdname mock-db-methods
#' @export
setMethod(
  "dbQuoteIdentifier",
  c("DBIMockRPostgresConnection", "SQL"),
  function(conn, x, ...) {
    return(x)
  }
)

#' @rdname mock-db-methods
#' @export
setMethod(
  "dbQuoteString",
  c("DBIMockRPostgresConnection", "character"),
  function(conn, x, ...) {
    return(SQL(glue("'{x}'"), names = names(x)))
  }
)

#' @rdname mock-db-methods
#' @export
setMethod(
  "dbQuoteString",
  c("DBIMockRPostgresConnection", "SQL"),
  function(conn, x, ...) {
    return(x)
  }
)

#' @rdname mock-db-methods
#' @export
setMethod(
  "dbQuoteString",
  c("DBIMockMariaDBConnection", "character"),
  function(conn, x, ...) {
    return(SQL(glue("'{x}'"), names = names(x)))
  }
)

#' @rdname mock-db-methods
#' @export
setMethod(
  "dbQuoteString",
  c("DBIMockMariaDBConnection", "SQL"),
  function(conn, x, ...) {
    return(x)
  }
)

#' @rdname mock-db-methods
#' @export
setMethod(
  "dbQuoteIdentifier",
  c("DBIMockOdbcConnection", "character"),
  function(conn, x, ...) {
    # double up any quotes we see before quoting
    x <- gsub('"', '""', x)
    return(SQL(glue('"{x}"'), names = names(x)))
  }
)

#' @rdname mock-db-methods
#' @export
setMethod(
  "dbQuoteIdentifier",
  c("DBIMockOdbcConnection", "SQL"),
  function(conn, x, ...) {
    return(x)
  }
)

#' @rdname mock-db-methods
#' @export
setMethod(
  "dbQuoteString",
  c("DBIMockOdbcConnection", "character"),
  function(conn, x, ...) {
    return(SQL(glue("'{x}'"), names = names(x)))
  }
)

#' @rdname mock-db-methods
#' @export
setMethod(
  "dbQuoteString",
  c("DBIMockOdbcConnection", "SQL"),
  function(conn, x, ...) {
    return(x)
  }
)

