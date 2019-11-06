context("Testing setup of .onLoad()")

test_that(".onLoad add cusotm classes for all driverst that are available.", {
  local({
    custom_connections <- c("DBIMockSQLiteConnection")

    # remove the classes we know are created by .onLoad, so that we can test
    # that they are correctly created
    for (class in custom_connections) {
      removeClass(class, asNamespace("dbtest"))
    }

    # ensure they have all been removed
    expect_false(all(custom_connections %in% getClasses(asNamespace("dbtest"))))

    # "load" the package
    .onLoad()

    # now we have them all back
    expect_true(all(custom_connections %in% getClasses(asNamespace("dbtest"))))
  },
  envir=new.env())
})

# TODO: can we mock what packages are available and show that nothing bad happens?
