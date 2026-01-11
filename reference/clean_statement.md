# Clean a statement string

SQL statement strings sometimes have characters and specifications that
don't change the meaning or are determined at query time. To avoid this,
before hashing a statement we clean/strip these from the statement

## Usage

``` r
clean_statement(string)
```

## Arguments

- string:

  an SQL statement to clean

## Value

the SQL statement stripped of extraneous bits
