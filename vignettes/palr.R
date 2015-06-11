## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "")
library(palr)
library(raster)


## ------------------------------------------------------------------------
library(raster)
library(palr)
data(oisst)
plot(oisst)

## ------------------------------------------------------------------------
sstcols <- sstPal(palette = TRUE)
plot(oisst, col = sstcols$col, zlim = range(sstcols$breaks))

## ------------------------------------------------------------------------
metadata(oisst)$filename
writeLines(metadata(oisst)$ncdump)

