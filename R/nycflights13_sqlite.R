#' Create an in-memory SQLite database for testing
#' @param ... additional parameters to connect to a database
#' @importFrom DBI dbListTables dbWriteTable
#' @return RSQLite object
#' @export
#' @examples
#' \dontrun{
#' nycflights13_sqlite()
#' }
nycflights13_sqlite <- function(...) {
  local_tables <- utils::data(package = "nycflights13")$results[, 3]

  unique_index <- list(
    airlines = list("carrier"),
    planes =   list("tailnum")
  )

  index <- list(
    airports = list("faa"),
    flights =  list(c("year", "month", "day"), "carrier", "tailnum", "origin", "dest"),
    weather =  list(c("year", "month", "day"), "origin")
  )

  check_for_pkg("RSQLite")
  sqlite_con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")

  tables <- setdiff(local_tables, DBI::dbListTables(sqlite_con))

  if (check_for_pkg("dplyr") == FALSE) {
    message("dplyr was not found, using DBI instead to create the database")

    # Create missing tables
    for (table in tables) {
      df <- getExportedValue("nycflights13", table)
      message("Creating table: ", table)

      DBI::dbWriteTable(
        sqlite_con,
        table,
        df,
        unique_indexes = unique_index[[table]],
        indexes = index[[table]],
        temporary = FALSE
      )
    }
  } else {
    message("dplyr was found, using it to create the database")

    # Create missing tables
    for (table in tables) {
      df <- getExportedValue("nycflights13", table)
      message("Creating table: ", table)

      dplyr::copy_to(
        sqlite_con,
        df,
        name = table,
        unique_indexes = unique_index[[table]],
        indexes = index[[table]],
        temporary = FALSE
      )
    }
  }

  return(sqlite_con)
}
