# Getting Started with \`dittodb\`

`dittodb` is designed to make it easy and fun to test functions that
interact with a database. It works by looking for mock responses for
each query you send while you run your tests and will seamlessly pretend
that those mocks were provided by the database connection without
needing a connection at all.

## Our function `mean_delays()`

To get started, imagine that we are working on a package that queries a
database that consists of the [nycflights13
data](https://dittodb.jonkeane.com/articles/nycflights.md)[¹](#fn1). We
have the following function which takes a column to aggregate by and
returns a dataframe with that column and the mean delay for groups based
on the values in the column name given.

## 

- RMariaDB
- RPostgres
- RSQLite

``` r
library(DBI)

mean_delays <- function(group_col) {
  con <- dbConnect(
    RMariaDB::MariaDB(),
    dbname = "nycflights"
  )
  on.exit(dbDisconnect(con))

  query <- glue::glue(
    "SELECT {group_col}, AVG(arr_delay) as mean_delay from nycflights13.flights ",
    "WHERE arr_delay > 0 GROUP BY {group_col}"
  )

  return(dbGetQuery(con, query))
}
```

``` r
library(DBI)

mean_delays <- function(group_col) {
  con <- dbConnect(
    RPostgres::Postgres(),
    dbname = "nycflights"
  )
  on.exit(dbDisconnect(con))

  query <- glue::glue(
    "SELECT {group_col}, AVG(arr_delay) as mean_delay from nycflights13.flights ",
    "WHERE arr_delay > 0 GROUP BY {group_col}"
  )

  return(dbGetQuery(con, query))
}
```

``` r
library(DBI)

mean_delays <- function(group_col) {
  con <- dbConnect(
    RSQLite::SQLite(),
    dbname = "nycflights"
  )
  on.exit(dbDisconnect(con))

  query <- glue::glue(
    "SELECT {group_col}, AVG(arr_delay) as mean_delay from nycflights13.flights ",
    "WHERE arr_delay > 0 GROUP BY {group_col}"
  )

  return(dbGetQuery(con, query))
}
```

## 

If we give it the column `"month"`, we get the following dataframe:

``` r
mean_delays("month")
```

    #>    month mean_delay
    #> 1      1   34.47749
    #> 2      2   33.68921
    #> 3      3   40.57166
    #> 4      4   42.73958
    #> 5      5   41.88586
    #> 6      6   53.73827
    #> 7      7   53.95152
    #> 8      8   39.51294
    #> 9      9   38.80555
    #> 10    10   29.03665
    #> 11    11   27.48459
    #> 12    12   39.72725

Great, now that we have our function we want to test it to make sure it
is operating as expected. Normally, we could write something like:

``` r
library(testthat)

test_that("mean_delays()", {
  out <- mean_delays("month")
  expect_named(out, c("month", "mean_delay"))
  expect_equal(dim(out), c(12, 2))
})
```

And this works just fine if we only ever run your tests locally, but if
we want to [run our tests with a Continuous Integration
system](https://r-pkgs.org/software-development-practices.html#sec-sw-dev-practices-ci)
(and yes, we want to do that!), this won’t work without first setting up
our production database of flights. For our tests, we don’t actually
need to connect to the database and get new data (and, in fact, that
would make some tests fail erroneously suddenly if the underlying
changed). Instead, what we want is to take a snapshot of what happens
when running the test code, and then be able to use that snapshot when
we run tests later. These snapshots are frequently called fixtures
(though you might hear people use other names like stubs or mocks).

## Recording fixtures

We can record fixtures of the database interactions with the commands
[`start_db_capturing()`](https://dittodb.jonkeane.com/reference/capture_requests.md),
run the functions we want to record, and then stop recording with
[`stop_db_capturing()`](https://dittodb.jonkeane.com/reference/capture_requests.md).

``` r
start_db_capturing()
out <- mean_delays("month")
stop_db_capturing()
```

This will write a new folder (by default in `./tests/testthat/`) with
the name of the database (here: `nycflights`) and then write one file
with the name `SELECT-e53189.R` which is the fixture for this example.
This `SELECT-*` file contains the data that was received from the
database for use in tests.

## `with_mock_db()`

Now that we have a fixture, we can use that fixture by wrapping our call
that includes a database interaction with the function
[`with_mock_db()`](https://dittodb.jonkeane.com/reference/mockdb.md).
This will look for fixtures and use those.

``` r
with_mock_db(
  mean_delays("month")
)
#>    month mean_delay
#> 1      1   34.47749
#> 2      2   33.68921
#> 3      3   40.57166
#> 4      4   42.73958
#> 5      5   41.88586
#> 6      6   53.73827
#> 7      7   53.95152
#> 8      8   39.51294
#> 9      9   38.80555
#> 10    10   29.03665
#> 11    11   27.48459
#> 12    12   39.72725
```

So, now we can write our tests like:

``` r
library(testthat)
library(dittodb)

with_mock_db(
  test_that("mean_delays()", {
    out <- mean_delays("month")
    expect_named(out, c("month", "mean_delay"))
    expect_equal(dim(out), c(12, 2))
  })
)
#> Test passed with 2 successes 🥇.
#> [1] TRUE
```

When placed inside of `with_mock_db(...)` a call to
`mean_delays("month")` will return what we saved as our fixture *as if
it had actually connected to the database* without needing the database
to be installed, reachable, operational, or to exist at all anywhere.

If we wanted to test that a day-based aggregation works, we can!
Although we will have to make a new fixture. First we would run the
following interactively:

``` r
start_db_capturing()
out <- mean_delays("day")
stop_db_capturing()
```

This will create a new file (`SELECT-16d120.R`) which contains the
response when aggregating by day. dittodb saves each database
interaction with a hash of the query that is sent, so that a number of
different responses from a database can be saved and the correct one
will be used when called inside of `with_mock_db(...)`. So now, we could
write our new test with:

``` r
with_mock_db(
  test_that("mean_delays()", {
    out <- mean_delays("day")
    expect_named(out, c("day", "mean_delay"))
    expect_equal(dim(out), c(31, 2))
  })
)
#> Test passed with 2 successes 🎊.
#> [1] TRUE
```

## Getting setup to use `dittodb`

Use the function
[`dittodb::use_dittodb()`](https://dittodb.jonkeane.com/reference/use_dittodb.md)
to easily get started using `dittodb`. It will add `dittodb` to
`Suggests` in the `DESCRIPTION` file and add
[`library(dittodb)`](https://dittodb.jonkeane.com/) to
`tests/testthat/helper.R`.

## Things to be careful about

There are a few things to be careful about when using dittodb.

### When to call `dbConnect()`

Always call
[`dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html) inside
of `with_mock_db(...)`. You can make as many calls as you want to the
mock database inside of a `with_mock_db(...)`, but you should always
make sure that you connect to the database inside of and not outside of
`with_mock_db(...)`. This is because when you “connect” to the mock
database, a few variables are set that tell dittodb where to look for
mocks. It’s less important (though still a good idea) to call
[`dbDisconnect()`](https://dbi.r-dbi.org/reference/dbDisconnect.html)
inside of
[`with_mock_db()`](https://dittodb.jonkeane.com/reference/mockdb.md).
This is also true when recording fixtures with `start_db_recording()`,
you should start the recording and then call
[`dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html).

### Query size

Recording fixtures saves the whole query to disk in a relatively
inefficient way (from a data storage perspective), so be careful with
what you save. And you’ll want to not save extremely large results if at
all possible. This is also a best-practice for writing tests anyway: you
should have mocks that are as minimal as possible to test the
functionality you need to. Minimal mocks make it easier to change things
that aren’t relevant to the test (you don’t have to change the way data
is represented if it’s not important to what you’re testing) and it
makes your tests run faster.

## Advanced uses

There are a number of advanced features that might be useful. However
they take a bit of configuration to use.

### Specify a new path

You can control where mocks are read from (when you’re using
`with_mock_db(...)`) as well as where they are written to (when using
[`start_db_capturing()`](https://dittodb.jonkeane.com/reference/capture_requests.md)).
To do this, use the function
[`db_mock_paths()`](https://dittodb.jonkeane.com/reference/mockPaths.md).

You can see what paths are being used by calling
[`db_mock_paths()`](https://dittodb.jonkeane.com/reference/mockPaths.md)
with no arguments. dittodb will look for mocks in each path starting
with the first one. When recording mocks, dittodb always uses the first
path that is returned by
[`db_mock_paths()`](https://dittodb.jonkeane.com/reference/mockPaths.md).

You can add a new path by calling `db_mock_paths("new/path/here")` which
will add the path provided to the top of the list of paths to use.

### Redacting

Sometimes (much? most? of the time!) there is sensitive data in your
database that you don’t actually want to put into your test fixtures.
`dittodb` allows you to specify columns that should always be redacted
by specifying them like so:

    start_db_capturing(redact_columns = c("sensitive_column", "other_sensitive_column"))

This will always redact the columns “sensitive_column” and
“other_sensitive_column” every time a query is recorded that includes
either. The redactor replaces every value in the column with a standard
value (for example “\[redacted\]” for characters, `9` for numerics,
`1988-10-11T17:00:00` for date times) see
[`redact_columns()`](https://dittodb.jonkeane.com/reference/redact_columns.md)
for more information.

### You, too, can write a fixture!

When we use `start_db_recording()` to record fixtures, we are creating
what some people call fixtures (though other terms for these abound).
These are files that are used during testing to represent and provide
some data or state necessary to execute the test. In the case of
dittodb, these files contain the data that dittodb uses when it pretends
to be a live database. During recording, each query that is sent to the
database gets a unique identifier (the first 6 digits of the hash of the
query) and when the response is received, that response is saved to a
file with the first SQL (Structured Query Language) verb
(e.g. `SELECT`), a dash, and the hash using the
[`dput()`](https://rdrr.io/r/base/dput.html) function. This lets you
craft a fixture that tests exactly what you need to without having
extraneous rows or columns that might not be relevant.

You can save our own responses for queries by getting figuring out the
hash (the easiest way to do this now is to write the test that you want
to create a fixture for, run it and see the error message that looks
something like “Couldn’t find the file nycflights/SELECT-16d120.R in any
of the mock directories.” and use the filename from there.) and then
saving the dataframe that you want the test to use with the command
`dput(df, file = "nycflights/SELECT-16d120.R", control = c("all", "hexNumeric"))`
(if the dataframe you want to save is `df` and we are using the path we
saw in the example error message). And you’ve created your own fixture!

You can also take the approach of recording fixtures and then editing
them manually to pare them down. The workflow for that would be
something like:

``` r
# read in the recorded fixture
df_fixt <- source("nycflights/SELECT-16d120.R", keep.source = FALSE)$value

# filter out anything after february and all days after the 9th of the month
df_fixt <- dplyr::filter(df_fixt, month <= 2 & day < 10)

# save the fixture for use in tests
dput(df_fixt, file = "nycflights/SELECT-16d120.R", control = c("all", "hexNumeric"))
```

------------------------------------------------------------------------

1.  These code snippets won’t work right out of the box — you will need
    to make sure the database you’re connecting to has the [nycflights13
    data](https://dittodb.jonkeane.com/articles/nycflights.md) data in
    it. You could do this with SQLite by running
    `nycflights13_create_sqlite(location = "nycflights")` before the
    rest of the commands here.
