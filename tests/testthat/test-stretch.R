test_that("stretch_linear returns [0,1]", {
  x <- rnorm(500)
  s <- stretch_linear(x)
  expect_true(all(s >= 0 & s <= 1, na.rm = TRUE))
  expect_length(s, length(x))
})

test_that("stretch_linear preserves NA", {
  x <- c(1, NA, 3, NA, 5)
  s <- stretch_linear(x)
  expect_true(is.na(s[2]))
  expect_true(is.na(s[4]))
  expect_false(any(is.na(s[c(1, 3, 5)])))
})

test_that("stretch_linear clips to quantile bounds", {
  set.seed(42)
  x <- rnorm(1000)
  s <- stretch_linear(x, low = 0.1, high = 0.9)
  ## values beyond the 10th/90th percentile should be clamped to 0 or 1
  expect_true(sum(s == 0) > 0)
  expect_true(sum(s == 1) > 0)
})

test_that("stretch_log returns [0,1]", {
  x <- rexp(500)
  s <- stretch_log(x)
  expect_true(all(s >= 0 & s <= 1, na.rm = TRUE))
})

test_that("stretch_log handles negative values", {
  x <- c(-10, -5, 0, 5, 10)
  s <- stretch_log(x)
  expect_true(all(is.finite(s)))
  expect_true(all(s >= 0 & s <= 1))
})

test_that("stretch_log handles explicit offset", {
  x <- 1:100
  s <- stretch_log(x, offset = 0)
  expect_true(all(s >= 0 & s <= 1))
})

test_that("stretch_sqrt returns [0,1]", {
  x <- rnorm(500)
  s <- stretch_sqrt(x)
  expect_true(all(s >= 0 & s <= 1, na.rm = TRUE))
})

test_that("stretch_sqrt handles negative values", {
  x <- c(-10, -5, 0, 5, 10)
  s <- stretch_sqrt(x)
  expect_true(all(is.finite(s)))
})

test_that("stretch_histeq returns [0,1]", {
  x <- rnorm(500)
  s <- stretch_histeq(x)
  expect_true(all(s >= 0 & s <= 1, na.rm = TRUE))
})

test_that("stretch_histeq produces roughly uniform output", {
  set.seed(1)
  x <- rexp(5000)
  s <- stretch_histeq(x)
  ## quartiles of output should be roughly 0.25, 0.5, 0.75
  qs <- quantile(s, c(0.25, 0.5, 0.75), na.rm = TRUE)
  expect_true(abs(qs[1] - 0.25) < 0.05)
  expect_true(abs(qs[2] - 0.5) < 0.05)
  expect_true(abs(qs[3] - 0.75) < 0.05)
})

test_that("stretch_histeq preserves NA", {
  x <- c(1, NA, 3, NA, 5)
  s <- stretch_histeq(x)
  expect_true(is.na(s[2]))
  expect_true(is.na(s[4]))
})

test_that("stretch functions work with all-same values", {
  x <- rep(5, 10)
  ## linear: lo == hi, division by zero → NaN, which is acceptable

  ## but let's document behaviour
  s_log <- stretch_log(x)
  s_sqrt <- stretch_sqrt(x)
  ## histeq should handle gracefully
  s_histeq <- stretch_histeq(x)
  expect_length(s_log, 10)
  expect_length(s_sqrt, 10)
  expect_length(s_histeq, 10)
})

test_that("stretch output feeds into d_pal", {
  x <- rnorm(100)
  cols <- d_pal(stretch_linear(x))
  expect_true(all(grepl("^#", cols[!is.na(cols)])))
})

test_that("stretch output feeds into image_pal", {
  x <- rnorm(100)
  cols <- image_pal(stretch_linear(x))
  expect_true(all(grepl("^#", cols[!is.na(cols)])))
})
