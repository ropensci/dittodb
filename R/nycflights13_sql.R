#' Create a standardised database for testing
#'
#' Using the connection given in `con`, create a database including a few tables
#' from the [`nycflights13`](nycflights13) dataset.
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
#' \dontrun{
#' connections <- list(
#'  odbc = DBI::dbConnect(
#'   odbc::odbc(),
#'   Driver   = "PostgreSQL Unicode",
#'   Server   = "127.0.0.1",
#'   Database = "postgres",
#'   UID      = "travis",
#'   PWD      = "",
#'   Port     = 5432
#'  ),
#'  rpostgresql = RPostgreSQL::dbConnect(
#'   drv      = DBI::dbDriver("PostgreSQL"),
#'   host     = "127.0.0.1",
#'   dbname   = "postgres",
#'   user     = "travis",
#'   password = "",
#'   port     = 5432
#'  ),
#'  rpostgres = DBI::dbConnect(
#'   drv      = RPostgres::Postgres(),
#'   host     = "127.0.0.1",
#'   dbname   = "postgres",
#'   user     = "travis",
#'   password = "",
#'   port     = 5432
#'  )
#' )
#'
#' nycflights13_sql(connections$odbc, schema = "nycflights13")
#' # same as
#' # nycflights13_sql(connections$rpostgresql, schema = "nycflights13")
#' # also same as
#' # nycflights13_sql(connections$rpostgres, schema = "nycflights13")
#' }
nycflights13_sql <- function(con, schema = "", ...) {
  local_tables <- utils::data(package = "nycflights13")$results[, 3]

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

  if (inherits(con, "SQLiteConnection") | schema == "") {
    # we don't have schema information or it's not compatible, proceed without.
    remote_tables <- dbListTables(con)
  } else {
    remote_schemas <- DBI::dbGetQuery(
      con,
      glue::glue_sql("SELECT schema_name FROM information_schema.schemata",
                     .con = con
      )
    )

    remote_schemas <- as.character(remote_schemas$schema_name)

    if (!(schema %in% remote_schemas)) {
      DBI::dbExecute(
        con,
        glue::glue_sql("CREATE SCHEMA {`schema`}",
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
      # unique_indexes = unique_index[[table]],
      # indexes = index[[table]],
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
#' to [`nycflights13_sql`])
#'
#' @return RSQLiteConnection
#'
#' @export
#'
#' @examples
#' \dontrun{
#' con <- nycflights13_sqlite()
#' }
nycflights13_sqlite <- function(location = ":memory:", ...) {
  check_for_pkg("RSQLite")
  sqlite_con <- dbConnect(RSQLite::SQLite(), location)

  sqlite_con <- nycflights13_sql(sqlite_con, schema = "", ...)

  return(invisible(sqlite_con))
}
