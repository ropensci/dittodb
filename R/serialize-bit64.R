
#' Make a data.frame with pre-serialized integer64 columns
#'
#' `integer64` types do not `dput` wells with `hexNumeric`. Instead, we serialize and
#' then unserialize them cf truecluster/bit64#27 and store that as one expression per column
#' This makes the resulting data.frame awkward, but it will be recorded by `dput` in a
#' way that does get read back in faithfully (so long as the expression isn't quoted).
#'
#' @param df_in the data.frame to pre-serialize `integer64` columns from
#'
#' @return data.frame where each `integer64` column is a serialized expression of itself
#' @export
#'
#' @keywords internal
serialize_bit64 <- function(df_in) {
  # Identify integer64 columns
  classes <- lapply(df_in, class)
  int64_indicators <- which(sapply(classes, function(y) "integer64" %in% y))

  # return quickly if there are no bit64s
  if (length(int64_indicators) == 0) {
    return(df_in)
  }


  out <- df_in

  # for each column, serialize and then wrap in unserialize
  replacements <- lapply(
    df_in[int64_indicators],
    function(x) {
      str2lang(
        paste0(
          c("unserialize(", utils::capture.output(dput(serialize(x, NULL))), ")"),
          collapse = ""
        )
      )
    }
  )

  # Dance around classes so that the replacement can be a single expression that
  # produces the column when evaluated
  old_class <- class(out)
  class(out) <- "list"
  out[int64_indicators] <- replacements
  class(out) <- old_class

  out
}
