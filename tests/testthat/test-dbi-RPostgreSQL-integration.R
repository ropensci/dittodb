context("RPostgreSQL")

skip_locally("use postgres-docker.sh and test manually")

library(RPostgreSQL)

# setup the database that will be mocked and then tested
con <- dbConnect(
  RPostgreSQL::PostgreSQL(),
  dbname = "nycflights",
  host = "127.0.0.1",
  user = db_user,
  password = db_pass
)

con <- nycflights13_sql(con, schema = "rpostgresql")

test_that("The fixture is what we expect", {
  # we check just that the tables are there since other tests will add other tables
  expect_true(all(
    c("airlines", "airports", "flights", "planes", "weather") %in% dbListTables(con)
  ))

  expect_identical(
    dbGetQuery(con, "SELECT * FROM rpostgresql.airlines LIMIT 2"),
    data.frame(
      carrier = c("9E", "AA"),
      name = c("Endeavor Air Inc.", "American Airlines Inc."),
      stringsAsFactors = FALSE
    )
  )
})

dbDisconnect(con)

with_mock_path(path = file.path(temp_dir, "postgresql_integration"), {
  start_capturing()

  con <- dbConnect(
    RPostgreSQL::PostgreSQL(),
    dbname = "nycflights",
    host = "127.0.0.1",
    user = db_user,
    password = db_pass
  )

  # dbGetQuery is different for RPostgreSQL and isn't simply a warpper around
  # dbSendQuery(), dbFetch()
  res <- dbSendQuery(con, "SELECT * FROM rpostgresql.airlines LIMIT 2")
  dbFetch(res)
  res <- dbSendQuery(con, "SELECT * FROM rpostgresql.airlines LIMIT 1")
  dbFetch(res)

  dbGetQuery(con, "SELECT * FROM rpostgresql.airlines LIMIT 3")

  dbDisconnect(con)
  stop_capturing()

  with_mock_db({
    con <- dbConnect(
      RPostgreSQL::PostgreSQL(),
      dbname = "nycflights",
      host = "127.0.0.1",
      user = db_user,
      password = db_pass
    )

    test_that("Our connection is a mock connection", {
      expect_is(
        con,
        "DBIMockConnection"
      )
    })

    test_that("We can use mocks for dbGetQeury", {
      expect_identical(
        dbGetQuery(con, "SELECT * FROM rpostgresql.airlines LIMIT 2"),
        data.frame(
          carrier = c("9E", "AA"),
          name = c("Endeavor Air Inc.", "American Airlines Inc."),
          stringsAsFactors = FALSE
        )
      )
    })

    test_that("We can use mocks for dbSendQuery", {
      result <- dbSendQuery(con, "SELECT * FROM rpostgresql.airlines LIMIT 2")
      expect_identical(
        dbFetch(result),
        data.frame(
          carrier = c("9E", "AA"),
          name = c("Endeavor Air Inc.", "American Airlines Inc."),
          stringsAsFactors = FALSE
        )
      )
    })

    test_that("A different query uses a different mock", {
      expect_identical(
        dbGetQuery(con, "SELECT * FROM rpostgresql.airlines LIMIT 1"),
        data.frame(
          carrier = c("9E"),
          name = c("Endeavor Air Inc."),
          stringsAsFactors = FALSE
        )
      )
    })

    test_that("our dbGetQuery() only mock worked", {
      out <- dbGetQuery(con, "SELECT * FROM rpostgresql.airlines LIMIT 3")
      expect_is(out, "data.frame")
      expect_equal(nrow(out), 3)
    })

    dbDisconnect(con)
  })
})
