#' Capture and record database transactions and save them as mocks
#'
#' When creating database fixtures, it can sometimes be helpful to record
#' the responses from the database for use in crafting tests.
#'
#' You can start capturing with `start_db_capturing()` and end it with
#' `stop_db_capturing()`. All queries run against a database will be executed like
#' normal, but their responses will be saved to the mock path given, so that if
#' you use the same queries later inside of a [`with_mock_db`] block, the
#' database functions will return as if they had been run against the database.
#'
#' Alternatively, you can wrap the code that you are trying to capture in the
#' function `capture_db_requests({...})` this does the same thing as
#' `start_db_capturing()` and `stop_db_capturing()` but without needing to
#' remember to stop the recording.
#'
#' You can redact certain columns using the `redact_columns` argument. This will
#' replace the values in the column with a generic redacted version. This works
#' by always passing the data being saved through [`redact_columns`].
#'
#' _note_ You should always call [`DBI::dbConnect`] inside of the capturing
#' block. When you connect to the database, dittodb sets up the mocks for the
#' specific database you're connecting to when you call [`DBI::dbConnect`].
#'
#' @param path the path to record mocks (default if missing: the first path in
#' `db_mock_paths()`.
#' @param redact_columns a character vector of columns to redact. Any column
#' that matches an entry will be redacted with a standard value for the column
#' type (e.g. characters will be replaced with "\[redacted\]")
#' @param expr an expression to evaluate while capturing requests (for
#' `capture_db_requests()`)
#'
#' @return `NULL` (invisibily)
#'
#' @examples
#' \donttest{
#' if (check_for_pkg("RSQLite", message)) {
#'   # Temporary files for examples
#'   nycflights_path <- tempfile()
#'
#'   con <- nycflights13_create_sqlite(location = nycflights_path)
#'   dbDisconnect(con)
#'
#'   start_db_capturing()
#'   con <- dbConnect(RSQLite::SQLite(), nycflights_path)
#'
#'   df_1 <- dbGetQuery(con, "SELECT * FROM airlines LIMIT 1")
#'   res <- dbSendQuery(con, "SELECT * FROM airlines LIMIT 2")
#'   df_2 <- dbFetch(res)
#'   dbClearResult(res)
#'
#'   dbDisconnect(con)
#'   stop_db_capturing()
#'
#'   start_db_capturing(redact_columns = "carrier")
#'   con <- dbConnect(RSQLite::SQLite(), nycflights_path)
#'
#'   df_3 <- dbGetQuery(con, "SELECT * FROM airlines LIMIT 3")
#'
#'   dbDisconnect(con)
#'   stop_db_capturing()
#'
#'   with_mock_db({
#'     con <- dbConnect(RSQLite::SQLite(), nycflights_path)
#'
#'     # the result from df1 above
#'     print(dbGetQuery(con, "SELECT * FROM airlines LIMIT 1"))
#'
#'     # the result from df3 above
#'     print(dbGetQuery(con, "SELECT * FROM airlines LIMIT 3"))
#'   })
#' }
#' }
#' @name capture_requests
NULL

connection_list <- c(
  "MariaDBConnection",
  "PostgreSQLConnection",
  "PqConnection",
  "SQLiteConnection",
  "OdbcConnection"
)

#' @rdname capture_requests
#' @export
start_db_capturing <- function(path, redact_columns = NULL) {
  if (!missing(path)) {
    ## Note that this changes state and doesn't reset it
    db_mock_paths(path)
  }

  set_redactor(redact_columns)

  ### functions

  quietly(trace_dbi(
    "dbConnect",
    tracer = dbConnectTrace
  ))

  quietly(trace_dbi(
    "dbSendQuery",
    exit = dbSendQueryTrace
  ))

  quietly(trace_dbi(
    "dbFetch",
    exit = recordFetch
  ))

  quietly(trace_dbi(
    "fetch",
    exit = recordFetch
  ))

  quietly(trace_dbi(
    "dbListTables",
    exit = dbListTablesTrace
  ))

  quietly(trace_dbi(
    "dbListFields",
    exit = dbListFieldsTrace
  ))

  quietly(trace_dbi(
    "dbExistsTable",
    exit = dbExistsTableTrace
  ))

  quietly(trace_dbi(
    "dbColumnInfo",
    exit = dbColumnInfoTrace
  ))

  quietly(trace_dbi(
    "dbGetRowsAffected",
    exit = dbGetRowsAffectedTrace
  ))

  # TODO: for RPostgreSQL to work, we need to prevent RPostgreSQL's
  # `postgresqlCloseConnection` from calling `dbListResults` which over-writes
  # our fixture
  # each connection has to be mocked separately because there's no
  # DBI::dbGetInfo for DBIConnection
  for (conn in connection_list) {
    if (method_loaded("dbGetInfo", conn)) {
      quietly(trace_dbi(
        "dbGetInfo",
        signature = conn,
        exit = dbGetInfoConTrace
      ))
    }
  }

  quietly(trace_dbi(
    "dbGetInfo",
    signature = "DBIResult",
    exit = dbGetInfoResultTrace
  ))

  if (method_loaded("dbGetInfo", "PostgreSQLResult")) {
    quietly(trace_dbi(
      "dbGetInfo",
      signature = "PostgreSQLResult",
      exit = dbGetInfoPsqlresultTrace
    ))
  }

  return(invisible(NULL))
}

