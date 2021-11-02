test_that("transactions", {
  con_mockmaria <- con_rpostgres <- list()
  class(con_mockmaria) <- "DBIMockMariaDBConnection"
  class(con_rpostgres) <- "DBIMockRPostgresConnection"

  # these are all currently no-ops
  expect_true(dbBegin(con_mockmaria))
  expect_true(dbCommit(con_mockmaria))
  expect_true(dbRollback(con_mockmaria))

  expect_true(dbBegin(con_rpostgres))
  expect_true(dbCommit(con_rpostgres))
  expect_true(dbRollback(con_rpostgres))
})
