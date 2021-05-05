#' Map data values to colours
#'
#' If no `col` is provided, the default image palette is used. The density
#' can be controlled with `n` and the mapping  with the optional
#' `breaks`. If `breaks` is included as well as `n`, `n` is ignored.
#'
#' The function `image_pal()` only returns hex character string colours. The function
#' `image_raster()` will map a raster of numeric values to an RGB 3-layer (channel) raster brick, and
#' `image_stars()` similarly for a 3-dimensional stars object.
#'
#' Please note that the expansion to 3-channels is a fairly wasteful thing to do, the overall data is expanded
#' from a single layer to three but this faciliates a specific task of creating
#' textures for 3D mapping, and this is the only way to do it currently. It's also useful in
#' other situations, for controlling exactly the kind of plots we can achieve and for exporting
#' to image formats such as 'GeoTIFF' or 'PNG'.
#' @param x numeric values, raster object (single layer only) or stars object (single variable, 2D array only)
#' @param col function to generate colours, or a vector of hex colours
#' @param ... ignored
#' @param breaks optionally used to specify colour mapping
#' @param n optionally used to specify density of colours from `col` (ignored if `breaks` is set)
#' @param zlim numeric range to clamp values to an absolute scale (ignored if `breaks` is set)
#' @return for `image_pal()` a vector of hex colours, for `image_raster` and `image_stars` a raster or
#' stars object with 3 channel RGB (range 0,255)
#' @export
#' @aliases image_raster image_stars
#' @export
#' @importFrom grDevices hcl.colors
#' @examples
#' set.seed(28)
#' vals <- sort(rnorm(100))
#' cols <- image_pal(vals, zlim = c(-2.4, 2))
#' plot(vals, col = cols); abline(h = 2)
#' points(vals, pch  = 19, cex = 0.1) ## zlim excluded some of the range
image_pal <- function(x, col, ..., breaks = NULL, n = NULL, zlim = NULL) {

  if (missing(col)) {
    ## just not sure how to use hcl.colors to get a function, so ...
    col <- colorRampPalette(grDevices::hcl.colors(12, "YlOrRd", rev = TRUE))
  }

  if (!is.null(breaks)) n <- length(breaks) - 1L
  if (is.function(col)) {
    if (is.null(n)) {
      n <- 12 ## same as image
    }
    col <- col(n)
  }
 if (!is.null(breaks)) {
    col <- colorRampPalette(col)(length(breaks) - 1)
    outcols <- col[cut(x, breaks)]
  } else {
    if (is.null(zlim)) zlim <- range(x, na.rm = TRUE)
    ## --- logic taken from graphics::image.default 2019-11-07
    z <- (x - zlim[1L])/diff(zlim)
    nc <- length(col)
    zi <- floor((nc - 1e-05) * z + 1e-07)
    zi[zi < 0 | zi >= nc] <- NA
    ## ---
    outcols <- col[zi + 1]
  }
  outcols #* is.na(x)  ## zap the colours as well
}

#' @name image_pal
#' @export
#' @examples
#' if (requireNamespace("raster", quietly = TRUE)) {
#' im <- image_raster(volcano)
#' library(raster)
#' plotRGB(im)
#' \donttest{
#' vv <- unique(quantile(volcano, seq(0, 1, length = 12)))
#' plotRGB(image_raster(volcano, breaks = vv))
#' plotRGB(image_raster(volcano, breaks = vv[-c(4, 6)], col = gray.colors(9)))
#' plotRGB(image_raster(volcano, n = 4))
#' plotRGB(image_raster(volcano, col = grey(seq(0.2, 0.8, by = 0.1))))
#'
#' plotRGB(image_raster(volcano, col = viridis::magma(24)))
#' }
#' }
image_raster <- function(x, col, ..., breaks = NULL, n = NULL, zlim = NULL) {
  if (!requireNamespace("raster", quietly = TRUE)) stop("raster package is required for 'image_raster()'")
  ## for matrix input
  if (is.matrix(x)) {
    x <- raster::setExtent(raster::raster(x), raster::extent(0, ncol(x), 0, nrow(x)))
  }
  vv <- raster::values(x[[1L]])
  outcols <- image_pal(vv, col = col, ..., breaks = breaks, n = n, zlim = zlim)
  ## used to need to give a 3 layer brick to setValues, but one layer is enough it expands by the values given
  raster::setValues(raster::brick(x[[1]]), t(col2rgb(outcols)))
}
#' @name image_pal
#' @export
#' @examples
#' if (!requireNamespace("stars", quietly = TRUE)) {
#' library(stars)
#' x <- st_as_stars(volcano)
#' plot(image_stars(x), rgb = 1:3)
#' \donttest{
#' plot(image_stars(x, col = gray.colors), rgb = 1:3)
#' plot(image_stars(x))
#' plot(image_stars(x, col = rainbow, breaks = c(94, 100, 120, 150, 195)), rgb = 1:3)
#' }
#' }
image_stars <- function(x, col, ..., breaks = NULL, n = NULL, zlim = NULL) {
  if (!requireNamespace("stars", quietly = TRUE)) stop("stars package is required for 'image_stars()'")
  hex <- image_pal(as.vector(unclass(x[[1L]])), col = col, ..., breaks = breaks, n = n, zlim = zlim)  ## we aint proxy yet
  dm <- dim(x[[1L]])
  ## this is not completely proper stars fix-up yet :)
  out <- c(x, x, x, along = 3)
  out[[1L]] <- array(t(col2rgb(hex)), c(dm, 3L))
  out
}
