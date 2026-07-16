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

test_that("stretch functions preserve matrix dimensions", {
  m <- matrix(rnorm(24), 4)
  expect_identical(dim(stretch_linear(m)), dim(m))
  expect_identical(dim(stretch_log(m)), dim(m))
  expect_identical(dim(stretch_sqrt(m)), dim(m))
  expect_identical(dim(stretch_histeq(m)), dim(m))
})

test_that("stretch_histeq anchors to 0 and 1", {
  x <- rexp(1000)
  s <- stretch_histeq(x)
  expect_equal(min(s), 0)
  expect_equal(max(s), 1)
})

test_that("constant input maps to 0.5, missing preserved", {
  x <- c(5, 5, NA, 5)
  expect_equal(stretch_linear(x), c(0.5, 0.5, NA, 0.5))
  expect_equal(stretch_log(x), c(0.5, 0.5, NA, 0.5))
  expect_equal(stretch_sqrt(x), c(0.5, 0.5, NA, 0.5))
  expect_equal(stretch_histeq(x), c(0.5, 0.5, NA, 0.5))
})

test_that("all-missing input returns all NA with shape preserved", {
  m <- matrix(NA_real_, 3, 2)
  for (f in list(stretch_linear, stretch_log, stretch_sqrt, stretch_histeq)) {
    s <- f(m)
    expect_identical(dim(s), dim(m))
    expect_true(all(is.na(s)))
  }
})

test_that("absolute lim bounds give scene-independent results", {
  a <- c(0, 1500, 3000)
  b <- c(500, 1500, 9000)
  sa <- stretch_linear(a, lim = c(0, 3000))
  sb <- stretch_linear(b, lim = c(0, 3000))
  ## the shared value maps identically in both scenes
  expect_equal(sa[2], sb[2])
  expect_equal(sa, c(0, 0.5, 1))
  ## values outside lim clamp
  expect_equal(stretch_linear(c(-100, 5000), lim = c(0, 3000)), c(0, 1))
  ## lim on the data scale for the transformed stretches
  expect_equal(stretch_log(c(0, 3000), lim = c(0, 3000)), c(0, 1))
  expect_equal(stretch_sqrt(c(0, 3000), lim = c(0, 3000)), c(0, 1))
})

test_that("stretch_log auto offset shifts minimum to zero", {
  x <- c(-10, 0, 10)
  expect_equal(stretch_log(x)[1], 0)
  ## non-negative data is not shifted
  expect_equal(stretch_log(c(0, 1, 10), offset = NULL),
               stretch_log(c(0, 1, 10), offset = 0))
})
