#' Create a standardised database for testing
#'
#' Using the connection given in `con`, create a database including a few tables
#' from the [`nycflights13`](https://CRAN.R-project.org/package=nycflights13) dataset.
#'
#' @param con an SQL connection (i.e a PostgreSQL connection)
#' @param schema schema to write the tables ("", or no schema by default)
#' @param ... additional parameters to connect to a database
#'
#' @importFrom DBI dbListTables dbWriteTable
#' @importFrom glue glue_sql
#' @importFrom utils head
#'
#' @return the connection given in `con` invisibly, generally called for the
#' side effects of writing to the database
#'
#' @export
#' @examples
#' \donttest{
#' if (check_for_pkg("RSQLite", message)) {
#'   con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
#'
#'   nycflights13_create_sql(con)
#'
#'   DBI::dbGetQuery(
#'     con,
#'     "SELECT year, month, day, carrier, flight, tailnum FROM flights LIMIT 10"
#'   )
#'
#'   DBI::dbDisconnect(con)
#' }
#' }
nycflights13_create_sql <- function(con, schema = "", ...) {
  check_for_pkg("nycflights13", message)
  local_tables <- utils::data(package = "nycflights13")$results[, "Item"]

  unique_index <- list(
    airlines = list("carrier"),
    planes = list("tailnum")
  )

  index <- list(
    airports = list("faa"),
    flights = list(
      c("year", "month", "day"), "carrier", "tailnum", "origin", "dest"
    ),
    weather = list(c("year", "month", "day"), "origin")
  )

  if (inherits(con, "SQLiteConnection") || schema == "") {
    # we don't have schema information or it's not compatible, proceed without.
    remote_tables <- dbListTables(con)
  } else {
    remote_schemas <- DBI::dbGetQuery(
      con,
      glue::glue_sql(
        "SELECT schema_name FROM information_schema.schemata",
        .con = con
      )
    )

    remote_schemas <- as.character(remote_schemas$schema_name)

    if (!(schema %in% remote_schemas)) {
      DBI::dbExecute(
        con,
        glue::glue_sql(
          "CREATE SCHEMA {`schema`}",
          .con = con
        )
      )
    }

    remote_tables <- DBI::dbGetQuery(
      con,
      glue::glue_sql(
        paste0(
          "SELECT table_name FROM information_schema.tables WHERE ",
          "table_schema={schema}"
        ),
        .con = con
      )
    )

    remote_tables <- as.character(remote_tables$table_name)
  }


  tables <- setdiff(local_tables, remote_tables)

  message("Creating the testing database from nycflights13")

  # Create missing tables
  for (table in tables) {
    df <- getExportedValue("nycflights13", table)

    message("Creating table: ", table)

    if (schema != "") {
      if (class(con) %in% "PostgreSQLConnection") {
        table_name <- c(schema, table)
      } else {
        table_name <- DBI::Id(schema = schema, table = table)
      }
    } else {
      table_name <- table
    }

    DBI::dbWriteTable(
      con,
      table_name,
      df,
      temporary = FALSE,
      row.names = FALSE,
      overwrite = TRUE
    )
  }

  return(invisible(con))
}


#' Create an in-memory SQLite database for testing
#'
#' @param location where to store the database
#' @param ... additional parameters to connect to a database (most are passed on
#' to [`nycflights13_create_sql`])
#'
#' @return RSQLiteConnection
#'
#' @export
#'
#' @examples
#' \donttest{
#' if (check_for_pkg("RSQLite", message)) {
#'   con <- nycflights13_create_sqlite()
#'
#'   DBI::dbGetQuery(
#'     con,
#'     "SELECT year, month, day, carrier, flight, tailnum FROM flights LIMIT 10"
#'   )
#'
#'   DBI::dbDisconnect(con)
#' }
#' }
nycflights13_create_sqlite <- function(location = ":memory:", ...) {
  check_for_pkg("RSQLite")
  sqlite_con <- dbConnect(RSQLite::SQLite(), location)

  sqlite_con <- nycflights13_create_sql(sqlite_con, schema = "", ...)

  return(invisible(sqlite_con))
}

#' An SQLite connection to a subset of nycflights13
#'
#' Included with `dittodb` is a small subset of
#' [`nycflights13`](https://CRAN.R-project.org/package=nycflights13)
#' prepopulated into a `sqlite` database.
#'
#' This database is helpful for getting to know `dittodb` and running example
#' code. It contains a small subset of the data in nycflights13: namely only the
#' flights and planes that had a destination of ORD or MDW (the codes for the
#' two major airports in Chicago) in February of 2013. The airports table has
#' also been limited to only the New York and Chicago area airports.
#'
#' @return an RSQLiteConnection
#'
#' @export
#'
#' @examples
#' if (check_for_pkg("RSQLite", message)) {
#'   con <- nycflights_sqlite()
#'
#'   DBI::dbGetQuery(con, "SELECT flight, tailnum, origin, dest FROM flights LIMIT 10")
#'   DBI::dbGetQuery(con, "SELECT faa, name, lat, lon, alt, tz FROM airports")
#'
#'   DBI::dbDisconnect(con)
#' }
nycflights_sqlite <- function() {
  check_for_pkg("RSQLite")
  path <- system.file("nycflights.sqlite", package = "dittodb")

  return(DBI::dbConnect(RSQLite::SQLite(), path))
}
