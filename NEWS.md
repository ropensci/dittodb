# dittodb 0.1.1
* Minor CRAN update that makes tests and examples conditional when `Suggests` packages are not available.

# dittodb 0.1.0 
* Initial release with functionality for recording and playing back database fixtures from a number of DBI-based drivers (RSQLite, RPostgres, RMariaDB, RPostgreSQL)
* Thanks to @maelle for PR#12
* `nycflights13_create_sql()` now always uses DBI
* bug fixes to cope with dbplyr's unique table name functions and quoting
