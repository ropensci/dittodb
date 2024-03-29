% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/expect-sql.R
\name{expect_sql}
\alias{expect_sql}
\title{Detect if a specific SQL statement is sent}
\usage{
expect_sql(object, regexp = NULL, ...)
}
\arguments{
\item{object}{the expression to evaluate}

\item{regexp}{the statement to match}

\item{...}{arguments passed to \code{\link[testthat:expect_error]{testthat::expect_error()}}}
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#experimental}{\figure{lifecycle-experimental.svg}{options: alt='[Experimental]'}}}{\strong{[Experimental]}}
}
\details{
Sometimes all you need to check is if a specific SQL statement has been sent
and you don't care about retrieving the results.

This works by raising an error that contains the statement that is sent to the
database as well as the location of the result. Currently, \code{expect_sql()} only
works with \code{\link[DBI:dbSendQuery]{DBI::dbSendQuery()}} (and most implementations of \code{\link[DBI:dbGetQuery]{DBI::dbGetQuery()}}
which call \code{\link[DBI:dbSendQuery]{DBI::dbSendQuery()}} internally).

\emph{Note:} this function is experimental and will likely evolve over time. Please
be prepared that new releases might break backwards compatibility.
}
\examples{
if (check_for_pkg("RSQLite", message)) {
  with_mock_db({
    con <- dbConnect(RSQLite::SQLite(), dbname = "not_a_db")

    expect_sql(
      dbGetQuery(con, "SELECT carrier, name FROM airlines LIMIT 3"),
      "SELECT carrier, name FROM airlines LIMIT 3"
    )
  })
}
}
