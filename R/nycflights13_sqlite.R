#' Create an in-memory SQLite database for testing
#'
#' @param sqlite logical, when FALSE the function shall use odbc
#' @param ... additional parameters to connect to a database
#'
#' @return RSQLite object
#' @importFrom DBI dbConnect
#' @importFrom RSQLite SQLite
#' @importFrom dplyr copy_to
#' @export
#'
#' @examples
#' \dontrun{
#' nycflights13_sql(type = "sqlite")
#' }
nycflights13_sql <- function(sqlite = TRUE, ...) {
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
    con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  } else {
    con <- DBI::dbConnect(odbc::odbc(), ...)
  }

  tables <- setdiff(all, dbListTables(con))

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

  return(con)
}
