#' Create an in-memory SQLite database for testing
#' @param con an SQL connection (i.e a PostgreSQL connection)
#' @param schema schema to write the tables ("public" by default)
#' @param ... additional parameters to connect to a database
#' @importFrom DBI dbListTables dbWriteTable
#' @importFrom glue glue_sql
#' @return writes to remote database
#' @export
#' @examples
#' \dontrun{
#' # psql_con is a PostgreSQL connnection from .Rprofile
#' nycflights13_sql(psql_con, schema = "nycflights13")
#' }
nycflights13_sql <- function(con, schema = "public", ...) {
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

  remote_schemas <- DBI::dbGetQuery(con,
                               glue::glue_sql("SELECT schema_name FROM information_schema.schemata",
                                              .con = con))

  remote_schemas <- as.character(remote_schemas$schema_name)

  if (any(schema %in% remote_schemas) == FALSE) {
    DBI::dbGetQuery(con,
                    glue::glue_sql("CREATE SCHEMA {`schema`}",
                                   .con = con))
  }

  remote_tables <- DBI::dbGetQuery(con,
                                   glue::glue_sql("SELECT table_name FROM information_schema.tables WHERE table_schema={schema}",
                                                  .con = con))

  remote_tables <- as.character(remote_tables$table_name)

  tables <- setdiff(local_tables, remote_tables)

  if (check_for_pkg("dplyr") == FALSE) {
    message("dplyr was not found, using DBI instead to create the database")

    # Create missing tables
    for (table in tables) {
      df <- getExportedValue("nycflights13", table)
      message("Creating table: ", table)

      DBI::dbWriteTable(
        con,
        c(schema, table),
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
        con,
        df,
        name = dbplyr::in_schema(schema, table),
        unique_indexes = unique_index[[table]],
        indexes = index[[table]],
        temporary = FALSE
      )
    }
  }
}
