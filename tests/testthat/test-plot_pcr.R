test_that("plot_pcr generates a ggplot object", {
  result <- simulate_pcr(N0 = 10, E = 1.8)
  pcr_data <- result$pcr_data
  Ct <- result$Ct

  plot <- plot_pcr(pcr_data, Ct)

  expect_s3_class(plot, "gg")
  expect_true(inherits(plot, "ggplot"))
})
