context("redactors")


df <- expected <- as.data.frame(nycflights13::flights[1:2,])

test_that("redact year", {
  expected$year <- 2020

  expect_identical(
    redact(df, list(year = function(x) return(2020))),
    expected
  )
})

test_that("redact year", {
  expected$tailnum <- "tail number"

  expect_identical(
    redact(df, list(tailnum = function(x) return("tail number"))),
    expected
  )
})

test_that("standard_redactors", {
  redactors <- standard_redactors(df, c("year", "origin", "distance", "time_hour"))

  expect_length(redactors, 4)
  expect_equal(redactors[["year"]](df), 9L)
  expect_equal(redactors[["origin"]](df), "[redacted]")
  expect_equal(redactors[["distance"]](df), 9)
  expect_equal(redactors[["time_hour"]](df), as.POSIXct("1988-10-11T17:00:00", tz = "EST"))

  expected$year <- 9L
  expected$origin <- "[redacted]"
  expected$distance <- 9
  expected$time_hour <- as.POSIXct("1988-10-11T17:00:00", tz = "EST")

  expect_identical(redact(df, redactors), expected)
  # we can redact_columns directly
  expect_identical(
    redact_columns(df, c("year", "origin", "distance", "time_hour")),
    expected
  )
  # and without case-sensitivity
  expect_identical(
    redact_columns(df, c("YEAR", "ORIGIN", "DISTANCE", "TIME_HOUR")),
    expected
  )
  # and with case-sensitivity
  expect_identical(
    redact_columns(df, c("YEAR", "ORIGIN", "DISTANCE", "TIME_HOUR"), ignore.case = FALSE),
    df
  )
})

