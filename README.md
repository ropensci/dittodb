# dittodb
<!-- badges: start -->
[![Windows](https://github.com/jonkeane/dittodb/workflows/check-windows/badge.svg)](https://github.com/jonkeane/dittodb/actions?workflow=check-windows)
[![Mac](https://github.com/jonkeane/dittodb/workflows/check-mac/badge.svg)](https://github.com/jonkeane/dittodb/actions?workflow=check-mac)
[![Linux](https://github.com/jonkeane/dittodb/workflows/check-linux-ubuntu/badge.svg)](https://github.com/jonkeane/dittodb/actions?workflow=check-linux-ubuntu)
[![Codecov test coverage](https://codecov.io/gh/jonkeane/dittodb/branch/main/graph/badge.svg)](https://codecov.io/gh/jonkeane/dittodb?branch=main)
[![Lifecycle: maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![CRAN status](https://www.r-pkg.org/badges/version/dittodb)](https://CRAN.R-project.org/package=dittodb)
<!-- badges: end -->


dittodb (formerly dbtest) is a package that makes testing against databases easy. When writing code that relies on interactions with databases, testing has been difficult without recreating test databases in your CI environment, or resorting to using SQLite databases instead of the database engines you have in production. Both have their downsides: recreating database infrastructure is slow, error prone, and hard to iterate with. Using SQLite works well, right up until you use a feature (like [a full outer join](https://www.sqlite.org/omitted.html)) or has [quirks](https://www.sqlite.org/quirks.html) that might differ from your production database. dittodb solves this by recording database interactions, saving them as mocks, and then replaying them seamlessly during testing. This means that if you can get a query from your database, you can record the response and reliably reproduce that response in tests.

dittodb is heavily inspired by [httptest](https://CRAN.R-project.org/package=httptest), if you've used httptest before, you'll find many of the interactions similar.

## A quick example {.tabset}
Say we have a database with some [`nycflights`](https://CRAN.R-project.org/package=nycflights13) data in it and we are writing functions that query this data that we want to test. 

For example, we have the simple function that retrieves one airline:

```r
get_an_airline <- function(con) {
  return(dbGetQuery(con, "SELECT carrier, name FROM airlines LIMIT 1"))
}

```

But we want to make sure that this function returns what we expect. To do this, we first record the response we get from the production database:

### RMariaDB
```r
start_db_capturing()

con <- DBI::dbConnect(
  RMariaDB::MariaDB(),
  dbname = "nycflights"
)

get_an_airline(con)
DBI::dbDisconnect(con)

stop_db_capturing()
```

### RPostgres
```r
start_db_capturing()

con <- DBI::dbConnect(
  RPostgres::Postgres(),
  dbname = "nycflights"
)

get_an_airline(con)
DBI::dbDisconnect(con)

stop_db_capturing()
```

### RSQLite
```r
start_db_capturing()

con <- DBI::dbConnect(RSQLite::SQLite())

get_an_airline(con)
DBI::dbDisconnect(con)

stop_db_capturing()
```

## {.tabset}

This will run the query from `get_an_airline()`, and save the response in a mock directory and file. Then, when we are testing, we can use the following:


### RMariaDB
```r
with_mock_db({
  con <- DBI::dbConnect(
    RMariaDB::MariaDB(),
    dbname = "nycflights"
  )
  
  test_that("We get one airline", {
    one_airline <- get_an_airline()
    expect_is(one_airline, "data.frame")
    expect_equal(nrow(one_airline), 1)
    expect_equal(one_airline$carrier, "9E")
    expect_equal(one_airline$name, "Endeavor Air Inc.")
  })
})
```

### RPostgres
```r
with_mock_db({
  con <- DBI::dbConnect(
    RPostgres::Postgres(),
    dbname = "nycflights"
  )
  
  test_that("We get one airline", {
    one_airline <- get_an_airline()
    expect_is(one_airline, "data.frame")
    expect_equal(nrow(one_airline), 1)
    expect_equal(one_airline$carrier, "9E")
    expect_equal(one_airline$name, "Endeavor Air Inc.")
  })
})
```

### RSQLite
```r
with_mock_db({
  con <- DBI::dbConnect(RSQLite::SQLite())
  
  test_that("We get one airline", {
    one_airline <- get_an_airline()
    expect_is(one_airline, "data.frame")
    expect_equal(nrow(one_airline), 1)
    expect_equal(one_airline$carrier, "9E")
    expect_equal(one_airline$name, "Endeavor Air Inc.")
  })
})
```

##

All without having to ever set a database up on Travis 🎉

## Installation
Currently, dittodb is not on CRAN. You can install from source, or use `devtools`:

```r
devtools::install_github("jonkeane/dittodb")
```

## Setup a package to use `dittodb`
Use the function `dittodb::use_dittodb()` to easily get started using `dittodb`. 
It will add `dittodb` to `Suggests` in the `DESCRIPTION` file and add `library(dittodb)`
to `tests/testthat/helper.R`.

## Development

There is extensive information about developing `dittodb` in the vignette [Developing `dittodb`](https://dittodb.jonkeane.com/articles/developing-dittodb.html, please read that before trying to make changes to `dittodb` or running any of the scripts provided in the `db-setup` directory.

In order to test `dittodb` recording functionality locally or on CI, it is helpful to have databases with test data available. This can be accomplished using the scripts in the `db-setup` directory. By default, `dittodb` does not run any tests that require database infrastructure locally.

To get local databases, the easiest way is to use docker and run either the `db-setup/local-mariadb-docker-setup.sh` or `db-setup/local-postgres-docker-setup.sh` which will pull a docker image and set up a test database with the user and passwords that the `dittodb` tests are expecting (and will stop and remove the docker images if they are present). 

On continuous integration, (using GitHub Actions) these scripts in the `db-setup` directory are used to set up these test databases so we can run integration tests (predominantly in the file `tests/testthat/test-dbi-generic-integration.R`).

## Code of Conduct

Please note that the `dittodb` project is released with a  [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project, you agree to abide by its terms.
