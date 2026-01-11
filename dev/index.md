# dittodb

`dittodb` is a package that makes testing against databases easy. When
writing code that relies on interactions with databases, testing has
been difficult without recreating test databases in your continuous
integration (aka CI) environment, or resorting to using SQLite databases
instead of the database engines you have in production. Both have their
downsides: recreating database infrastructure is slow, error prone, and
hard to iterate with. Using SQLite works well, right up until you use a
feature (like [a full outer join](https://www.sqlite.org/omitted.html))
or has [quirks](https://www.sqlite.org/quirks.html) that might differ
from your production database. `dittodb` solves this by recording
database interactions, saving them as mocks, and then replaying them
seamlessly during testing. This means that if you can get a query from
your database, you can record the response and reliably reproduce that
response in tests.

`dittodb` is heavily inspired by
[{httptest}](https://CRAN.R-project.org/package=httptest), if you’ve
used {httptest} before, you’ll find many of the interactions similar.

## A quick example

Say we have a database with some
[{nycflights}](https://CRAN.R-project.org/package=nycflights13) data in
it and we are writing functions that query this data that we want to
test.

For example, we have the simple function that retrieves one airline:

``` r
get_an_airline <- function(con) {
  return(dbGetQuery(con, "SELECT carrier, name FROM airlines LIMIT 1"))
}
```

But we want to make sure that this function returns what we expect. To
do this, we first record the response we get from the production
database:

## 

- RMariaDB
- RPostgres
- RSQLite

``` r
start_db_capturing()

con <- DBI::dbConnect(
  RMariaDB::MariaDB(),
  dbname = "nycflights"
)

get_an_airline(con)
DBI::dbDisconnect(con)

stop_db_capturing()
```

``` r
start_db_capturing()

con <- DBI::dbConnect(
  RPostgres::Postgres(),
  dbname = "nycflights"
)

get_an_airline(con)
DBI::dbDisconnect(con)

stop_db_capturing()
```

``` r
start_db_capturing()

con <- DBI::dbConnect(RSQLite::SQLite(), "nycflights")

get_an_airline(con)
DBI::dbDisconnect(con)

stop_db_capturing()
```

## 

This will run the query from `get_an_airline()`, and save the response
in a mock directory and file. Then, when we are testing, we can use the
following:

- RMariaDB
- RPostgres
- RSQLite

``` r
with_mock_db({
  con <- DBI::dbConnect(
    RMariaDB::MariaDB(),
    dbname = "nycflights"
  )
  
  test_that("We get one airline", {
    one_airline <- get_an_airline(con)
    expect_s3_class(one_airline, "data.frame")
    expect_equal(nrow(one_airline), 1)
    expect_equal(one_airline$carrier, "9E")
    expect_equal(one_airline$name, "Endeavor Air Inc.")
  })
})
```

``` r
with_mock_db({
  con <- DBI::dbConnect(
    RPostgres::Postgres(),
    dbname = "nycflights"
  )
  
  test_that("We get one airline", {
    one_airline <- get_an_airline(con)
    expect_s3_class(one_airline, "data.frame")
    expect_equal(nrow(one_airline), 1)
    expect_equal(one_airline$carrier, "9E")
    expect_equal(one_airline$name, "Endeavor Air Inc.")
  })
})
```

``` r
with_mock_db({
  con <- DBI::dbConnect(RSQLite::SQLite(), "nycflights")
  
  test_that("We get one airline", {
    one_airline <- get_an_airline(con)
    expect_s3_class(one_airline, "data.frame")
    expect_equal(nrow(one_airline), 1)
    expect_equal(one_airline$carrier, "9E")
    expect_equal(one_airline$name, "Endeavor Air Inc.")
  })
})
```

## 

All without having to ever set a database up on Travis or GitHub Actions
🎉

## Installation

Currently, `dittodb` is on CRAN (The Comprehensive R Archive Network),
so you can install it with `install.packages("dittodb")`.

### Installing a development version

If you would like to use the development version, you can install from
GitHub with: `remotes::install_github("ropensci/dittodb")`

*Note* You may need to add `@main` at the end if you are using a version
of {remotes} prior to 2.2.0. Alternatively, you can use
[`remotes::install_git()`](https://remotes.r-lib.org/reference/install_git.html)
directly:
`remotes::install_git("https://github.com/ropensci/dittodb.git")`

## Setup a package to use `dittodb`

Use the function
[`dittodb::use_dittodb()`](https://dittodb.jonkeane.com/dev/reference/use_dittodb.md)
to easily get started using `dittodb`. It will add `dittodb` to
`Suggests` in the `DESCRIPTION` file and add
[`library(dittodb)`](https://dittodb.jonkeane.com/) to
`tests/testthat/helper.R`.

## Development

There is extensive information about developing `dittodb` in the
vignette [Developing
`dittodb`](https://dittodb.jonkeane.com/articles/developing-dittodb.html),
please read that before trying to make changes to `dittodb` or running
any of the scripts provided in the `db-setup` directory.

In order to test `dittodb` recording functionality locally or on
continuous integration, it is helpful to have databases with test data
available. This can be accomplished using the scripts in the `db-setup`
directory. By default, `dittodb` does not run any tests that require
database infrastructure locally.

To get local databases, the easiest way is to use docker and run either
the `db-setup/local-mariadb-docker-setup.sh` or
`db-setup/local-postgres-docker-setup.sh` which will pull a docker image
and set up a test database with the user and passwords that the
`dittodb` tests are expecting (and will stop and remove the docker
images if they are present).

On continuous integration, (using GitHub Actions) these scripts in the
`db-setup` directory are used to set up these test databases so we can
run integration tests (predominantly in the file
`tests/testthat/test-dbi-generic-integration.R`).

## Code of Conduct

Please note that the `dittodb` project is released with a [Contributor
Code of Conduct](https://dittodb.jonkeane.com/CODE_OF_CONDUCT). By
contributing to this project, you agree to abide by its terms.
