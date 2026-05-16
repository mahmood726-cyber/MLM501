library(testthat)
library(MLM501)

test_that("calculate_MAFI works with mock data", {
  skip_if_not_installed("metafor")

  # Robust data
  set.seed(123)
  yi_robust <- rnorm(20, mean = 0.5, sd = 0.05)
  vi_robust <- rep(0.01, 20)
  m_robust <- calculate_MAFI(yi_robust, vi_robust, measure = "SMD")

  expect_s3_class(m_robust$MAFI_class, "factor")
  expect_equal(as.character(m_robust$MAFI_class), "Robust")

  # Fragile data (small k)
  yi_fragile <- c(0.1, 0.2, -0.1)
  vi_fragile <- c(0.01, 0.01, 0.01)
  m_fragile <- calculate_MAFI(yi_fragile, vi_fragile, measure = "SMD")

  # Small k should trigger k_penalty and likely be fragile
  expect_true(m_fragile$MAFI > 0.3)
})

test_that("grade_audit returns expected strings", {
  expect_equal(grade_audit(0.1), "No downgrade (Robust)")
  expect_equal(grade_audit(0.2), "Consider no downgrade (Low Fragility)")
  expect_equal(grade_audit(0.4), "Downgrade 1 level (Moderate Fragility)")
  expect_equal(grade_audit(0.6), "Downgrade 1-2 levels (High Fragility)")
  expect_equal(grade_audit(NA), "Insufficient Data")
})
