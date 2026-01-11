# Run DBI queries against a mocked database

Wrap a chunk of code in `with_mock_db()` to use mocked databases that
will use fixtures instead of connecting to a real database.
Alternatively, you can start and stop using a mocked database with
`start_mock_db()` and `stop_mock_db()` respectively.to execute the whole
thing without needing to remember to stop the mocking. When testing with
`dittodb`, it will look for fixtures in all entries of
[`db_mock_paths`](https://dittodb.jonkeane.com/reference/mockPaths.md).

## Usage

``` r
with_mock_db(expr)

start_mock_db()

stop_mock_db()
```

## Arguments

- expr:

  the expression to execute

## Value

nothing

## Details

You only need to use one approach: either use `start_mock_db()` to start
using mocks and then `stop_mock_db()` to stop or use `with_mock_db()`
wrapped around the code you want to execute against the mocked database.
You don't need to (and should not) use both at the same time. Generally
`with_mock_db()` is preferred because it is slightly safer and you don't
have to remember to `stop_mock_db()` when you're done. However, it is
easier to step through tests interactively using
`start_mock_db()`/`stop_mock_db()`.

Connections should be made after `start_mock_db()` if you're using that
function or they should be made inside of `with_mock_db()` if you're
using that function because `dittodb` uses the database name (given in
`dbname` or `Database` argument of
[`DBI::dbConnect`](https://dbi.r-dbi.org/reference/dbConnect.html)
depending on the driver) to separate different fixtures. For ODBC
connections with only a dsn provided, the dsn is used for this
directory.

## Examples

``` r
# Add the mocks included with dittodb to the db_mock_paths to use them below
db_mock_paths(system.file("nycflight_mocks", package = "dittodb"), last = TRUE)

if (check_for_pkg("RSQLite", message) & check_for_pkg("testthat", message)) {
  # using  `with_mock_db()`
  with_mock_db({
    con <- dbConnect(
      RSQLite::SQLite(),
      dbname = "nycflights"
    )

    testthat::test_that("We get one airline", {
      one_airline <- dbGetQuery(
        con,
        "SELECT carrier, name FROM airlines LIMIT 1"
      )
      testthat::expect_s3_class(one_airline, "data.frame")
      testthat::expect_equal(nrow(one_airline), 1)
      testthat::expect_equal(one_airline$carrier, "9E")
      testthat::expect_equal(one_airline$name, "Endeavor Air Inc.")
    })

    dbDisconnect(con)
  })

  # using `start_mock_db()` and `stop_mock_db()`
  start_mock_db()
  con <- dbConnect(
    RSQLite::SQLite(),
    dbname = "nycflights"
  )

  testthat::test_that("We get one airline", {
    one_airline <- dbGetQuery(
      con,
      "SELECT carrier, name FROM airlines LIMIT 1"
    )
    testthat::expect_s3_class(one_airline, "data.frame")
    testthat::expect_equal(nrow(one_airline), 1)
    testthat::expect_equal(one_airline$carrier, "9E")
    testthat::expect_equal(one_airline$name, "Endeavor Air Inc.")
  })

  dbDisconnect(con)
  stop_mock_db()
}
#> Test passed with 4 successes 😀.
#> Test passed with 4 successes 😸.
```
