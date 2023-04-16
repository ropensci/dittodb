test_that("serialize_bit64", {
  # no op if no bit64
  expect_identical(serialize_bit64(mtcars), mtcars)

  if (!requireNamespace("bit64", quietly = TRUE)) {
    new_df <- data.frame(
      int32 = 1:10,
      int64 = bit64::as.integer64(1:10)
    )

    out <- serialize_bit64(new_df)

    expect_identical(out$int32, new_df$int32)
    expect_identical(class(out$int64), "call")
    expect_identical(eval(out$int64), new_df$int64)
  }
})
