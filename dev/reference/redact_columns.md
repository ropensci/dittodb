# Redact columns from a dataframe with the default redactors

This function redacts the columns specified in `columns` in the data
given in `data` using `dittodb`'s standard redactors.

## Usage

``` r
redact_columns(data, columns, ignore.case = TRUE, ...)
```

## Arguments

- data:

  a dataframe to redact

- columns:

  character, the columns to redact

- ignore.case:

  should case be ignored? (default: `TRUE`)

- ...:

  additional options to pass on to
  [`grep()`](https://rdrr.io/r/base/grep.html) when matching the column
  names

## Value

data, with the columns specified in `columns` duly redacted

## Details

The column names given in the `columns` argument are treated as regular
expressions, however they always have `^` and `$` added to the beginning
and end of the strings. So if you would like to match any column that
starts with the string `sensitive` (e.g. `sensitive_name`,
`sensitive_date`) you could use `"sensitive.*` and this would catch all
of those columns (though it would not catch a column called
`most_sensitive_name`).

The standard redactors replace all values in the column with the
following values based on the columns type:

- integer – `9L`

- numeric – `9`

- character – `"[redacted]"`

- `POSIXct` (date times) –
  `as.POSIXct("1988-10-11T17:00:00", tz = tzone)`

## Examples

``` r
if (check_for_pkg("nycflights13", message)) {
  small_flights <- head(nycflights13::flights)

  # with no columns specified, redacting does nothing
  redact_columns(small_flights, columns = NULL)

  # integer
  redact_columns(small_flights, columns = c("arr_time"))

  # numeric
  redact_columns(small_flights, columns = c("arr_delay"))

  # characters
  redact_columns(small_flights, columns = c("origin", "dest"))

  # datetiems
  redact_columns(small_flights, columns = c("time_hour"))
}
#> # A tibble: 6 × 19
#>    year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
#>   <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
#> 1  2013     1     1      517            515         2      830            819
#> 2  2013     1     1      533            529         4      850            830
#> 3  2013     1     1      542            540         2      923            850
#> 4  2013     1     1      544            545        -1     1004           1022
#> 5  2013     1     1      554            600        -6      812            837
#> 6  2013     1     1      554            558        -4      740            728
#> # ℹ 11 more variables: arr_delay <dbl>, carrier <chr>, flight <int>,
#> #   tailnum <chr>, origin <chr>, dest <chr>, air_time <dbl>, distance <dbl>,
#> #   hour <dbl>, minute <dbl>, time_hour <dttm>
```
