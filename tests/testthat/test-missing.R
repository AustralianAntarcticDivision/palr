test_that("missing values handled", {
  expect_message(expect_true(is.na(d_pal(NA))))
  expect_equal(d_pal(c(NA, 1)), c(NA, "#4B0055"))
  expect_equal(d_pal(c(NA, 1, 10)), c(NA, "#4B0055", "#FDE333"))
})

test_that("constant data maps to a colour, not NA", {
  cc <- d_pal(c(2, 2, 2))
  expect_true(all(!is.na(cc)))
  expect_length(unique(cc), 1L)
  cc <- d_pal(c(2, NA, 2))
  expect_true(is.na(cc[2]))
  expect_false(anyNA(cc[c(1, 3)]))

  ic <- image_pal(rep(3, 5))
  expect_true(all(!is.na(ic)))
})
