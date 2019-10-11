#' Capture and record database transactions and save them as mocks
#'
#' @name capture_requests
NULL

# borrowed from httptest
safe_untrace <- function (what, where=sys.frame()) {
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
    try(get(what, env), silent=TRUE),
    c("functionWithTrace", "standardGenericWithTrace")
  )) {
    quietly(untrace(what, where=where))
  }
}

# borrowed from httptest
quietly <- function (expr) {
  env <- parent.frame()
  if (getOption("dbtest.debug", FALSE)) {
    eval(expr, env)
  } else {
    suppressMessages(eval(expr, env))
  }
}



#' @rdname capture_requests
#' @export
start_capturing <- function() {
  quietly(trace(
    "dbConnect",
    exit = quote({
      .dbtest_env$db_path <-get_dbname(list(...))
      dir.create(.dbtest_env$db_path, showWarnings = FALSE, recursive = TRUE)
      }),
    print = getOption("dbtest.debug", FALSE),
    where = asNamespace("DBI")
  ))

  quietly(trace(
    "dbSendQuery",
    exit = quote({
      .dbtest_env$curr_file_path <- make_path(
        .dbtest_env$db_path,
        strsplit(statement, " ")[[1]][1],
        hash(statement)
      )
    }),
    print = getOption("dbtest.debug", FALSE),
    where = asNamespace("DBI")
  ))

  quietly(trace(
    "dbFetch",
    exit = quote(dput(ans, .dbtest_env$curr_file_path)),
    print = getOption("dbtest.debug", FALSE),
    where = asNamespace("DBI")
  ))

  return(invisible(NULL))
}

#' an environment for dbtest storing state
#'
#' @export
.dbtest_env <- new.env(parent = emptyenv())

#' @rdname capture_requests
#' @export
stop_capturing <- function () {
  for (func in c("dbSendQuery", "dbFetch", "dbConnect")) {
    safe_untrace(func, asNamespace("DBI"))
  }
}
