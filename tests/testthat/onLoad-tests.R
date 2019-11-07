detach("package:dbtest", unload = TRUE)

custom_connections <- c("DBIMockSQLiteConnection")

# ensure they have all been removed
for (class_name in custom_connections) {
  testthat::expect_error(methods::getClass(class_name), "is not a defined class")
}

# "load" the package
testthat::expect_error(
  dbtest:::.onLoad(),
  "class \"DBIMockSQLiteConnection\" has a locked definition in package 'dbtest'"
)

