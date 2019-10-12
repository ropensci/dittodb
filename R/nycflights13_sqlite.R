#' Create an in-memory SQLite database for testing
#'
#' @param sqlite logical, when FALSE the function shall use odbc
#' @param use should the connection use/return a dplyr-based or DBI-based
#' connection? (default: DBI)
#' @param ... additional parameters to connect to a database
#'
#' @return RSQLite object
#' @export
#'
#' @examples
#' \dontrun{
#' nycflights13_sql(type = "sqlite")
#' }
nycflights13_sql <- function(sqlite = TRUE, use = c("DBI", "dplyr"), ...) {
  use <- match.arg(use)

  all <- utils::data(package = "nycflights13")$results[, 3]

  unique_index <- list(
    airlines = list("carrier"),
    planes =   list("tailnum")
  )

  index <- list(
    airports = list("faa"),
    flights =  list(c("year", "month", "day"), "carrier", "tailnum", "origin", "dest"),
    weather =  list(c("year", "month", "day"), "origin")
  )

  if (sqlite == TRUE) {
    check_for_pkg("RSQLite")
    con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  } else {
    check_for_pkg("odbc")
    con <- DBI::dbConnect(odbc::odbc(), ...)
  }

  tables <- setdiff(all, dbListTables(con))

  if (use == "DBI") {
    # Create missing tables
    for (table in tables) {
      df <- getExportedValue("nycflights13", table)
      message("Creating table: ", table)

      DBI::dbWriteTable(
        con,
        table,
        df,
        unique_indexes = unique_index[[table]],
        indexes = index[[table]],
        temporary = FALSE
      )
    }
  } else if (use == "dplyr") {
    check_for_pkg("dplyr")
    # Create missing tables
    for (table in tables) {
      df <- getExportedValue("nycflights13", table)
      message("Creating table: ", table)

      dplyr::copy_to(
        con,
        df,
        name = table,
        unique_indexes = unique_index[[table]],
        indexes = index[[table]],
        temporary = FALSE
      )
    }
  }

  return(con)
}
