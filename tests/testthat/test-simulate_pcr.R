test_that("simulate_pcr returns correct structure", {
  result <- simulate_pcr(N0 = 10, E = 1.8)
  expect_type(result, "list")
  expect_true("pcr_data" %in% names(result))
  expect_true("Ct" %in% names(result))
  expect_s3_class(result$pcr_data, "data.frame")
  expect_type(result$Ct, "double")
  expect_true(length(result$Ct) == 1)
})





