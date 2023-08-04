test_that("extract_hash_from_object string objects work", {
  # test strings
  expect_identical(extract_hash_from_object("foo"), "bd40ef")
  expect_identical(extract_hash_from_object(""), "2f88e1")

})

test_that("extract_hash_from_object s4 MariaDBResult work", {
  if (requireNamespace("RMariaDB", quietly = TRUE)) {
    # create S4-Object for testing
    obj <- new("MariaDBResult")
    obj@sql <- "Select * from my_table"
    expect_identical(extract_hash_from_object(obj), "e00bce")
  }
})

test_that("extract_hash_from_object s4 PqResult work", {
  if (requireNamespace("RPostgres", quietly = TRUE)) {
    # create S4-Object for testing
    obj <- new("PqResult")
    obj@sql <- "Select * from my_table"
    expect_identical(extract_hash_from_object(obj), "e00bce")
  }
})

test_that("extract_hash_from_object s4 SQLiteResult work", {
  if (requireNamespace("RSQLite", quietly = TRUE)) {
    # create S4-Object for testing
    obj <- new("SQLiteResult")
    obj@sql <- "Select * from my_table"
    expect_identical(extract_hash_from_object(obj), "e00bce")
  }
})

test_that("extract_hash_from_object s4 OdbcResult work", {
  if (requireNamespace("odbc", quietly = TRUE)) {
    # create S4-Object for testing
    obj <- new("OdbcResult")
    obj@statement <- "Select * from my_table"
    expect_identical(extract_hash_from_object(obj), "e00bce")
  }
})

test_that("extract_hash_from_object s4 DBIMockUnknownDBResult work", {
  setClass("DBIMockUnknownDBResult",
           slots = c(
             m_sOperation = "character"
           ),
           prototype = list(
             m_sOperation = NA_character_
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
  obj@m_sOperation <- "Select * from my_table"
  expect_identical(extract_hash_from_object(obj), "10a362")
})
