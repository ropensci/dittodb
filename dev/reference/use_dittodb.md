# Use `dittodb` in your tests

If you would like to use `dittodb` in your package, and you are already
using [testthat](https://CRAN.R-project.org/package=testthat), use this
function to add `dittodb` to Suggests in the package DESCRIPTION and
loads it in `tests/testthat/helper.R`. Call it once when you're setting
up a new package test suite.

## Usage

``` r
use_dittodb(path = ".")
```

## Arguments

- path:

  character path to the package

## Value

Nothing: called for file system side effects.

## Details

This function should be called with the path to your package source as
the `path` argument. The function is idempotent: if `dittodb` is already
added to these files, no additional changes will be made.

It will:

- add `dittodb` to the `Suggests` field of the DESCRIPTION file in the
  current working directory

- add [`library(dittodb)`](https://dittodb.jonkeane.com/) to the file
  `tests/testthat/helper.R` (creating it if it doesn't already exist)

## Examples

``` r
if (FALSE) { # \dontrun{
use_dittodb()
use_dittodb("/path/to/package")
} # }
```
