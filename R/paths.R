#' make a mock path
#'
#' @param path the path to look in
#' @param type what type of query is it? (e.g. `SELECT`, `INSERT`)
#' @param hash the hash of the query
#'
#' @return a constructed path to a mock
#' @export
make_path <- function(path, type, hash) {
  path_out <- file.path(path, db_path_sanitize(paste0(type, "-", hash, ".R")))
  return(path_out)
}

#' Make a (short) hash from a string
#'
#' @param string the string to hash
#' @param n how long should the hash be? (default: 6)
#'
#' @return a hash for the string
#' @export
#' @importFrom digest digest
hash <- function (string, n=6) substr(digest(string), 1, n)

ensure_file <- function(file_path) {
  if (!file.exists(file_path)) {
    return(FALSE)
  }
  return(TRUE)
}

read_file <- function(file_path) {
  if (!ensure_file(file_path)) {
    stop("Couldn't find the file at ", file_path)
  }

  return(source(file_path)$value)
}

