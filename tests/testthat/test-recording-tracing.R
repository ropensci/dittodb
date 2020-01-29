context("Recording tracing is happening in the right place(s)")


with_mock_path(path = file.path(temp_dir, "recording_tracing"), {
  start_capturing()

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

  stop_capturing()

  # no instance of dbSendQuery is mocked anymore
  postCaptureDbSendQuery <- getAnywhere("dbSendQuery")
  for (i in seq_along(postCaptureDbSendQuery$objs)) {
    msg <- paste0("No more tracing in ", postCaptureDbSendQuery$where[i])
    test_that(msg, {
      # can't use expect_s4_class because standardGenericWithTrace inherits from
      # standardGeneric
      expect_equivalent(class(postCaptureDbSendQuery[i]), "standardGeneric")
    })
  }

  unloadNamespace("RPostgreSQL")
  start_capturing()

  # the first instance of dbSendQuery is mocked:
  expect_s4_class(getAnywhere("dbSendQuery")[1], "standardGenericWithTrace")

  # the DBI namespace instance of dbQuery is also mocked:
  dbi_ind <- which(getAnywhere("dbSendQuery")$where == "namespace:DBI")
  expect_s4_class(
    getAnywhere("dbSendQuery")[dbi_ind],
    "standardGenericWithTrace"
  )

  stop_capturing()
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
