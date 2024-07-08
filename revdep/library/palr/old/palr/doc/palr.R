## ---- echo = FALSE, message = FALSE-------------------------------------------
##knitr::opts_chunk$set(collapse = TRUE, comment = "")
library(palr)

## -----------------------------------------------------------------------------
library(palr)
data(oisst)
image(oisst)

## -----------------------------------------------------------------------------
sstcols <- sst_pal(palette = TRUE)
image(oisst, col = sstcols$col, zlim = range(sstcols$breaks))

## ----image_pal----------------------------------------------------------------
(col <- image_pal(1:10, breaks = c(0, 4, 8, 9, 10), col = c("black", "green", "red", "blue")))
plot(1:10, col = col, pch = 19)

## ----image--------------------------------------------------------------------
image(volcano, zlim = c(130, max(volcano)))
vals <- sort(unique(volcano))
cols <- image_pal(vals, zlim = c(130, max(volcano)))
plot(vals, col = cols); abline(h = 130)

