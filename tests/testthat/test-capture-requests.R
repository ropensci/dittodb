with_mock_path(path = file.path(temp_dir, "recording_tracing"), {
  start_db_capturing()

  test_that("DBI and the top-most dbSenQuery has been traced", {
    # the first instance of dbSendQuery is mocked:
    expect_s4_class(getAnywhere("dbSendQuery")[1], "standardGenericWithTrace")

    # the DBI namespace instance of dbQuery is also mocked:
    dbi_ind <- which(getAnywhere("dbSendQuery")$where == "namespace:DBI")
    expect_s4_class(
      getAnywhere("dbSendQuery")[dbi_ind],
      "standardGenericWithTrace"
    )
  })

  stop_db_capturing()

  # no instance of dbSendQuery is mocked anymore
  postCaptureDbSendQuery <- getAnywhere("dbSendQuery")
  for (i in seq_along(postCaptureDbSendQuery$objs)) {
    msg <- paste0("No more tracing in ", postCaptureDbSendQuery$where[i])
    test_that(msg, {
      # can't use expect_s4_class because standardGenericWithTrace inherits from
      # standardGeneric
      testthat_transition(
        expect_equivalent(class(postCaptureDbSendQuery[i]), "standardGeneric"),
        expect_equal(class(postCaptureDbSendQuery[i]), "standardGeneric", ignore_attr = TRUE)
      )
    })
  }

  unloadNamespace("RPostgreSQL")
  start_db_capturing()

  # the first instance of dbSendQuery is mocked:
  expect_s4_class(getAnywhere("dbSendQuery")[1], "standardGenericWithTrace")

  # the DBI namespace instance of dbQuery is also mocked:
  dbi_ind <- which(getAnywhere("dbSendQuery")$where == "namespace:DBI")
  expect_s4_class(
    getAnywhere("dbSendQuery")[dbi_ind],
    "standardGenericWithTrace"
  )

  stop_db_capturing()

  capture_db_requests({
    test_that("DBI and the top-most dbSenQuery has been traced", {
      # the first instance of dbSendQuery is mocked:
      expect_s4_class(getAnywhere("dbSendQuery")[1], "standardGenericWithTrace")

      # the DBI namespace instance of dbQuery is also mocked:
      dbi_ind <- which(getAnywhere("dbSendQuery")$where == "namespace:DBI")
      expect_s4_class(
        getAnywhere("dbSendQuery")[dbi_ind],
        "standardGenericWithTrace"
      )
    })
  })

  # while setting a path
  capture_db_requests(path = tempdir(), {
    test_that("DBI and the top-most dbSenQuery has been traced", {
      # the first instance of dbSendQuery is mocked:
      expect_s4_class(getAnywhere("dbSendQuery")[1], "standardGenericWithTrace")

      # the DBI namespace instance of dbQuery is also mocked:
      dbi_ind <- which(getAnywhere("dbSendQuery")$where == "namespace:DBI")
      expect_s4_class(
        getAnywhere("dbSendQuery")[dbi_ind],
        "standardGenericWithTrace"
      )
    })
  })
})

test_that("set_redactor sets and unsets", {
  # there is no redactor
  expect_null(get_redactor())

  # we can set it
  set_redactor("not really a redactor")
  expect_identical(get_redactor(), "not really a redactor")

  # we can clear it
  set_redactor(NULL)
  expect_null(get_redactor())
})

test_that("hash_db_object string objects work", {
  # test strings
  expect_identical(hash_db_object("foo"), "bd40ef")
  expect_identical(hash_db_object(""), "2f88e1")

})

test_that("hash_db_object s4 MariaDBResult work", {
  if (requireNamespace("RMariaDB", quietly = TRUE)) {
    # create S4-Object for testing
    obj <- new("MariaDBResult")
    obj@sql <- "Select * from my_table"
    expect_identical(hash_db_object(obj), "e00bce")
  }
})

test_that("hash_db_object s4 PqResult work", {
  if (requireNamespace("RPostgres", quietly = TRUE)) {
    # create S4-Object for testing
    obj <- new("PqResult")
    obj@sql <- "Select * from my_table"
    expect_identical(hash_db_object(obj), "e00bce")
  }
})

test_that("hash_db_object s4 SQLiteResult work", {
  if (requireNamespace("RSQLite", quietly = TRUE)) {
    # create S4-Object for testing
    obj <- new("SQLiteResult")
    obj@sql <- "Select * from my_table"
    expect_identical(hash_db_object(obj), "e00bce")
  }
})

test_that("hash_db_object s4 OdbcResult work", {
  if (requireNamespace("odbc", quietly = TRUE)) {
    # create S4-Object for testing
    obj <- new("OdbcResult")
    obj@statement <- "Select * from my_table"
    expect_identical(hash_db_object(obj), "e00bce")
  }
})

test_that("hash_db_object s4 DBIMockUnknownDBResult work", {
  # create a unknown S4-Object for testing the default case in hash_db_object
  # The 'hash_db_object' function uses 'toString' to stringify the object.
  # In addition, the 'hash' function also uses 'as.character'.
  # For the test to run successfully the test object needs these methods to simulate a DBResult object.
  setClass("DBIMockUnknownDBResult",
           slots = c(
             m_statement = "character"
           ),
           prototype = list(
             m_statement = NA_character_
           )
  )
  setMethod("toString", "DBIMockUnknownDBResult", function(x) {
    return("DBIMockUnknownDBResult")
  })

  setMethod("as.character", "DBIMockUnknownDBResult", function(x) {
    return("DBIMockUnknownDBResult")
  })

  # create S4-Object for testing
  obj <- new("DBIMockUnknownDBResult")
  obj@m_statement <- "Select * from my_table"
  expect_identical(hash_db_object(obj), "10a362")
})

test_that("hash_db_object s4 DBIMockTeradataResult work", {
  # create a teradata S4-Object for testing the default case with m_sOperation slot name in hash_db_object
  # The 'hash_db_object' function uses 'toString' to stringify the object.
  # In addition, the 'hash' function also uses 'as.character'.
  # For the test to run successfully the test object needs these methods to simulate a DBResult object.
  setClass("DBIMockTeradataResult",
           slots = c(
             m_sOperation = "character"
           ),
           prototype = list(
             m_sOperation = NA_character_
           )
  )
  setMethod("toString", "DBIMockTeradataResult", function(x) {
    return("DBIMockUnknownDBResult")
  })

  setMethod("as.character", "DBIMockTeradataResult", function(x) {
    return("DBIMockUnknownDBResult")
  })

  # create S4-Object for testing
  obj <- new("DBIMockTeradataResult")
  obj@m_sOperation <- "Select * from my_table"
  expect_identical(hash_db_object(obj), "e00bce")
})
