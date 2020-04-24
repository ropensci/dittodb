context("redactors")


df <- expected <- as.data.frame(nycflights13::flights[1:2, ])

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
  redacted_cols <- c("year", "origin", "distance", "time_hour")
  redactors <- standard_redactors(df, redacted_cols)

  expect_length(redactors, 4)
  expect_equal(redactors[["year"]](df[["year"]]), rep(9L, 2))
  expect_equal(redactors[["origin"]](df[["origin"]]), rep("[redacted]", 2))
  expect_equal(redactors[["distance"]](df[["distance"]]), rep(9, 2))
  expect_equal(
    redactors[["time_hour"]](df[["time_hour"]]),
    rep(as.POSIXct("1988-10-11T17:00:00", tz = "America/New_York"), 2)
  )

  expected$year <- 9L
  expected$origin <- "[redacted]"
  expected$distance <- 9
  expected$time_hour <- as.POSIXct(
    "1988-10-11T17:00:00",
    tz = "America/New_York"
  )

  expect_identical(redact(df, redactors), expected)
  # we can redact_columns directly
  expect_identical(
    redact_columns(df, redacted_cols),
    expected
  )
  # and without case-sensitivity
  expect_identical(
    redact_columns(df, c("YEAR", "ORIGIN", "DISTANCE", "TIME_HOUR")),
    expected
  )
  # and with case-sensitivity
  expect_identical(
    redact_columns(
      df,
      c("YEAR", "ORIGIN", "DISTANCE", "TIME_HOUR"),
      ignore.case = FALSE
    ),
    df
  )
})

test_that("redact_columns when the same name appears more than once", {
  df <- data.frame(name = c(1, 2), other_name = c(3, 4))

  out <- redact_columns(df, "name")
  expect_identical(out$name, c(9, 9))
  expect_identical(out$other_name, c(3, 4))

  out <- redact_columns(df, ".*name")
  expect_identical(out$name, c(9, 9))
  expect_identical(out$other_name, c(9, 9))
})



test_that("standard redactors, empty df", {
  empty_df <- df[0, ]

  # there is no change when there are no rows
  expect_identical(
    redact_columns(empty_df, c("year", "origin", "distance", "time_hour")),
    empty_df
  )
})
