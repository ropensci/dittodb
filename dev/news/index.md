# Changelog

## dittodb (development version)

- Updated links to match CRAN checks
  ([\#195](https://github.com/ropensci/dittodb/issues/195))

## dittodb 0.1.9

CRAN release: 2025-08-18

- Updated links in docs for new CRAN checks
  ([\#193](https://github.com/ropensci/dittodb/issues/193))

## dittodb 0.1.8

CRAN release: 2024-04-09

- Improved error messages for connections made before running
  `start_db_capture()`. ([@KoderKow](https://github.com/KoderKow),
  [\#183](https://github.com/ropensci/dittodb/issues/183))
- Added to the `dbplyr` unique table names that are ignored to work with
  the newest `dbplyr` table names.
  ([\#188](https://github.com/ropensci/dittodb/issues/188))

## dittodb 0.1.7

CRAN release: 2023-08-13

- Added better capture support for unknown databases including better
  capture support for Teradata databases.
  ([\#176](https://github.com/ropensci/dittodb/issues/176),
  [@sandstumpen](https://github.com/sandstumpen))

## dittodb 0.1.6

CRAN release: 2023-04-17

- Bugfix for `integer64` roundtrips. Instead of falling back to
  non-hexNumeric output, we serialize first and maintain hexNumeric
  output.

## dittodb 0.1.5

CRAN release: 2023-04-13

- There is now better support for {dbplyr} editions: mocks should
  transparently use whatever the backend supports now
  ([\#169](https://github.com/ropensci/dittodb/issues/169))
- Improved `bigint` support (thanks to
  [@majazaloznik](https://github.com/majazaloznik) for reporting this
  issue, [\#168](https://github.com/ropensci/dittodb/issues/168))
- Quoting should be more reliable (e.g. quotes are doubled with
  RPostgres drivers), uncovered by a change in {dbplyr} query
  optimizations
  ([\#172](https://github.com/ropensci/dittodb/issues/172))
- SQLite databases
- Removed the “travelling” vignette since there are much better ways to
  do something like that now (e.g. {duckdb})

### Internals

- Switched from a semi-hacky C-based approach for creating mock
  connections, that now uses tracing like capturing already did
  ([\#167](https://github.com/ropensci/dittodb/issues/167))
- Various test improvements (thanks
  [@majazaloznik](https://github.com/majazaloznik))
- Removed
  [`expect_silent()`](https://testthat.r-lib.org/reference/expect_silent.html)
  in one test to satisfy an R devel bug
  ([\#172](https://github.com/ropensci/dittodb/issues/172))
- The pkgdown site should render more correctly (thanks to
  [@maelle](https://github.com/maelle),
  [\#173](https://github.com/ropensci/dittodb/issues/173))

## dittodb 0.1.4

CRAN release: 2022-06-17

- Allow support for mocking when transactions are on (full support for
  transactions with different mock directories is still planned for the
  future)
- Add support for quoting with Postgres

## dittodb 0.1.3

CRAN release: 2020-10-10

- Minor CRAN update that makes vignette execution conditional when
  `Suggests` packages are not available.

## dittodb 0.1.2

CRAN release: 2020-10-08

### New features

- Experimental support for
  \[[`expect_sql()`](https://dittodb.jonkeane.com/dev/reference/expect_sql.md)\]
  to check if a specific SQL statement is sent in a test without needing
  a fixture. Useful for when you only want or need to check that a
  specific query was sent and you don’t need to check any code after
  that. This feature is experimental, so might change in a subsequent
  release.

### Bug fixes and test improvements

- ODBC connections that only specify a dsn now use the dsn as the path
  ([@klmr](https://github.com/klmr),
  [\#132](https://github.com/ropensci/dittodb/issues/132)).
- Compatibility for the forthcoming {testthat} 3e.
- Test changes for {dbplyr} ([@hadley](https://github.com/hadley),
  [\#134](https://github.com/ropensci/dittodb/issues/134)).
- Internal updates for changes in an upcoming {dbplyr} release.

## dittodb 0.1.1

CRAN release: 2020-07-29

- Minor CRAN update that makes tests and examples conditional when
  `Suggests` packages are not available.

## dittodb 0.1.0

CRAN release: 2020-07-24

- Initial release with functionality for recording and playing back
  database fixtures from a number of DBI-based drivers ({RSQLite},
  {RPostgres}, {RMariaDB}, {RPostgreSQL})
- Thanks to [@maelle](https://github.com/maelle) for PR#12
- [`nycflights13_create_sql()`](https://dittodb.jonkeane.com/dev/reference/nycflights13_create_sql.md)
  now always uses {DBI}
- bug fixes to cope with {dbplyr}’s unique table name functions and
  quoting
