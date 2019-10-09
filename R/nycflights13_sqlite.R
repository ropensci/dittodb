#' Create an in-memory SQLite database for testing
#'
#' @return A xxx object
#' @importFrom dplyr src_sqlite src_tbls copy_to
#' @export
#'
#' @examples
#' nycflights13_sqlite()

nycflights13_sqlite <- function(use = "dplyr") {
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

  if (use == "dplyr") {
    db <- dplyr::src_sqlite(":memory:", create = TRUE)

    tables <- setdiff(all, dplyr::src_tbls(db))

    # Create missing tables
    for (table in tables) {
      df <- getExportedValue("nycflights13", table)
      message("Creating table: ", table)

      dplyr::copy_to(
        db,
        df,
        name = table,
        unique_indexes = unique_index[[table]],
        indexes = index[[table]],
        temporary = FALSE
      )
    }
  } else {
    if (use == "DBI") {
      db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")

      tables <- setdiff(all, DBI::dbListTables(db))

      # Create missing tables
      for (table in tables) {
        df <- getExportedValue("nycflights13", table)
        message("Creating table: ", table)

        DBI::dbWriteTable(
          db,
          table,
          df,
          unique_indexes = unique_index[[table]],
          indexes = index[[table]],
          temporary = FALSE
        )
      }
    } else {
      stop()
    }
  }
  return(db)
}