recordFetch <- quote({
  if (dittodb_debug_level(1)) {
    message("Writing to ", .dittodb_env$curr_file_path)
  }
  out <- redact_columns(ans, columns = get_redactor())
  out <- serialize_bit64(out)
  # Control here is similar to c("all", "hexNumeric"), only without quoting
  dput(
    out,
    .dittodb_env$curr_file_path,
    control = c(
      "keepInteger",
      "showAttributes",
      "useSource",
      "warnIncomplete",
      "keepNA",
      "niceNames",
      "hexNumeric"
    )
  )
})

dbConnectTrace <- quote({
  .dittodb_env$db_path <- file.path(
    db_mock_paths()[1],
    get_dbname(list(...), drv = drv)
  )
  dir.create(.dittodb_env$db_path, showWarnings = FALSE, recursive = TRUE)
})

dbSendQueryTrace <- quote({
  check_db_path(.dittodb_env)

  if (dittodb_debug_level(2)) {
    message(
      "The statement: \n", statement,
      "\nwhich has been cleaned to: \n", clean_statement(statement),
      "\nis being hased to: ", hash(statement)
    )
  } else if (dittodb_debug_level(1)) {
    message(
      "The statement: \n", statement,
      "\nis being hased to: ", hash(statement)
    )
  }
  .dittodb_env$curr_file_path <- make_path(
    .dittodb_env$db_path,
    get_type(statement),
    hash(statement)
  )
})

dbListTablesTrace <- quote({
  check_db_path(.dittodb_env)
  thing <- returnValue()
  dput(
    thing,
    file.path(.dittodb_env$db_path, "dbListTables.R"),
    control = c("all", "hexNumeric")
  )
})

dbListFieldsTrace <- quote({
  check_db_path(.dittodb_env)
  thing <- returnValue()
  name <- sanitize_table_id(name, ...)
  dput(
    thing,
    file.path(.dittodb_env$db_path, glue::glue("dbListFields-{name}.R")),
    control = c("all", "hexNumeric")
  )
})

dbExistsTableTrace <- quote({
  check_db_path(.dittodb_env)
  thing <- returnValue()
  name <- sanitize_table_id(name, ...)
  dput(
    thing,
    file.path(.dittodb_env$db_path, glue::glue("dbExistsTable-{name}.R")),
    control = c("all", "hexNumeric")
  )
})

dbGetInfoConTrace <- quote({
  thing <- returnValue()
  path <- make_path(.dittodb_env$db_path, "conInfo", "")
  if (length(path) > 0) {
    # generally .dittodb_env$db_path is not-null, but RPostgreSQL uses
    # dbGetInfo in the connection process, don't record mocks then.
    dput(thing, path, control = c("all", "hexNumeric"))
  }
})

#' Extract a hash from a (result) object
#'
#' This function should generally not be used, but must be exported for the
#' query recording function to work properly
#'
#' @param obj the DBI result object to hash
#'
#' @return hash for the object
#' @export
#' @keywords internal
hash_db_object <- function(obj) {
  # TODO: would this be better if we traced the methods using signature?
  if (inherits(obj, "PostgreSQLResult")) {
    result_info <- RPostgreSQL::postgresqlResultInfo(obj)
    hash <- hash(result_info$statement)
  } else if (inherits(obj, c("MariaDBResult", "PqResult", "SQLiteResult"))) {
    hash <- hash(obj@sql)
  } else if (inherits(obj, "OdbcResult")) {
    hash <- hash(obj@statement)
  } else if (isS4(obj) && "m_sOperation" %in% methods::slotNames(obj)) {
    # This is propably a teradata result object, so we can use m_sOperation as hash input.
    hash <- hash(obj@m_sOperation)
  } else {
    # Stringify the result to get a hash is better than nothing
    hash <- hash(toString(obj))
  }

  return(hash)
}

dbGetInfoResultTrace <- quote({
  thing <- returnValue()
  hash <- hash_db_object(dbObj)
  path <- make_path(.dittodb_env$db_path, "resultInfo", hash)
  dput(thing, path, control = c("all", "hexNumeric"))
})

