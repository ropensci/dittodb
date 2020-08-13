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
