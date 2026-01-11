# Capture and record database transactions and save them as mocks

When creating database fixtures, it can sometimes be helpful to record
the responses from the database for use in crafting tests.

## Usage

``` r
start_db_capturing(path, redact_columns = NULL)

stop_db_capturing()

capture_db_requests(expr, path, redact_columns = NULL)
```

## Arguments

- path:

  the path to record mocks (default if missing: the first path in
  [`db_mock_paths()`](https://dittodb.jonkeane.com/reference/mockPaths.md).

- redact_columns:

  a character vector of columns to redact. Any column that matches an
  entry will be redacted with a standard value for the column type (e.g.
  characters will be replaced with "\[redacted\]")

- expr:

  an expression to evaluate while capturing requests (for
  `capture_db_requests()`)

## Value

`NULL` (invisibily)

## Details

You can start capturing with `start_db_capturing()` and end it with
`stop_db_capturing()`. All queries run against a database will be
executed like normal, but their responses will be saved to the mock path
given, so that if you use the same queries later inside of a
[`with_mock_db`](https://dittodb.jonkeane.com/reference/mockdb.md)
block, the database functions will return as if they had been run
against the database.

Alternatively, you can wrap the code that you are trying to capture in
the function `capture_db_requests({...})` this does the same thing as
`start_db_capturing()` and `stop_db_capturing()` but without needing to
remember to stop the recording.

You can redact certain columns using the `redact_columns` argument. This
will replace the values in the column with a generic redacted version.
This works by always passing the data being saved through
[`redact_columns`](https://dittodb.jonkeane.com/reference/redact_columns.md).

*note* You should always call
[`DBI::dbConnect`](https://dbi.r-dbi.org/reference/dbConnect.html)
inside of the capturing block. When you connect to the database, dittodb
sets up the mocks for the specific database you're connecting to when
you call
[`DBI::dbConnect`](https://dbi.r-dbi.org/reference/dbConnect.html).

## Examples

``` r
# \donttest{
if (check_for_pkg("RSQLite", message)) {
  # Temporary files for examples
  nycflights_path <- tempfile()

  con <- nycflights13_create_sqlite(location = nycflights_path)
  dbDisconnect(con)

  start_db_capturing()
  con <- dbConnect(RSQLite::SQLite(), nycflights_path)

  df_1 <- dbGetQuery(con, "SELECT * FROM airlines LIMIT 1")
  res <- dbSendQuery(con, "SELECT * FROM airlines LIMIT 2")
  df_2 <- dbFetch(res)
  dbClearResult(res)

  dbDisconnect(con)
  stop_db_capturing()

  start_db_capturing(redact_columns = "carrier")
  con <- dbConnect(RSQLite::SQLite(), nycflights_path)

  df_3 <- dbGetQuery(con, "SELECT * FROM airlines LIMIT 3")

  dbDisconnect(con)
  stop_db_capturing()

  with_mock_db({
    con <- dbConnect(RSQLite::SQLite(), nycflights_path)

    # the result from df1 above
    print(dbGetQuery(con, "SELECT * FROM airlines LIMIT 1"))

    # the result from df3 above
    print(dbGetQuery(con, "SELECT * FROM airlines LIMIT 3"))
  })
}
#> Creating the testing database from nycflights13
#> Creating table: airlines
#> Creating table: airports
#> Creating table: flights
#> Creating table: planes
#> Creating table: weather
#>   carrier              name
#> 1      9E Endeavor Air Inc.
#>      carrier                   name
#> 1 [redacted]      Endeavor Air Inc.
#> 2 [redacted] American Airlines Inc.
#> 3 [redacted]   Alaska Airlines Inc.
#>      carrier                   name
#> 1 [redacted]      Endeavor Air Inc.
#> 2 [redacted] American Airlines Inc.
#> 3 [redacted]   Alaska Airlines Inc.
# }
```
