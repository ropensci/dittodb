# Run the DBI queries in an alternate mock directory

When testing with dittodb, wrap your tests in `with_mock_path({})` to
use the database fixtures located in other directories. `dittodb` will
look for fixtures in the directory specified by the user, which can be a
temporary or permanent location.

## Usage

``` r
with_mock_path(path, expr, replace = FALSE)
```

## Arguments

- path:

  the alternate directory

- expr:

  the expression to execute

- replace:

  logical, should the path replace the current mock paths (`TRUE`) or
  should they be appended (to the beginning) of the current mock paths
  (default, `FALSE`)

## Value

nothing, called to execute the expression(s) in `expr`

## Examples

``` r
# Only run if RSQLite and testthat are available
if (check_for_pkg("RSQLite", message) & check_for_pkg("testthat", message)) {
  with_mock_path(
    system.file("nycflight_mocks", package = "dittodb"),
    with_mock_db({
      con <- DBI::dbConnect(
        RSQLite::SQLite(),
        dbname = "nycflights"
      )

      one_airline <- dbGetQuery(
        con,
        "SELECT carrier, name FROM airlines LIMIT 1"
      )
      testthat::test_that("We get one airline", {
        testthat::expect_s3_class(one_airline, "data.frame")
        testthat::expect_equal(nrow(one_airline), 1)
        testthat::expect_equal(one_airline$carrier, "9E")
        testthat::expect_equal(one_airline$name, "Endeavor Air Inc.")
      })
      one_airline
    })
  )
}
#> Test passed with 4 successes 😸.
#>   carrier              name
#> 1      9E Endeavor Air Inc.
```
