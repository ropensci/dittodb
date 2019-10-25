#' Create a standardised database for testing
#'
#' Using the connection given in `con`, create a database including a few tables
#' from the [`nycflights2013`] dataset.
#'
#' @param con an SQL connection (i.e a PostgreSQL connection)
#' @param schema schema to write the tables ("", or no schema by default)
#' @param method should the tables be created with DBI methods or dplyr methods?
#'  (either "dbi" or "dplyr"; "dbi" by default)
#' @param ... additional parameters to connect to a database
#'
#' @importFrom DBI dbListTables dbWriteTable
#' @importFrom glue glue_sql
#' @importFrom utils head
#'
#' @return the connection given in `con` invisibly, generally called for the side effects
#' of writing to the  database
#'
#' @export
#' @examples
#' \dontrun{
#' # we assume credentials is a list specified in .Rprofile
#'
#' # odbc + DBI
#' psql_con <- DBI::dbConnect(
#'  odbc::odbc(),
#'  Driver   = "PostgreSQL Unicode",
#'  Server   = credentials[["host"]],
#'  Database = "postgres",
#'  UID      = credentials[["usr"]],
#'  PWD      = credentials[["pwd"]],
#'  Port     = 5432
#' )
#'
#' # RPostgreSQL + DBI
#' psql_con <- RPostgreSQL::dbConnect(
#'  drv = DBI::dbDriver("PostgreSQL"),
#'  host = credentials[["host"]],
#'  dbname = "postgres",
#'  user = credentials[["usr"]],
#'  password = credentials[["pwd"]],
#'  port     = 5432
#' )
#'
#' # RPostgres + DBI
#' psql_con <- DBI::dbConnect(
#'  drv = RPostgres::Postgres(),
#'  host = credentials[["host"]],
#'  dbname = "postgres",
#'  user = credentials[["usr"]],
#'  password = credentials[["pwd"]],
#'  port = 5432
#' )
#'
#' nycflights13_sql(psql_con, schema = "nycflights13", method = "dbi")
#' }
nycflights13_sql <- function(con,
                             schema = "",
                             method = c("dbi", "dplyr"),
                             ...) {
  method <- match.arg(method)

  local_tables <- utils::data(package = "nycflights13")$results[, 3]

  unique_index <- list(
    airlines = list("carrier"),
    planes = list("tailnum")
  )

  index <- list(
    airports = list("faa"),
    flights = list(c("year", "month", "day"), "carrier", "tailnum", "origin", "dest"),
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
      DBI::dbGetQuery(
        con,
        glue::glue_sql("CREATE SCHEMA {`schema`}",
          .con = con
        )
      )
    }

    remote_tables <- DBI::dbGetQuery(
      con,
      glue::glue_sql("SELECT table_name FROM information_schema.tables WHERE table_schema={schema}",
        .con = con
      )
    )

    remote_tables <- as.character(remote_tables$table_name)
  }


  tables <- setdiff(local_tables, remote_tables)

  if (method == "dbi") {
    message("using DBI to create the database")

    # Create missing tables
    for (table in tables) {
      df <- head(getExportedValue("nycflights13", table), 1000)
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
        unique_indexes = unique_index[[table]],
        indexes = index[[table]],
        temporary = FALSE,
        row.names = FALSE
      )
    }
  } else {
    check_for_pkg("dplyr")
    message("using dplyr to create the database")

    # Create missing tables
    for (table in tables) {
      df <- head(getExportedValue("nycflights13", table), 1000)
      message("Creating table: ", table)

      if (schema != "") {
        table_name <- dbplyr::in_schema(schema, table)
      } else {
        table_name <- table
      }

      dplyr::copy_to(
        con,
        df,
        name = table_name,
        unique_indexes = unique_index[[table]],
        indexes = index[[table]],
        temporary = FALSE,
        row.names = FALSE
      )
    }
  }

  return(invisible(con))
}


#' Create an in-memory SQLite database for testing
#'
#' @param ... additional parameters to connect to a database (most are passed on
#' to [`nycflights_sql`])
#'
#' @return RSQLiteConnection
#'
#' @export
#'
#' @examples
#' \dontrun{
#' con <- nycflights13_sqlite()
#' }
nycflights13_sqlite <- function(...) {
  check_for_pkg("RSQLite")
  sqlite_con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")

  nycflights13_sql(sqlite_con, schema = "", ...)

  return(invisible(sqlite_con))
}
