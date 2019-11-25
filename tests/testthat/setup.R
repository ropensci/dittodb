# use a temp directory so we don't have to cleanup later
temp_dir <- tempdir()
.mockPaths(temp_dir)

# load various libraries
library(DBI)
library(RSQLite)

db_user <- "travis"
db_pass <- "silly"

odbc_driver <- if (.Platform$OS.type == "windows") {
  "PostgreSQL Unicode(x64)"
} else {
  "PostgreSQL Unicode"
}
