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
  statement <- gsub(
    "`zzz[[:digit:]]+`",
    "`removed_unique_dplyr_name`",
    statement
  )
  statement <- gsub(
    "`dbplyr_[[:digit:]]+`",
    "`removed_unique_dplyr_name`",
    statement
  )
  return(statement)
}

ignore_quotes <- function(statement) {
  return(gsub("(`|\"|')", "`", statement))
}

#' Get the dittodb debug level and evaluate if it is above a level
#'
#' @param level the level to test against (greater than or equal to)
#'
#' @return logical
#' @export
#'
#' @keywords internal
#'
#' @examples
#' dittodb_debug_level(0)
#' dittodb_debug_level(2)
dittodb_debug_level <- function(level) {
  return(getOption("dittodb.debug", 0) >= level)
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

#' Sanitize Table id
#'
#' Tables are identified and specified with a large number of ways across
#' drivers. For the purposes of `dittodb`, the details are less important since
#' we almost always just want a flat representation (_ie_ for filenames). This
#' takes the various formats and returns a string with various elements
#' separated by dots.
#'
#' @param id the table identifier (an `Id`, a vector of strings, or a string)
#' @param ... additional arguments (to allow for things like `schema_name` that
#' `odbc` uses.)
#'
#' @return the first word in the statement
#' @export
#'
#' @keywords internal
sanitize_table_id <- function(id, ...) {
  if (inherits(id, "Id")) {
    id <- id@name
  }

  # if dots append them to the beginning
  dots <- list(...)
  if (length(dots) > 0) {
    id <- c(dots, id)
  }

  return(paste0(id, collapse = "."))
}

# borrowed from Neal borrowing from Hadley
"%||%" <- function(a, b) if (!is.null(a)) a else b # nolint
