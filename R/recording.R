#' Capture and record database transactions and save them as mocks
#'
#' When creating database fixtures, it can sometimes be helpful to see record the
#' responses from the database for use in crafting tests.
#'
#' You can start
#' capturing with `start_capturing()` and end it with `stop_capturing`. All
#' queries run against a database will be executed like normal, but their
#' responses will be saved to the mock path given, so that if you use the same
#' queries later inside of a [`with_mock_db`] block, the database functions will
#' return as if they had been run against the database.
#'
#' _note_ You should always call [`DBI::dbConnect`] inside of the capturing
#' block. When you connect to the database, dbtest sets up the mocks for the
#' specific database you're connecting to when you call [`DBI::dbConnect`].
#'
#' @param path the path to record mocks (default if missing: the first path in
#' `.mockPaths()`.
#'
#' @return NULL (invisibily)
#'
#' @examples
#' \dontrun{
#' start_capturing()
#' con <- dbConnect(RSQLite::SQLite(), "memory")
#'
#' df_1 <- dbGetQuery(con, "SELECT * FROM rpostgresql.airlines LIMIT 1")
#' res <- dbSendQuery(con, "SELECT * FROM rpostgresql.airlines LIMIT 2")
#' df_2 <- dbFetch(res)
#'
#' dbDisconnect(con)
#' stop_capturing()
#' }
#' @name capture_requests
NULL

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
  if (dbtest_debug_level(2)) {
    eval(expr, env)
  } else {
    suppressMessages(eval(expr, env))
  }
}

# borrowed from httptest
trace_dbi <- function(...,
                      where_list = list(sys.frame(), asNamespace("DBI")),
                      print = dbtest_debug_level(2)) {
  for (place in where_list) {
    quietly(trace(..., print = print, where = place))
  }
}


#' @rdname capture_requests
#' @export
start_capturing <- function(path) {
  if (!missing(path)) {
    ## Note that this changes state and doesn't reset it
    .mockPaths(path)
  }

  quietly(trace_dbi(
    "dbConnect",
    exit = quote({
      .dbtest_env$db_path <- file.path(.mockPaths()[1], get_dbname(list(...)))
      dir.create(.dbtest_env$db_path, showWarnings = FALSE, recursive = TRUE)
    })
  ))

  quietly(trace_dbi(
    "dbSendQuery",
    exit = quote({
      if (dbtest_debug_level(1)) {
        message(
          "The statement: \n", statement,
          "\nis being hased to: ", hash(statement)
        )
      }
      .dbtest_env$curr_file_path <- make_path(
        .dbtest_env$db_path,
        get_type(statement),
        hash(statement)
      )
    })
  ))

  #' @export
  recordFetch <- quote({
    if (dbtest_debug_level(1)) {
      message("Writing to ", .dbtest_env$curr_file_path)
    }
    dput(ans, .dbtest_env$curr_file_path)
  })

  quietly(trace_dbi(
    "dbFetch",
    exit = recordFetch
  ))

  quietly(trace_dbi(
    "fetch",
    exit = recordFetch
  ))

  quietly(trace_dbi(
    "dbGetRowsAffected",
    exit = quote(dput(result_rows_affected(res@ptr), .dbtest_env$curr_file_path)),
    print = dbtest_debug_level(2),
    where_list = list(topenv(parent.frame())) # the default for trace
  ))

  return(invisible(NULL))
}

#' an environment for dbtest storing state
#'
#' @export
#' @keywords internal
.dbtest_env <- new.env(parent = emptyenv())

#' @rdname capture_requests
#' @export
stop_capturing <- function() {
  for (func in c("dbSendQuery", "dbFetch", "dbConnect")) {
    # make sure we untrace the function:
    # * from the DBI namespace
    # * from the DBI environment
    # * as it is seen by the user (default for safe_untrace)
    safe_untrace(func, asNamespace("DBI"))
    safe_untrace(func, "DBI")
    safe_untrace(func)
  }
}
