#' @importFrom utils installed.packages
check_for_pkg <- function(package) {
  installed_packages <- rownames(installed.packages())

  if (!package %in% installed_packages) {
    # TODO: also allow warnings?
    stop(
      "The package ",
      package,
      " isn't installed but is required for this function. \nPlease install ",
      "it with install.packages(\"", package, "\") and try again.",
      call. = FALSE
    )
  }

  return(invisible(TRUE))
}

#' Switch illegal characters for legal ones
#'
#' Inspired by the [fs](https://CRAN.R-project.org/package=fs) package's
#' `path_sanitize` function
#'
#' @param filename the file or folder to sanitize
#' @param replacement what should the illegal character(s) be replaced with?
#' (default: "_")
#'
#' @return the sanitized string
#' @export
#'
#' @keywords internal
#'
#' @examples
#' db_path_sanitize('this:string"has?issues')
db_path_sanitize <- function(filename, replacement = "_") {
  illegal_chars <- "[/\\?<>\\:*|\":]"
  control_chars <- "[[:cntrl:]]"
  windows_reserved_chars <- "^(con|prn|aux|nul|com[0-9]|lpt[0-9])([.].*)?$"

  for (chars in c(illegal_chars, control_chars, windows_reserved_chars)) {
    filename <- gsub(chars, replacement, filename, ignore.case = TRUE)
  }

  # TODO: limit size?

  return(filename)
}

ignore_dbplyr_unique_names <- function(statement) {
  return(gsub("`zzz[[:digit:]]+`", "`removed_unique_dplyr_name`", statement))
}

#' Get the dbtest debug level and evaluate if it is above a level
#'
#' @param level the level to test against (greater than or equal to)
#'
#' @return logical
#' @export
#'
#' @keywords internal
#'
#' @examples
#' dbtest_debug_level(0)
#' dbtest_debug_level(2)
dbtest_debug_level <- function(level) {
  return(getOption("dbtest.debug", 0) >= level)
}

#' Get the type of an SQL statement
#'
#' @param statement the statement to extract the first word from
#'
#' @return the first word in the statement
#' @export
#'
#' @keywords internal
get_type <- function(statement) return(strsplit(statement, " ")[[1]][1])
