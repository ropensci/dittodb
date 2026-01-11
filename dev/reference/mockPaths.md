# Set an alternate directory for mock API fixtures

By default, `with_mock_api` will look for mocks relative to the current
working directory (or the test directory). If you want to look in other
places, you can call `db_mock_paths` to add directories to the search
path.

## Usage

``` r
db_mock_paths(new, last = FALSE, replace = FALSE)

.db_mock_paths(new)
```

## Arguments

- new:

  either a character vector of path(s) to add, or `NULL` to reset to the
  default.

- last:

  a logical, should the new path given be added to the end of the list
  of paths? (default: `FALSE`)

- replace:

  logical, should the path replace the current mock paths (`TRUE`) or
  should they be appended (to the beginning) of the current mock paths
  (default, `FALSE`)

## Value

If `new` is omitted, the function returns the current search paths, a
character vector. If `new` is provided, the updated value will be
returned invisibly.

## Details

It works like
[`base::.libPaths()`](https://rdrr.io/r/base/libPaths.html): any
directories you specify will be added to the list and searched first.
The default directory will be searched last. Only unique values are
kept: if you provide a path that is already found in `db_mock_paths`,
the result effectively moves that path to the first position.

When you are capturing fixtures (e.g. with
[`start_db_capturing`](https://dittodb.jonkeane.com/dev/reference/capture_requests.md)),
the first path is used as the path to save the fixtures in. For this
reason, you may want to set the `last` argument to `TRUE` if you want to
read from a directory but don't want to write to it.

For finer-grained control, or to completely override the defaults or any
additions made by calls to `db_mock_paths(...)`, you can set the option
"dittodb.mock.paths". If the option "dittodb.mock.paths" is set it will
be used instead of any paths set with `db_mock_paths(...)` or even
inside of
[`with_mock_path()`](https://dittodb.jonkeane.com/dev/reference/with_mock_path.md)

This function is similar to `.mockPaths()` from
[httptest](https://CRAN.R-project.org/package=httptest)

The function `.db_mock_paths` is the same as `db_mock_paths` although it
is deprecated and should not be used.

## Examples

``` r
# reset mock paths to default
db_mock_paths(NULL)

identical(db_mock_paths(), c("tests/testthat/", "."))
#> [1] TRUE
db_mock_paths("/var/somewhere/else")
identical(db_mock_paths(), c("/var/somewhere/else", "tests/testthat/", "."))
#> [1] TRUE
db_mock_paths(NULL)
identical(db_mock_paths(), c("tests/testthat/", "."))
#> [1] TRUE
db_mock_paths("/var/somewhere/else", last = TRUE)
identical(db_mock_paths(), c("tests/testthat/", ".", "/var/somewhere/else"))
#> [1] TRUE
```
