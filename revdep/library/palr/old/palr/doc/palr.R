## ---- echo = FALSE, message = FALSE--------------------------------------
##knitr::opts_chunk$set(collapse = TRUE, comment = "")
library(palr)
library(raster)

## ------------------------------------------------------------------------
library(raster)
library(palr)
data(oisst)
plot(oisst)

## ------------------------------------------------------------------------
sstcols <- sst_pal(palette = TRUE)
plot(oisst, col = sstcols$col, zlim = range(sstcols$breaks))

## ------------------------------------------------------------------------
smsst <- focal(aggregate(oisst, fact = 5, fun = mean), matrix(1, 3), fun = median, na.rm = FALSE)
psst <- rasterToPolygons(smsst, na.rm = FALSE)
layout(matrix(1:2, ncol = 2))
plot(oisst, col = sstcols$col, zlim = range(sstcols$breaks))
plot(oisst, col = "transparent", legend = FALSE)## plot twice to get exact alignment
plot(psst, col = sst_pal(psst$layer), add = TRUE)
temps <- rev(c(0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20))
op <- par(xpd = NA); legend("right", legend = temps, fill = sst_pal(temps), inset = -0.2, cex = 0.65)
par(op)

## ----image_pal-----------------------------------------------------------
(col <- image_pal(1:10, breaks = c(0, 4, 8, 9, 10), col = c("black", "green", "red", "blue")))
plot(1:10, col = col, pch = 19)

## ----image---------------------------------------------------------------
image(volcano, zlim = c(130, max(volcano)))
vals <- sort(unique(volcano))
cols <- image_pal(vals, zlim = c(130, max(volcano)))
plot(vals, col = cols); abline(h = 130)

## ----image_raster--------------------------------------------------------
library(raster)
r <- raster(system.file("extdata", "nt_20140320_f17_v01_s.bin", package = "graticule", mustWork = TRUE) )
icp <- ice_pal(palette = TRUE)
## The AMSR colours
plot(r, col = icp$col, zlim = range(icp$breaks))
im <- image_raster(r, col = icp$col, zlim = range(icp$breaks))
plotRGB(im)

print(im)

## ----image_stars---------------------------------------------------------
library(stars)
sm <- image_stars(stars::st_as_stars(r), col = icp$col, zlim = range(icp$breaks))
plot(sm, rgb = 1:3)

print(sm)


## ------------------------------------------------------------------------
metadata(oisst)$filename
writeLines(metadata(oisst)$ncdump)

