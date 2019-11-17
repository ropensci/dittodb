skip_env <- function(which = c("postgres", "mariadb")) {
  which <- match.arg(which)

  if ("postgres" %in% which && Sys.getenv("DBTEST_DISABLE_PG") != "") {
    skip("Skipping tests that need a functioning Postgres backend.")
  }

  if ("mariadb" %in% which && Sys.getenv("DBTEST_DISABLE_MARIA") != "") {
    skip("Skipping tests that need a functioning MariaDB backend.")
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
  if (!any(jenkins, travis, appveyor)) {
    return(skip(paste("Skipping locally:", message)))
  }
}
