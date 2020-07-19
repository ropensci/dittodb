#' @include mock-paths.R
NULL

#' an environment for dittodb storing state
#'
#' @export
#' @keywords internal
.dittodb_env <- new.env(parent = emptyenv())

# Set the default mock paths, use both "." and "tests/testthat/" in case they
# are different
set_default_db_mock_paths()
