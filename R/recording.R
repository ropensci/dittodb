#' Capture and record database transactions and save them as mocks
#'
#' @param path the path to record mocks.
#'
#' @return NULL (invisibily)
#'
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
trace_dbi <- function (..., where_list = list(sys.frame()),  print = dbtest_debug_level(2)) {
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
    }),
    where_list = c(sys.frame(), asNamespace("DBI"))
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
    }),
    where_list = c(sys.frame(), asNamespace("DBI"))
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
    exit = recordFetch,
    where_list = c(sys.frame(), asNamespace("DBI"))
  ))

  quietly(trace_dbi(
    "fetch",
    exit = recordFetch,
    where_list = c(sys.frame(), asNamespace("DBI"))
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
