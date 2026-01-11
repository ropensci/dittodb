# Create an in-memory SQLite database for testing

Create an in-memory SQLite database for testing

## Usage

``` r
nycflights13_create_sqlite(location = ":memory:", ...)
```

## Arguments

- location:

  where to store the database

- ...:

  additional parameters to connect to a database (most are passed on to
  [`nycflights13_create_sql`](https://dittodb.jonkeane.com/reference/nycflights13_create_sql.md))

## Value

RSQLiteConnection

## Examples

``` r
# \donttest{
if (check_for_pkg("RSQLite", message)) {
  con <- nycflights13_create_sqlite()

  DBI::dbGetQuery(
    con,
    "SELECT year, month, day, carrier, flight, tailnum FROM flights LIMIT 10"
  )

  DBI::dbDisconnect(con)
}
#> Creating the testing database from nycflights13
#> Creating table: airlines
#> Creating table: airports
#> Creating table: flights
#> Creating table: planes
#> Creating table: weather
# }
```
