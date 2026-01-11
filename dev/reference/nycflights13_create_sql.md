# Create a standardised database for testing

Using the connection given in `con`, create a database including a few
tables from the
[`nycflights13`](https://CRAN.R-project.org/package=nycflights13)
dataset.

## Usage

``` r
nycflights13_create_sql(con, schema = "", ...)
```

## Arguments

- con:

  an SQL connection (i.e a PostgreSQL connection)

- schema:

  schema to write the tables ("", or no schema by default)

- ...:

  additional parameters to connect to a database

## Value

the connection given in `con` invisibly, generally called for the side
effects of writing to the database

## Examples

``` r
# \donttest{
if (check_for_pkg("RSQLite", message)) {
  con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")

  nycflights13_create_sql(con)

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
