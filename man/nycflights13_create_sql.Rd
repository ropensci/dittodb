% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nycflights13-sql.R
\name{nycflights13_create_sql}
\alias{nycflights13_create_sql}
\title{Create a standardised database for testing}
\usage{
nycflights13_create_sql(con, schema = "", ...)
}
\arguments{
\item{con}{an SQL connection (i.e a PostgreSQL connection)}

\item{schema}{schema to write the tables ("", or no schema by default)}

\item{...}{additional parameters to connect to a database}
}
\value{
the connection given in \code{con} invisibly, generally called for the
side effects of writing to the database
}
\description{
Using the connection given in \code{con}, create a database including a few tables
from the \href{https://CRAN.R-project.org/package=nycflights13}{\code{nycflights13}} dataset.
}
\examples{
\donttest{
if (check_for_pkg("RSQLite", message)) {
  con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")

  nycflights13_create_sql(con)

  DBI::dbGetQuery(
    con,
    "SELECT year, month, day, carrier, flight, tailnum FROM flights LIMIT 10"
  )

  DBI::dbDisconnect(con)
}
}
}
