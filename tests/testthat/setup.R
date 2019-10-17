# use a temp directory so we don't have to cleanup later
temp_dir <- tempdir()
.mockPaths(temp_dir)

# load various libraries
library(DBI)
library(RSQLite)
