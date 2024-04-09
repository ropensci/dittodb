#' Use `dittodb` in your tests
#'
#' If you would like to use `dittodb` in your package, and you are already using
#' [{testthat}](https://CRAN.R-project.org/package=testthat), use this function to
#' add `dittodb` to Suggests in the package DESCRIPTION and loads it in
#' `tests/testthat/helper.R`. Call it once when you're setting up a new package
#' test suite.
#'
#' This function should be called with the path to your package source as the
#' `path` argument. The function is idempotent: if `dittodb` is already added to
#' these files, no additional changes will be made.
#'
#' It will:
#'
#' * add `dittodb` to the `Suggests` field of the DESCRIPTION file in the
#' current working directory
#' * add `library(dittodb)` to the file `tests/testthat/helper.R` (creating it
#' if it doesn't already exist)
#'
#' @param path character path to the package
#'
#' @return Nothing: called for file system side effects.
#'
#' @importFrom utils tail
#' @export
#'
#' @examples
#' \dontrun{
#' use_dittodb()
#' use_dittodb("/path/to/package")
#' }
use_dittodb <- function(path = ".") {
  if (!("DESCRIPTION" %in% dir(path))) {
    stop(path, " is not an R package directory", call. = FALSE)
  }
  add_dittodb_to_desc(file.path(path, "DESCRIPTION"))
  # TODO: could allow helper.r too
  add_dittodb_to_helper(file.path(path, "tests", "testthat", "helper.R"))
  invisible()
}

add_dittodb_to_desc <- function(file) {
  # Read DESCRIPTION, add dittodb to Suggests if not already there

  # Hack to preserve whitespace: read it twice
  desc_fields <- colnames(read.dcf(file))
  desc <- read.dcf(file, keep.white = desc_fields)
  if (!("Suggests" %in% desc_fields)) {
    # Add a column for Suggests
    desc <- cbind(desc, matrix("", ncol = 1, dimnames = list(NULL, "Suggests")))
  }
  if (!grepl("dittodb", desc[, "Suggests"])) {
    # Add dittodb

    # Parse the list, and try to preserve the whitespace from the original
    suggested_pkgs <- unlist(strsplit(desc[, "Suggests"], ","))
    sep <- sub("^([[:blank:]\n]*).*", "\\1", suggested_pkgs)
    suggested_pkgs <- sort(c(trimws(suggested_pkgs), "dittodb"))
    extra_sep <- tail(unique(sep), 1)
    if (length(extra_sep) == 0 || nchar(extra_sep) == 0) {
      extra_sep <- " "
    }
    sep <- c(sep, extra_sep)
    desc[, "Suggests"] <- paste0(sep, suggested_pkgs, collapse = ",")

    # Msg and write
    message("Adding 'dittodb' to Suggests in DESCRIPTION")
    write.dcf(desc, file = file, keep.white = desc_fields)
  }
}

add_dittodb_to_helper <- function(file) {
  # Create tests/testthat/helper.R if it does not exist

  if (!file.exists(file)) {
    message("Creating ", file)
    message("Adding library(dittodb) to ", file)
    dir.create(dirname(file), showWarnings = FALSE, recursive = TRUE)
    cat("library(dittodb)\n", file = file)
    # Msg and write
  } else {
    helper_lines <- readLines(file)
    if (!any(grepl("library(dittodb)", helper_lines, fixed = TRUE))) {
      # Add "library(dittodb)" to the top if it's not already there
      helper_lines <- c("library(dittodb)", helper_lines)
      # Msg and write
      message("Adding library(dittodb) to ", file)
      writeLines(helper_lines, file)
    }
  }
}
