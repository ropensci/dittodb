# dbtest
<!-- badges: start -->
[![R build status](https://github.com/jonkeane/dbtest/workflows/R-CMD-check/badge.svg)](https://github.com/jonkeane/dbtest/actions?workflow=R-CMD-check)
[![Travis build status](https://travis-ci.org/jonkeane/dbtest.svg?branch=master)](https://travis-ci.org/jonkeane/dbtest)
[![Codecov test coverage](https://codecov.io/gh/jonkeane/dbtest/branch/master/graph/badge.svg)](https://codecov.io/gh/jonkeane/dbtest?branch=master)
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->


dbtest is a package that makes testing against databases easy. When writing code that relies on interactions with databases, testing has been difficult without recreating test databases in your CI environment, or resorting to using SQLite databases instead of the database engines you have in production. Both have their downsides: recreating database infrastructure is slow, error prone, and hard to iterate with. Using SQLite works well, right up until you use a feature (like [a full outer join](https://www.sqlite.org/omitted.html)) or has [quirks](https://www.sqlite.org/quirks.html) that might differ from your production database. dbtest solves this by recording database interactions, saving them as mocks, and then replaying them seamlessly during testing. This means that if you can get a query from your database, you can record the response and reliably reproduce that response in tests.

dbtest is heavily inspired by [httptest](https://CRAN.R-project.org/package=httptest), if you've used httptest before, you'll find many of the interactions similar.

## A quick example
Say we have a Postgres database with some [`nycflights`](https://CRAN.R-project.org/package=nycflights13) data in it and we are writing functions that query this data that we want to test.

For example, we have the simple function that retrieves one airline:

```r
get_an_airline <- function(con) {
  return(dbGetQuery(con, "SELECT carrier, name FROM airlines LIMIT 1"))
}

```

But we want to make sure that this function returns what we expect. To do this, we first record the response we get from the production database:

```r
start_capturing()

con <- DBI::dbConnect(
  RPostgres::Postgres(),
  dbname = "nycflights",
  host = "127.0.0.1",
  user = "travis",
  password = ""
)

get_an_airline(con)
DBI::dbDisconnect(con)

stop_capturing()
```

This will run the query from `get_an_airline()`, and save the response in a mock directory and file. Then, when we are testing, we can use the following:

```r
# With RPostgres package
with_mock_db({
  con <- DBI::dbConnect(
    RPostgres::Postgres(),
    dbname = "nycflights",
    host = "127.0.0.1",
    user = "travis",
    password = ""
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

All without having to ever set a database up on Travis 🎉


Alternatively, any other driver could be used:
```r
start_capturing()

con <- DBI::dbConnect(
  drv = DBI::dbDriver("PostgreSQL"),
  dbname = "nycflights",
  host = "127.0.0.1",
  user = "travis",
  password = ""
)

get_an_airline(con)
DBI::dbDisconnect(con)

stop_capturing()
```

and then

```r
with_mock_db({
  con <- RPostgreSQL::dbConnect(
    drv = DBI::dbDriver("PostgreSQL"),
    dbname = "nycflights",
    host = "127.0.0.1",
    user = "travis",
    password = ""
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

## Installation
Currently, dbtest is not on CRAN. You can install from source, or use `devtools`:

```r
devtools::install_github("jonkeane/dbtest")
```

---

Please note that the 'dbtest' project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project, you agree to abide by its terms.

