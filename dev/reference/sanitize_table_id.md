# Sanitize Table id

Tables are identified and specified with a large number of ways across
drivers. For the purposes of `dittodb`, the details are less important
since we almost always just want a flat representation (*ie* for
filenames). This takes the various formats and returns a string with
various elements separated by dots.

## Usage

``` r
sanitize_table_id(id, ...)
```

## Arguments

- id:

  the table identifier (an `Id`, a vector of strings, or a string)

- ...:

  additional arguments (to allow for things like `schema_name` that
  `odbc` uses.)

## Value

the first word in the statement
