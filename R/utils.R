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
