context("basic palr")

funs <- list(chl_pal, sst_pal, ice_pal, bathy_deep_pal)
test_that("pal functions work", {
  for (i in seq_along(funs)) {
    expect_that(funs[[i]](10), is_a("character"))
    expect_that(funs[[i]](c(1, 5, 10)), is_a("character"))
    expect_that(funs[[i]](palette = TRUE), is_a("list"))
  }
})

test_that("times give colours", {
  pal <- mk_timePal(Sys.Date() + 1:10, rainbow(10))
  expect_that(pal(Sys.time()), is_a("character"))
})

test_that("colours give hex", {
  expect_true(grepl("^#", col2hex("red")))
})

test_that("image pal", {
  skip_on_cran()
  expect_length(image_pal(1:10), 10)
  expect_that(image_pal(1), is_a("character"))
  expect_s4_class(image_raster(volcano), "BasicRaster")
  library(stars)
  expect_s3_class(image_stars(stars::st_as_stars(volcano)), "stars")


  expect_length(image_pal(1:10, breaks = c(3, 5, 7)), 10)
  expect_that(image_pal(1, breaks = c(3, 5, 7)), is_a("character"))
  expect_s4_class(image_raster(volcano, , breaks = c(100, 120, 170)), "BasicRaster")
  expect_s3_class(image_stars(stars::st_as_stars(volcano), breaks = c(100, 120, 170)), "stars")


  expect_length(image_pal(1:10, zlim = range(c(3, 5, 7))), 10)
  expect_that(image_pal(1, zlim = range(c(3, 5, 7))), is_a("character"))
  expect_s4_class(image_raster(volcano, , zlim = c(100,  170)), "BasicRaster")
  expect_s3_class(image_stars(stars::st_as_stars(volcano), zlim = c(100, 170)), "stars")

  expect_length(.amsrecols(), 256)

  expect_length(.ace_colmap(), 3)


})

test_that("timepal works", {
  expect_that(mk_timePal(Sys.time() + rnorm(100), col = heat.colors), is_a("function"))
})

test_that("zero alpha is handled",
          {
            expect_true(all(nchar(bathy_deep_pal(1:10, alpha = 0)) == 9))
            expect_true(all(nchar(ice_pal(1:10, alpha = 0)) == 9))
            expect_true(all(nchar(sst_pal(1:10, alpha = 0)) == 9))
            expect_true(all(nchar(chl_pal(1:10, alpha = 0)) == 9))
          }
          )

test_that("function returned if nothing input",
          {
            expect_that(bathy_deep_pal(), is_a("function"))
            expect_that(ice_pal(), is_a("function"))
            expect_that(sst_pal(), is_a("function"))
            expect_that(chl_pal(), is_a("function"))

          })
test_that("deprecation", {
  expect_warning(sstPal(1))
  expect_warning(icePal(1))
  expect_warning(bathyDeepPal(1))
  expect_warning(chlPal(1))

})
