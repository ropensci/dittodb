#' make a mock path
#'
#' @param path the path to look in
#' @param type what type of query is it? (e.g. `SELECT`, `INSERT`)
#' @param hash the hash of the query
#'
#' @return a constructed path to a mock
#'
#' @keywords internal
#'
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
#'
#' @importFrom digest digest
#'
#' @keywords internal
#'
#' @export
hash <- function(string, n = 6) {
  string <- ignore_quotes(string)
  string <- ignore_dbplyr_unique_names(string)
  return(substr(digest(string), 1, n))
}

read_file <- function(file_path) source(file_path)$value

# search through .mockPaths() to find a file, returning the first
find_file <- function(file_path) {
  for (mock_path in .mockPaths()) {
    path_to_check <- file.path(mock_path, file_path)
    if (file.exists(path_to_check)) {
      return(path_to_check)
    }
  }

  stop("Couldn't find the file ", file_path, " in any of the mock directories.")
}
