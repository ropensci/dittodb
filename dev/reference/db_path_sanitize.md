# Switch illegal characters for legal ones

Inspired by the [fs](https://CRAN.R-project.org/package=fs) package's
`path_sanitize` function

## Usage

``` r
db_path_sanitize(filename, replacement = "_")
```

## Arguments

- filename:

  the file or folder to sanitize

- replacement:

  what should the illegal character(s) be replaced with? (default: "\_")

## Value

the sanitized string

## Examples

``` r
db_path_sanitize('this:string"has?issues')
#> [1] "this_string_has_issues"
```
