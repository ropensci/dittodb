detach("package:dbtest", unload = TRUE)

custom_connections <- c("DBIMockSQLiteConnection")

# ensure they have all been removed
for (class_name in custom_connections) {
  testthat::expect_error(methods::getClass(class_name), "is not a defined class")
}

# .onLoad errors when trying to make the class because during testing the package
# namespace is locked, so test that that is the error (as evidence that the code
# is being executed)
testthat::expect_error(
  dbtest:::.onLoad(),
  "class .*DBIMockSQLiteConnection.* has a locked definition in package .*dbtest.*"
)

