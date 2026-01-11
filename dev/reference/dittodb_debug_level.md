# Get the dittodb debug level and evaluate if it is above a level

Get the dittodb debug level and evaluate if it is above a level

## Usage

``` r
dittodb_debug_level(level)
```

## Arguments

- level:

  the level to test against (greater than or equal to)

## Value

logical

## Examples

``` r
dittodb_debug_level(0)
#> [1] TRUE
dittodb_debug_level(2)
#> [1] FALSE
```
