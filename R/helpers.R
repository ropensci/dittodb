# internal functions to easily turn on tracing for `dbGetQuery`/`dbFetchQuery`
turn_on_query_tracing <- function() {
  trace("dbGetQuery", quote(browser()),
        signature = c(conn = "DBIConnection", statement = "character"))
}


