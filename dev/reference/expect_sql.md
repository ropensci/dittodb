# Detect if a specific SQL statement is sent

**\[experimental\]**

## Usage

``` r
expect_sql(object, regexp = NULL, ...)
```

## Arguments

- object:

  the expression to evaluate

- regexp:

  the statement to match

- ...:

  arguments passed to
  [`testthat::expect_error()`](https://testthat.r-lib.org/reference/expect_error.html)

## Details

Sometimes all you need to check is if a specific SQL statement has been
sent and you don't care about retrieving the results.

This works by raising an error that contains the statement that is sent
to the database as well as the location of the result. Currently,
`expect_sql()` only works with
[`DBI::dbSendQuery()`](https://dbi.r-dbi.org/reference/dbSendQuery.html)
(and most implementations of
[`DBI::dbGetQuery()`](https://dbi.r-dbi.org/reference/dbGetQuery.html)
which call
[`DBI::dbSendQuery()`](https://dbi.r-dbi.org/reference/dbSendQuery.html)
internally).

*Note:* this function is experimental and will likely evolve over time.
Please be prepared that new releases might break backwards
compatibility.

## Examples

``` r
if (check_for_pkg("RSQLite", message)) {
  with_mock_db({
    con <- dbConnect(RSQLite::SQLite(), dbname = "not_a_db")

    expect_sql(
      dbGetQuery(con, "SELECT carrier, name FROM airlines LIMIT 3"),
      "SELECT carrier, name FROM airlines LIMIT 3"
    )
  })
}
#> <simpleError: Fixture: not_a_db/SELECT-4d11cc.R
#> SELECT carrier, name FROM airlines LIMIT 3>
```
