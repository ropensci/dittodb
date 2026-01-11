# Make a data.frame with pre-serialized integer64 columns

`integer64` types do not `dput` wells with `hexNumeric`. Instead, we
serialize and then unserialize them cf truecluster/bit64#27 and store
that as one expression per column This makes the resulting data.frame
awkward, but it will be recorded by `dput` in a way that does get read
back in faithfully (so long as the expression isn't quoted).

## Usage

``` r
serialize_bit64(df_in)
```

## Arguments

- df_in:

  the data.frame to pre-serialize `integer64` columns from

## Value

data.frame where each `integer64` column is a serialized expression of
itself
