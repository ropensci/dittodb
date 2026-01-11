# Check if a package is installed

Uses [`requireNamespace()`](https://rdrr.io/r/base/ns-load.html) to
check if a package is already installed and provides options for issuing
an error, warning, etc. in case the package is not installed.

## Usage

``` r
check_for_pkg(package, func = stop)
```

## Arguments

- package:

  the name of the package to check for

- func:

  what should this check call if the package is not installed? This can
  be any function, but `stop`, `warning`, `skip`, etc. are likely
  candidates (default: `stop`)

## Value

`TRUE` if the package is installed, `FALSE` if it is not (invisibly)

## Details

It is only exported for use in examples.

## Examples

``` r
check_for_pkg("DBI")
check_for_pkg("no-such-package", func = message)
#> The package no-such-package isn't installed but is needed for this action.
#> Please install it with install.packages("no-such-package") and try again.
```
