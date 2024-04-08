#' Check if a package is installed
#'
#' Uses `requireNamespace()` to check if a package is already installed and
#' provides options for issuing an error, warning, etc. in case the package is
#' not installed.
#'
#' It is only exported for use in examples.
#'
#' @param package the name of the package to check for
#' @param func what should this check call if the package is not installed?
#' This can be any function, but `stop`, `warning`, `skip`, etc. are likely
#' candidates (default: `stop`)
#'
#' @return `TRUE` if the package is installed, `FALSE` if it is not (invisibly)
#' @export
#'
#' @keywords internal
#' @examples
#' check_for_pkg("DBI")
#' check_for_pkg("no-such-package", func = message)
check_for_pkg <- function(package, func = stop) {
  if (!requireNamespace(package, quietly = TRUE)) {
    args <- list(glue::glue(
      "The package {package} isn't installed but is needed for this action.",
      "Please install it with install.packages(\"{package}\") and try again.",
      .sep = "\n"
    ))
    if ("call." %in% methods::formalArgs(func)) {
      args <- append(args, c(call. = FALSE))
    }

    do.call(func, args)
    return(invisible(FALSE))
  }

  return(invisible(TRUE))
}

#' Get the `dbname` from a connection call
#'
#' @param dots from the argument being passed to the connection
#' @param drv from the argument being passed to the connection
#'
#' @return the name, sanitized if needed
#'
#' @keywords internal
#'
#' @export
get_dbname <- function(dots, drv = NULL) {
  # look through dots to grab either dbname or the first unnammed argument
  named_dbname <- !is.null(dots$dbname) && dots$dbname != ""
  dbname_is_empty <- is.null(dots$dbname) || dots$dbname == ""
  named_database <- !is.null(dots$Database) && dots$Database != ""
  named_dsn <- !is.null(dots$dsn) && dots$dsn != ""
  unnamed_dbname <- length(dots) > 0 &&
    (is.null(names(dots[1])) || names(dots[1]) == "")
  drv_is_sqlite <- !is.null(drv) && inherits(drv, "SQLiteDriver")

  if (named_dbname) {
    path <- dots$dbname
  } else if (named_database) {
    path <- dots$Database
  } else if (named_dsn) {
    path <- dots$dsn
  } else if (unnamed_dbname) {
    path <- dots[[1]]
  } else if (drv_is_sqlite && dbname_is_empty) {
    # RSQLite will create an ephemeral connection here
    path <- "ephemeral_sqlite"
  } else {
    # if there is no name, or it's empty
    stop("There was no dbname, so I don't know where to look for mocks.")
  }
  return(db_path_sanitize(path))
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
    "`dbplyr_[[:alnum:]]+`",
    "`removed_unique_dplyr_name`",
    statement
  )
  statement <- gsub(
    "`q[[:digit:]]+`",
    "`removed_unique_dplyr_name`",
    statement
  )
  return(statement)
}

ignore_quotes <- function(statement) {
  # remove all the quotes
  # sometimes E' has a space before it, so add that in (not sure if this is from
  # dbplyr or RPostgres)
  # TODO: should we clean up white space separately?
  statement <- gsub("(`|\"|'| ?E')", "`", statement)
  # how could we even know how many \s will show up?
  statement <- gsub("\\\\+", "\\\\", statement)
  return(statement)
}

#' Set {dittodb}'s debug level
#'
#' It can be helpful to see what's going on by increasing {dittodb}'s verbosity
#' which will show what's going on under the hood (e.g. what queries are being
#' requested, from where). This sets the option `dittodb.debug` to the value
#' given in the `level` argument. The option can be set directly with
#' `options(dittodb.debug = n)` as well.
#'
#' The `level` argument is a numeric, where 0 is the default and (relatively)
#' silent. The higher the level, the more verbose {dittodb} will be.
#'
#' Currently, {dittodb} only has one level of debugging (any value 1 or
#' greater), but more might be used in the future.
#'
#' @param level a numeric, the level to set to (e.g. 1)
#'
#' @return the level, invisibly
#' @export
#'
#' @examples
#' set_dittodb_debug_level(1)
#' set_dittodb_debug_level(0)
set_dittodb_debug_level <- function(level) {
  stopifnot(is.numeric(level) || is.null(level))
  options("dittodb.debug" = level)

  return(invisible(level))
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
get_type <- function(statement) {
  return(strsplit(statement, " ")[[1]][1])
}

#' Sanitize Table id
#'
#' Tables are identified and specified with a large number of ways across
#' drivers. For the purposes of {dittodb}, the details are less important since
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

  return(paste0(gsub("\"", "", id), collapse = "."))
}

# borrowed from Neal borrowing from Hadley
"%||%" <- function(a, b) if (!is.null(a)) a else b # nolint

testing_port <- function(db) {
  port <- NULL

  if (grepl("maria|mysql", db, ignore.case = TRUE)) {
    port <- as.integer(Sys.getenv("DITTODB_MARIA_TEST_PORT", "3306"))
  }

  if (grepl("postgres|psql|pg", db, ignore.case = TRUE)) {
    port <- as.integer(Sys.getenv("DITTODB_PG_TEST_PORT", "5432"))
  }

  return(port)
}

is_expecting <- function() {
  return(get0("expecting", .dittodb_env, ifnotfound = FALSE))
}

#' @importFrom lifecycle badge
NULL
