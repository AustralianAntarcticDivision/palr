

test_that("missing values handled", {
  expect_true(  is.na(d_pal(NA))) %>% expect_message()
  expect_equal(d_pal(c(NA, 1)), c(NA,        "#4B0055"))
  expect_equal(d_pal(c(NA, 1, 10)), c(NA,        "#4B0055", "#FDE333"))

})
