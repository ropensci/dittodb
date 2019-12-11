skip_env <- function(which = c("RPostgres", "RMariaDB")) {
  if ("RPostgres" %in% which && tolower(Sys.getenv("DBTEST_DISABLE_PG")) == "true") {
    skip("Skipping tests that need functioning RPostgres.")
  }

  if ("RMariaDB" %in% which && tolower(Sys.getenv("DBTEST_DISABLE_MARIA")) == "true") {
    skip("Skipping tests that need functioning RMariaDB.")
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
setMethod("dbAppendTable", signature("MariaDBConnection"), DBI::dbAppendTable)
