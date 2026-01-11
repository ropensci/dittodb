# Methods for interacting with DB mocks instead of an actual database

Various methods (`dbSendQuery`, `dbFetchQuery`) that are mocks of the
[DBI](https://CRAN.R-project.org/package=DBI) methods of the same name.
Instead of actually interacting with a database, they read in mock
responses and the code proceeds after that. These aren't used directly,
but are part of how `dittodb` works.

## Usage

``` r
# S4 method for class 'DBIMockConnection'
dbDisconnect(conn, ...)

dbMockConnect(drv, ...)

# S4 method for class 'DBIMockConnection,character'
dbExistsTable(conn, name, ...)

# S4 method for class 'DBIMockConnection,Id'
dbExistsTable(conn, name, ...)

# S4 method for class 'DBIMockConnection'
dbListTables(conn, ...)

# S4 method for class 'DBIMockConnection,character'
dbListFields(conn, name, ...)

# S4 method for class 'DBIMockConnection,Id'
dbListFields(conn, name, ...)

# S4 method for class 'DBIMockConnection,ANY'
dbListFields(conn, name, ...)

# S4 method for class 'DBIMockConnection,character'
dbSendQuery(conn, statement, ...)

# S4 method for class 'DBIMockConnection,SQL'
dbSendQuery(conn, statement, ...)

# S4 method for class 'DBIMockConnection,character'
dbSendStatement(conn, statement, ...)

# S4 method for class 'DBIMockResult'
dbFetch(res, n = -1, ...)

# S4 method for class 'DBIMockResult,ANY'
fetch(res, n = -1, ...)

# S4 method for class 'DBIMockResult,missing'
fetch(res, n = -1, ...)

# S4 method for class 'DBIMockResult'
dbClearResult(res, n, ...)

# S4 method for class 'DBIMockResult'
dbHasCompleted(res, ...)

# S4 method for class 'DBIMockRPostgreSQLConnection,character'
dbGetQuery(conn, statement, ...)

# S4 method for class 'DBIMockResult'
dbGetRowsAffected(res, ...)

# S4 method for class 'DBIMockConnection'
dbGetInfo(dbObj, ...)

# S4 method for class 'DBIMockConnection,character,data.frame'
dbWriteTable(conn, name, value, ...)

# S4 method for class 'DBIMockConnection,character'
dbRemoveTable(conn, name, ...)

# S4 method for class 'DBIMockResult'
dbColumnInfo(res, ...)

# S4 method for class 'DBIMockResult'
dbGetInfo(dbObj, ...)

# S4 method for class 'DBIMockRPostgresConnection,character'
dbQuoteIdentifier(conn, x, ...)

# S4 method for class 'DBIMockRPostgresConnection,SQL'
dbQuoteIdentifier(conn, x, ...)

# S4 method for class 'DBIMockRPostgresConnection,character'
dbQuoteString(conn, x, ...)

# S4 method for class 'DBIMockRPostgresConnection,SQL'
dbQuoteString(conn, x, ...)

# S4 method for class 'DBIMockMariaDBConnection,character'
dbQuoteString(conn, x, ...)

# S4 method for class 'DBIMockMariaDBConnection,SQL'
dbQuoteString(conn, x, ...)

# S4 method for class 'DBIMockConnection'
dbBegin(conn, ..., name = NULL)

# S4 method for class 'DBIMockConnection'
dbCommit(conn, ..., name = NULL)

# S4 method for class 'DBIMockConnection'
dbRollback(conn, ..., name = NULL)
```

## Arguments

- conn:

  a database connection (for dispatch with these methods, it should be
  of class `DBIMockConnection`)

- ...:

  arguments passed on inside of the methods

- drv:

  a DB driver for use in
  [`DBI::dbConnect`](https://dbi.r-dbi.org/reference/dbConnect.html)

- name:

  name of the table (for
  [`DBI::dbListFields`](https://dbi.r-dbi.org/reference/dbListFields.html),
  [`DBI::dbWriteTable`](https://dbi.r-dbi.org/reference/dbWriteTable.html),
  [`DBI::dbRemoveTable`](https://dbi.r-dbi.org/reference/dbRemoveTable.html))

- statement:

  an SQL statement to execute

- res:

  a result object (for dispatch with these methods, it should be of
  class `DBIMockResult`)

- n:

  number of results to fetch (ignored)

- dbObj:

  a database object (a connection, result, etc.) for use in
  [`DBI::dbGetInfo`](https://dbi.r-dbi.org/reference/dbGetInfo.html)

- value:

  a value (generally a `data.frame`) for use in
  [`DBI::dbWriteTable`](https://dbi.r-dbi.org/reference/dbWriteTable.html)

- x:

  a name to quote (for
  [`DBI::dbQuoteIdentifier`](https://dbi.r-dbi.org/reference/dbQuoteIdentifier.html))
