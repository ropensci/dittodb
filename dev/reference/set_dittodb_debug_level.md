# Set `dittodb`'s debug level

It can be helpful to see what's going on by increasing `dittodb`'s
verbosity which will show what's going on under the hood (e.g. what
queries are being requested, from where). This sets the option
`dittodb.debug` to the value given in the `level` argument. The option
can be set directly with `options(dittodb.debug = n)` as well.

## Usage

``` r
set_dittodb_debug_level(level)
```

## Arguments

- level:

  a numeric, the level to set to (e.g. 1)

## Value

the level, invisibly

## Details

The `level` argument is a numeric, where 0 is the default and
(relatively) silent. The higher the level, the more verbose `dittodb`
will be.

Currently, `dittodb` only has one level of debugging (any value 1 or
greater), but more might be used in the future.

## Examples

``` r
set_dittodb_debug_level(1)
set_dittodb_debug_level(0)
```
