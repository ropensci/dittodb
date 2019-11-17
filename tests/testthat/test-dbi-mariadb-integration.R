context("MariaDB")

skip_env("mariadb")
skip_locally("use mariadb-docker.sh and test manually")

library("RMariaDB")

con <- dbConnect(
  RMariaDB::MariaDB(),
  dbname = "nycflights",
  host = "127.0.0.1",
  username = "travis",
  password = ""
)

con <- nycflights13_sql(con)

test_that("The fixture is what we expect", {
  # we check just that the tables are there since other tests will add other tables
  expect_true(all(
    c("airlines", "airports", "flights", "planes", "weather") %in% dbListTables(con)
  ))

  expect_identical(
    dbGetQuery(con, "SELECT * FROM airlines LIMIT 2"),
    data.frame(
      carrier = c("9E", "AA"),
      name = c("Endeavor Air Inc.", "American Airlines Inc."),
      stringsAsFactors = FALSE
    )
  )
})

dbDisconnect(con)


with_mock_path(path = file.path(temp_dir, "mariadb_integration"), {
  start_capturing()

  con <- dbConnect(
    RMariaDB::MariaDB(),
    dbname = "nycflights",
    host = "127.0.0.1",
    username = "travis",
    password = ""
  )

  dbGetQuery(con, "SELECT * FROM airlines LIMIT 2")
  dbGetQuery(con, "SELECT * FROM airlines LIMIT 1")

  dbDisconnect(con)
  stop_capturing()


  with_mock_db({
    con <- dbConnect(
      RMariaDB::MariaDB(),
      dbname = "nycflights",
      host = "127.0.0.1",
      username = "travis",
      password = ""
    )

    test_that("Our connection is a mock connection", {
      expect_is(
        con,
        "DBIMockConnection"
      )
    })

    test_that("We can use mocks for dbGetQeury", {
      expect_identical(
        dbGetQuery(con, "SELECT * FROM airlines LIMIT 2"),
        data.frame(
          carrier = c("9E", "AA"),
          name = c("Endeavor Air Inc.", "American Airlines Inc."),
          stringsAsFactors = FALSE
        )
      )
    })

    test_that("We can use mocks for dbSendQuery", {
      result <- dbSendQuery(con, "SELECT * FROM airlines LIMIT 2")
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
        dbGetQuery(con, "SELECT * FROM airlines LIMIT 1"),
        data.frame(
          carrier = c("9E"),
          name = c("Endeavor Air Inc."),
          stringsAsFactors = FALSE
        )
      )
    })

    dbDisconnect(con)
  })
})
