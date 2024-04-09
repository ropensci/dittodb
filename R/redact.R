#' Redact columns from a dataframe with the default redactors
#'
#' This function redacts the columns specified in `columns` in the data given in
#' `data` using `dittodb`'s standard redactors.
#'
#' The column names given in the `columns` argument are treated as regular
#' expressions, however they always have `^` and `$` added to the beginning and
#' end of the strings. So if you would like to match any column that starts with
#' the string `sensitive` (e.g. `sensitive_name`, `sensitive_date`) you could
#' use `"sensitive.*` and this would catch all of those columns (though it would
#' not catch a column called `most_sensitive_name`).
#'
#' The standard redactors replace all values in the column with the following
#' values based on the columns type:
#'
#' * integer -- `9L`
#' * numeric -- `9`
#' * character -- `"[redacted]"`
#' * `POSIXct` (date times) -- `as.POSIXct("1988-10-11T17:00:00", tz = tzone)`
#'
#' @param data a dataframe to redact
#' @param columns character, the columns to redact
#' @param ignore.case should case be ignored? (default: `TRUE`)
#' @param ... additional options to pass on to `grep()` when matching the column
#' names
#'
#' @return data, with the columns specified in `columns` duly redacted
#' @export
#'
#' @examples
#' if (check_for_pkg("nycflights13", message)) {
#'   small_flights <- head(nycflights13::flights)
#'
#'   # with no columns specified, redacting does nothing
#'   redact_columns(small_flights, columns = NULL)
#'
#'   # integer
#'   redact_columns(small_flights, columns = c("arr_time"))
#'
#'   # numeric
#'   redact_columns(small_flights, columns = c("arr_delay"))
#'
#'   # characters
#'   redact_columns(small_flights, columns = c("origin", "dest"))
#'
#'   # datetiems
#'   redact_columns(small_flights, columns = c("time_hour"))
#' }
redact_columns <- function(data, columns, ignore.case = TRUE, ...) { # nolint
  columns <- unlist(lapply(
    glue("^{columns}$"),
    grep,
    x = colnames(data),
    value = TRUE,
    ignore.case = ignore.case,
    ...
  ))

  # remove non-matches
  columns <- columns[lapply(columns, length) > 0]

  return(redact(data, standard_redactors(data, columns)))
}

redact <- function(data, redactors) {
  columns <- names(redactors)
  data[, columns] <- lapply(columns, function(x) redactors[[x]](data[, x]))
  return(data)
}

standard_redactors <- function(data, columns) {
  out <- lapply(columns, function(x) {
    col <- data[[x]]

    if (inherits(col, "integer")) {
      return(function(data) {
        return(rep(9L, length(data)))
      })
    } else if (inherits(col, "numeric")) {
      return(function(data) {
        return(rep(9, length(data)))
      })
    } else if (inherits(col, "character")) {
      return(function(data) {
        return(rep("[redacted]", length(data)))
      })
    } else if (inherits(col, "POSIXct")) {
      # should this actually be POSIXt? or have a separate POSIXlt?
      return(function(data) {
        tzone <- attributes(data)$tzone %||% "EST"
        return(rep(as.POSIXct("1988-10-11T17:00:00", tz = tzone), length(data)))
      })
    }
  })
  names(out) <- columns
  return(out)
}
