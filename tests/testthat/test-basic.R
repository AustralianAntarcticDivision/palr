funs <- list(chl_pal, sst_pal, ice_pal, bathy_deep_pal, dirty_pal)
test_that("pal functions work", {
  for (i in seq_along(funs)) {
    expect_type(funs[[i]](10), "character")
    expect_type(funs[[i]](c(1, 5, 10)), "character")
    expect_type(funs[[i]](palette = TRUE), "list")
    expect_type(funs[[i]](), "closure")
  }
})

test_that("out of range values clamp rather than drop", {
  ## values below the first break used to give findInterval() index 0,
  ## silently shortening the output and misaligning colours
  expect_length(sst_pal(c(-50, 10)), 2L)
  expect_length(chl_pal(c(0, 0.5)), 2L)
  expect_length(ice_pal(c(-1, 50)), 2L)
  expect_length(bathy_deep_pal(c(-8000, -1000)), 2L)
  expect_length(dirty_pal(c(-9000, 2000)), 2L)
  ## low values clamp to the first colour, high to the last
  p <- sst_pal(palette = TRUE)
  expect_identical(sst_pal(c(-50, 100)), p$cols[c(1L, length(p$cols))])
  ## missing values stay missing, length preserved
  expect_identical(is.na(sst_pal(c(NA, 10, NA))), c(TRUE, FALSE, TRUE))
})

test_that("times give colours", {
  pal <- mk_timePal(Sys.Date() + 1:10, rainbow(10))
  expect_type(pal(Sys.time()), "character")
})

test_that("colours give hex", {
  expect_true(grepl("^#", col2hex("red")))
})

test_that("image pal", {
  skip_on_cran()
  expect_length(image_pal(1:10), 10)
  expect_type(image_pal(1), "character")

  expect_length(image_pal(1:10, breaks = c(3, 5, 7)), 10)
  expect_type(image_pal(1, breaks = c(3, 5, 7)), "character")

  expect_length(image_pal(1:10, zlim = range(c(3, 5, 7))), 10)
  expect_type(image_pal(1, zlim = range(c(3, 5, 7))), "character")

  expect_length(palr:::.amsrecols(), 256)
  expect_length(palr:::.ace_colmap(), 3)
})

test_that("image raster and stars", {
  skip_on_cran()
  skip_if_not_installed("raster")
  expect_s4_class(image_raster(volcano), "BasicRaster")
  expect_s4_class(image_raster(volcano, , breaks = c(100, 120, 170)), "BasicRaster")
  expect_s4_class(image_raster(volcano, , zlim = c(100, 170)), "BasicRaster")
  skip_if_not_installed("stars")
  expect_s3_class(image_stars(stars::st_as_stars(volcano)), "stars")
  expect_s3_class(image_stars(stars::st_as_stars(volcano), breaks = c(100, 120, 170)), "stars")
  expect_s3_class(image_stars(stars::st_as_stars(volcano), zlim = c(100, 170)), "stars")
})

test_that("timepal works", {
  expect_type(mk_timePal(Sys.time() + rnorm(100), col = heat.colors), "closure")
})

test_that("alpha is applied", {
  expect_true(all(nchar(bathy_deep_pal(1:10, alpha = 0)) == 9))
  expect_true(all(nchar(ice_pal(1:10, alpha = 0)) == 9))
  expect_true(all(nchar(sst_pal(1:10, alpha = 0)) == 9))
  expect_true(all(nchar(chl_pal(1:10, alpha = 0)) == 9))
  expect_true(all(nchar(dirty_pal(1:10, alpha = 0)) == 9))
  ## fully opaque tail
  expect_true(all(grepl("ff$", sst_pal(c(0, 10, 20), alpha = 1))))
})
