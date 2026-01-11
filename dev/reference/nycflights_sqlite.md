# An SQLite connection to a subset of nycflights13

Included with `dittodb` is a small subset of
[`nycflights13`](https://CRAN.R-project.org/package=nycflights13)
prepopulated into a `sqlite` database.

## Usage

``` r
nycflights_sqlite()
```

## Value

an RSQLiteConnection

## Details

This database is helpful for getting to know `dittodb` and running
example code. It contains a small subset of the data in nycflights13:
namely only the flights and planes that had a destination of ORD or MDW
(the codes for the two major airports in Chicago) in February of 2013.
The airports table has also been limited to only the New York and
Chicago area airports.

## Examples

``` r
if (check_for_pkg("RSQLite", message)) {
  con <- nycflights_sqlite()

  DBI::dbGetQuery(con, "SELECT flight, tailnum, origin, dest FROM flights LIMIT 10")
  DBI::dbGetQuery(con, "SELECT faa, name, lat, lon, alt, tz FROM airports")

  DBI::dbDisconnect(con)
}
```
