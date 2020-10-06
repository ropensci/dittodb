# dittodb 0.1.2
## New features
* Experimental support for [`expect_sql()`] to check if a specific SQL statement is sent in tests without needing a fixture. Useful for when you only want or need to check that a specific query was sent and you don't need to check any code after that. This feature is experimental, so might change in a subsequent release. 

## Bug fixes and test improvements 
* ODBC connections that only specify a dsn now use the dsn as the path (@klmr, #132). 
* Compatibility for the forthcoming {testthat} 3e.
* Test changes for {dbplyr} (@hadley, #134).

# dittodb 0.1.1
* Minor CRAN update that makes tests and examples conditional when `Suggests` packages are not available.

# dittodb 0.1.0 
* Initial release with functionality for recording and playing back database fixtures from a number of DBI-based drivers ({RSQLite}, {RPostgres}, {RMariaDB}, {RPostgreSQL})
* Thanks to @maelle for PR#12
* `nycflights13_create_sql()` now always uses {DBI}
* bug fixes to cope with {dbplyr}'s unique table name functions and quoting
