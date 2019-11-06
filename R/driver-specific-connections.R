.onLoad <- function(libname, pkgname) {
  # following the convention from Writing R Extensions
  # https://cran.r-project.org/doc/manuals/r-release/R-exts.html#Suggested-packages
  if (requireNamespace("RSQLite", quietly = TRUE)) {
    methods::setClass("DBIMockSQLiteConnection",
                      contains = c("DBIMockConnection", "SQLiteConnection")
    )
  }
}