dbGetInfoPsqlresultTrace <- quote({
  thing <- returnValue()
  hash <- hash_db_object(dbObj)
  path <- make_path(.dittodb_env$db_path, "resultInfo", hash)
  if (length(path) > 0) {
    # generally .dittodb_env$db_path is not-null, but RPostgreSQL uses
    # dbGetInfo in the connection process, don't record mocks then.
    dput(thing, path, control = c("all", "hexNumeric"))
  }
})

# TODO: rationalize these so that they are the same for any list/scalar?
dbColumnInfoTrace <- quote({
  thing <- returnValue()
  hash <- hash_db_object(res)
  path <- make_path(.dittodb_env$db_path, "columnInfo", hash)
  dput(thing, path, control = c("all", "hexNumeric"))
})

dbGetRowsAffectedTrace <- quote({
  thing <- returnValue()
  hash <- hash_db_object(res)
  path <- make_path(.dittodb_env$db_path, "dbGetRowsAffected", hash)
  dput(thing, path, control = c("all", "hexNumeric"))
})

#' @rdname capture_requests
#' @export
stop_db_capturing <- function() {
  for (func in c(
    "dbSendQuery", "dbFetch", "dbConnect", "fetch", "dbListTables",
    "dbExistsTable", "dbListFields", "dbColumnInfo", "dbGetInfo",
    "dbGetRowsAffected"
  )) {
    # make sure we untrace the function:
    # * from the DBI namespace
    # * from the DBI environment
    # * as it is seen by the user (default for safe_untrace)
    safe_untrace(func, asNamespace("DBI"))
    safe_untrace(func, "DBI")
    safe_untrace(func)
  }

  remove_redactor()
}

#' @rdname capture_requests
#' @export
capture_db_requests <- function(expr, path, redact_columns = NULL) {
  start_db_capturing(redact_columns = redact_columns)
  on.exit(stop_db_capturing())
  where <- parent.frame()
  if (!missing(path)) {
    with_mock_path(path, eval(expr, where))
  } else {
    eval(expr, where)
  }
}

# for detecting if a particular method has been loaded
method_loaded <- Vectorize(function(method, signature) {
  return(any(grepl(signature, methods(method))))
}, vectorize.args = "signature")

# borrowed from httptest
safe_untrace <- function(what, where = sys.frame()) {
  ## If you attempt to untrace a function (1) that isn't exported from
  ## whatever namespace it lives in and (2) that isn't currently traced,
  ## it errors. This prevents that so that it's always safe to call `untrace`

  ## untrace() and get() handle enviroments differently
  if (is.environment(where)) {
    env <- where
  } else {
    env <- environment(where)
  }

  if (inherits(
    try(get(what, env), silent = TRUE),
    c("functionWithTrace", "standardGenericWithTrace")
  )) {
    quietly(untrace(what, where = where))
  }
}

# borrowed from httptest
quietly <- function(expr) {
  env <- parent.frame()
  if (dittodb_debug_level(1)) {
    eval(expr, env)
  } else {
    suppressMessages(eval(expr, env))
  }
}

# borrowed from httptest
trace_dbi <- function(...,
                      where_list = list(sys.frame(), asNamespace("DBI")),
                      print = dittodb_debug_level(1)) {
  for (place in where_list) {
    quietly(trace(..., print = print, where = place))
  }
}

set_redactor <- function(redactors) {
  .dittodb_env$redactor <- redactors
  return(invisible(redactors))
}

remove_redactor <- function() {
  if (exists("redactor", envir = .dittodb_env)) {
    rm("redactor", envir = .dittodb_env)
  }

  return(invisible(NULL))
}

#' Get the current redactor
#'
#' This function should generally not be used, but must be exported for the
#' query recording function to work properly
#'
#' @return the current list of columns to redact
#' @export
#' @keywords internal
get_redactor <- function() {
  if (exists("redactor", envir = .dittodb_env)) {
    return(get("redactor", envir = .dittodb_env))
  }

  return(NULL)
}

#' Check for dittodb environment path
#'
#' This function should generally not be used, but must be exported for the
#' query recording function to work properly
#'
#' @param .dittodb_env Environment object
#'
#' @return `NULL`, invisibly.
#' @keywords internal
#' @export
check_db_path <- function(.dittodb_env) {
  if (is.null(.dittodb_env$db_path)) {
    rlang::abort(
      message = c("Database capture failed",
                  "*" = "The database connection object was created before calling 'start_db_capturing()'",
                  "*" = "Please ensure the connection is created after calling 'start_db_capturing()'."
      ),
      call = rlang::caller_env()
    )
  }

  return(invisible())
}
