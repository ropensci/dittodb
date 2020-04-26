# use a temp directory so we don't have to cleanup later
temp_dir <- tempdir()
db_mock_paths(temp_dir)

# load various libraries
library(DBI)
library(RSQLite)
library(glue)

db_user <- "travis"
db_pass <- "*V7y5N2r"


win_x64 <- .Platform$OS.type == "windows" & Sys.info()[["machine"]] == "x86_64"
odbc_driver <- if (win_x64) {
  "PostgreSQL Unicode(x64)"
} else {
  "PostgreSQL Unicode"
}
