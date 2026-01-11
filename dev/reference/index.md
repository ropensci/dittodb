# Package index

## Mock DB methods

- [`with_mock_db()`](https://dittodb.jonkeane.com/dev/reference/mockdb.md)
  [`start_mock_db()`](https://dittodb.jonkeane.com/dev/reference/mockdb.md)
  [`stop_mock_db()`](https://dittodb.jonkeane.com/dev/reference/mockdb.md)
  : Run DBI queries against a mocked database
- [`with_mock_path()`](https://dittodb.jonkeane.com/dev/reference/with_mock_path.md)
  : Run the DBI queries in an alternate mock directory

## Capturing fixtures

- [`start_db_capturing()`](https://dittodb.jonkeane.com/dev/reference/capture_requests.md)
  [`stop_db_capturing()`](https://dittodb.jonkeane.com/dev/reference/capture_requests.md)
  [`capture_db_requests()`](https://dittodb.jonkeane.com/dev/reference/capture_requests.md)
  : Capture and record database transactions and save them as mocks

## Utilities

- [`expect_sql()`](https://dittodb.jonkeane.com/dev/reference/expect_sql.md)
  **\[experimental\]** : Detect if a specific SQL statement is sent

- [`db_mock_paths()`](https://dittodb.jonkeane.com/dev/reference/mockPaths.md)
  [`.db_mock_paths()`](https://dittodb.jonkeane.com/dev/reference/mockPaths.md)
  : Set an alternate directory for mock API fixtures

- [`redact_columns()`](https://dittodb.jonkeane.com/dev/reference/redact_columns.md)
  : Redact columns from a dataframe with the default redactors

- [`set_dittodb_debug_level()`](https://dittodb.jonkeane.com/dev/reference/set_dittodb_debug_level.md)
  :

  Set `dittodb`'s debug level

- [`use_dittodb()`](https://dittodb.jonkeane.com/dev/reference/use_dittodb.md)
  :

  Use `dittodb` in your tests

## DBI methods

- [`dbDisconnect(`*`<DBIMockConnection>`*`)`](https://dittodb.jonkeane.com/dev/reference/mock-db-methods.md)
  [`dbMockConnect()`](https://dittodb.jonkeane.com/dev/reference/mock-db-methods.md)
  [`dbExistsTable(`*`<DBIMockConnection>`*`,`*`<character>`*`)`](https://dittodb.jonkeane.com/dev/reference/mock-db-methods.md)
  [`dbExistsTable(`*`<DBIMockConnection>`*`,`*`<Id>`*`)`](https://dittodb.jonkeane.com/dev/reference/mock-db-methods.md)
  [`dbListTables(`*`<DBIMockConnection>`*`)`](https://dittodb.jonkeane.com/dev/reference/mock-db-methods.md)
  [`dbListFields(`*`<DBIMockConnection>`*`,`*`<character>`*`)`](https://dittodb.jonkeane.com/dev/reference/mock-db-methods.md)
  [`dbListFields(`*`<DBIMockConnection>`*`,`*`<Id>`*`)`](https://dittodb.jonkeane.com/dev/reference/mock-db-methods.md)
  [`dbListFields(`*`<DBIMockConnection>`*`,`*`<ANY>`*`)`](https://dittodb.jonkeane.com/dev/reference/mock-db-methods.md)
  [`dbSendQuery(`*`<DBIMockConnection>`*`,`*`<character>`*`)`](https://dittodb.jonkeane.com/dev/reference/mock-db-methods.md)
  [`dbSendQuery(`*`<DBIMockConnection>`*`,`*`<SQL>`*`)`](https://dittodb.jonkeane.com/dev/reference/mock-db-methods.md)
  [`dbSendStatement(`*`<DBIMockConnection>`*`,`*`<character>`*`)`](https://dittodb.jonkeane.com/dev/reference/mock-db-methods.md)
  [`dbFetch(`*`<DBIMockResult>`*`)`](https://dittodb.jonkeane.com/dev/reference/mock-db-methods.md)
  [`fetch(`*`<DBIMockResult>`*`,`*`<ANY>`*`)`](https://dittodb.jonkeane.com/dev/reference/mock-db-methods.md)
  [`fetch(`*`<DBIMockResult>`*`,`*`<missing>`*`)`](https://dittodb.jonkeane.com/dev/reference/mock-db-methods.md)
  [`dbClearResult(`*`<DBIMockResult>`*`)`](https://dittodb.jonkeane.com/dev/reference/mock-db-methods.md)
  [`dbHasCompleted(`*`<DBIMockResult>`*`)`](https://dittodb.jonkeane.com/dev/reference/mock-db-methods.md)
  [`dbGetQuery(`*`<DBIMockRPostgreSQLConnection>`*`,`*`<character>`*`)`](https://dittodb.jonkeane.com/dev/reference/mock-db-methods.md)
  [`dbGetRowsAffected(`*`<DBIMockResult>`*`)`](https://dittodb.jonkeane.com/dev/reference/mock-db-methods.md)
  [`dbGetInfo(`*`<DBIMockConnection>`*`)`](https://dittodb.jonkeane.com/dev/reference/mock-db-methods.md)
  [`dbWriteTable(`*`<DBIMockConnection>`*`,`*`<character>`*`,`*`<data.frame>`*`)`](https://dittodb.jonkeane.com/dev/reference/mock-db-methods.md)
  [`dbRemoveTable(`*`<DBIMockConnection>`*`,`*`<character>`*`)`](https://dittodb.jonkeane.com/dev/reference/mock-db-methods.md)
  [`dbColumnInfo(`*`<DBIMockResult>`*`)`](https://dittodb.jonkeane.com/dev/reference/mock-db-methods.md)
  [`dbGetInfo(`*`<DBIMockResult>`*`)`](https://dittodb.jonkeane.com/dev/reference/mock-db-methods.md)
  [`dbQuoteIdentifier(`*`<DBIMockRPostgresConnection>`*`,`*`<character>`*`)`](https://dittodb.jonkeane.com/dev/reference/mock-db-methods.md)
  [`dbQuoteIdentifier(`*`<DBIMockRPostgresConnection>`*`,`*`<SQL>`*`)`](https://dittodb.jonkeane.com/dev/reference/mock-db-methods.md)
  [`dbQuoteString(`*`<DBIMockRPostgresConnection>`*`,`*`<character>`*`)`](https://dittodb.jonkeane.com/dev/reference/mock-db-methods.md)
  [`dbQuoteString(`*`<DBIMockRPostgresConnection>`*`,`*`<SQL>`*`)`](https://dittodb.jonkeane.com/dev/reference/mock-db-methods.md)
  [`dbQuoteString(`*`<DBIMockMariaDBConnection>`*`,`*`<character>`*`)`](https://dittodb.jonkeane.com/dev/reference/mock-db-methods.md)
  [`dbQuoteString(`*`<DBIMockMariaDBConnection>`*`,`*`<SQL>`*`)`](https://dittodb.jonkeane.com/dev/reference/mock-db-methods.md)
  [`dbBegin(`*`<DBIMockConnection>`*`)`](https://dittodb.jonkeane.com/dev/reference/mock-db-methods.md)
  [`dbCommit(`*`<DBIMockConnection>`*`)`](https://dittodb.jonkeane.com/dev/reference/mock-db-methods.md)
  [`dbRollback(`*`<DBIMockConnection>`*`)`](https://dittodb.jonkeane.com/dev/reference/mock-db-methods.md)
  : Methods for interacting with DB mocks instead of an actual database

## Test DB creation

- [`nycflights_sqlite()`](https://dittodb.jonkeane.com/dev/reference/nycflights_sqlite.md)
  : An SQLite connection to a subset of nycflights13
- [`nycflights13_create_sql()`](https://dittodb.jonkeane.com/dev/reference/nycflights13_create_sql.md)
  : Create a standardised database for testing
- [`nycflights13_create_sqlite()`](https://dittodb.jonkeane.com/dev/reference/nycflights13_create_sqlite.md)
  : Create an in-memory SQLite database for testing
