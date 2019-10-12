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
