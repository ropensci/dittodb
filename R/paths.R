make_path <- function(path, type, hash) {
  return(file.path(path, paste0(type, "-", hash, ".R")))
}

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

