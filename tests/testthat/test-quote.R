test_that("quoting works", {
  con_mockmaria <- con_rpostgres <- list()
  class(con_mockmaria) <- "DBIMockMariaDBConnection"
  class(con_rpostgres) <- "DBIMockRPostgresConnection"

  some_sql <- SQL("foo")

  expect_identical(dbQuoteString(con_mockmaria, some_sql), some_sql)
  expect_identical(dbQuoteString(con_rpostgres, some_sql), some_sql)

  expect_identical(dbQuoteIdentifier(con_mockmaria, some_sql), some_sql)
  expect_identical(dbQuoteIdentifier(con_rpostgres, some_sql), some_sql)

  expect_identical(dbQuoteString(con_mockmaria, "foo"), SQL("'foo'"))
  expect_identical(dbQuoteString(con_rpostgres, "foo"), SQL("'foo'"))
  expect_identical(dbQuoteIdentifier(con_rpostgres, "foo"), SQL('"foo"'))
  # dplyr ident-style
  expect_identical(
    dbQuoteIdentifier(con_rpostgres, '"rpostgres"."airlines"'),
    SQL('"""rpostgres"".""airlines"""')
  )
  # However, MariaDB is slightly different (we haven't redefined it, since it
  # doesn't communicate with the DB first)
  expect_identical(dbQuoteIdentifier(con_mockmaria, "foo"), SQL("`foo`"))
})
