# use a temp directory so we don't have to cleanup later
temp_dir <- tempdir()
db_mock_paths(temp_dir)

# load various libraries
library(DBI)
library(RSQLite)
library(glue)

db_user <- "travis"
db_pass <- "*V7y5N2r"

odbc_driver <- if (.Platform[["OS.type"]] == "windows") {
  "PostgreSQL Unicode(x64)"
} else {
  "PostgreSQL Unicode"
}
