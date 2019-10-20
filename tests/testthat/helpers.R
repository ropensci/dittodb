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
  cran <- !identical(Sys.getenv("NOT_CRAN"), "true")
  appveyor <- identical(Sys.getenv("APPVEYOR"), "True")

  # if we are trying to skip when the tests are being run locally
  if (!any(jenkins, travis, cran, appveyor)) {
    return(skip(paste("Skipping locally:", message)))
  }
}
