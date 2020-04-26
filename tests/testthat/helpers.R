skip_env <- function(which = c("RPostgres", "RMariaDB", "RPostgreSQL", "odbc")) {
  if (any(c("RPostgres", "RPostgreSQL", "odbc") %in% which) &&
      tolower(Sys.getenv("DITTODB_ENABLE_PG")) != "true") {
    skip("Skipping tests that need functioning Postgres.")
  }

  # installing 32-bit odbc drivers on windows is hard, so skip on CI
  win_x32 <- .Platform$OS.type == "windows" && version$arch != "x86_64"
  if ("odbc" %in% which && win_x32) {
    skip("Skipping odbc tests on 32bit windows.")
  }

  if ("RMariaDB" %in% which &&
      tolower(Sys.getenv("DITTODB_ENABLE_MARIA")) != "true") {
    skip("Skipping tests that need functioning MariaDB.")
  }

  # always skip on cran
  skip_on_cran()
}

skip_locally <- function(message) {
  jenkins <- identical(Sys.getenv("JENKINS_HOME"), "true")
  travis <- identical(Sys.getenv("TRAVIS"), "true")
  appveyor <- identical(Sys.getenv("APPVEYOR"), "True")
  gh_action <- identical(Sys.getenv("GITHUB_ACTIONS"), "true")

  # an over-ride to force local skipping. Useful when running covr which usually
  # runs as if it were cran
  db_test_local <- identical(Sys.getenv("DB_TEST_LOCAL"), "true")
  if (db_test_local) {
    return(skip(paste("Skipping locally (by env var DB_TEST_LOCAL):", message)))
  }

  # if we are trying to skip when the tests are being run locally
  if (!any(jenkins, travis, appveyor, gh_action)) {
    return(skip(paste("Skipping locally:", message)))
  }
}

# this shouldn't be necesary since https://github.com/r-dbi/RMariaDB/issues/119
# is resolved in RPostgres, but it still seems to be an issue.
library("RMariaDB")
setMethod("dbAppendTable", signature("MariaDBConnection"),
          function(conn, name, value, ..., row.names = NULL) {
            stopifnot(is.null(row.names))

            query <- DBI::sqlAppendTableTemplate(
              con = conn,
              table = name,
              values = value,
              row.names = row.names,
              prefix = "?",
              pattern = "",
              ...
            )
            dbExecute(conn, query, params = unname(as.list(value)))
          })
