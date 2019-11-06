#' Raster data to RGB
#'
#' Map a raster of numeric values to an RGB 3-layer raster brick.
#'
#' If no `col` is provided, the default image palette is used. The density
#' can be controlled with `n` and the mapping  with the optional
#' `breaks`. If `breaks` is included as well as `n`, `n` is ignored.
#'
#' Please note that this is fairly wasteful thing to do, the overall data is expanded
#' from a single layer to three - it fills a specific task which is to create
#' textures for 3D mapping, and this is the only way to do it currently. (Plus
#' sometimes it's handy for other reasons, creating PNGs etc.).
#'
#' @param x raster of values (single layer only)
#' @param col function to generate colours, or a vector of hex colours
#' @param ... ignored
#' @param breaks optionally used to specify color mapping
#' @param n optionally used to specify density of colours from `col` (ignored if `breaks` is set)
#' @param zlim numeric range to clamp values to an absolute scale (ignored if `breaks` is set)
#'
#' @return for `image_pal()` a vector of hex colours, for `image_raster` and `image_stars` a raster or stars object with 3 channel RGB (range 0,255)
#' @export
#' @aliases image_raster image_stars
#' @export
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

  ## scales::rescale(x)
  #scl <- function(x) (x - range_x[1L])/diff(range_x)
  if (!is.null(breaks)) {
    col <- colorRampPalette(col)(length(breaks) - 1)
    outcols <- col[cut(x, breaks)]
  } else {
    zlim <- range(x, na.rm = TRUE)

    x[x < zlim[1]] <- NA
    x[x > zlim[2]] <- NA

    outcols <- col[((x - zlim[1L])/diff(zlim)) * (length(col) - 1) + 1]
  }
  outcols
}

#' @name image_pal
#' @export
#' @examples
#' library(raster)
#' im <- image_raster(volcano)
#' if (requireNamespace("raster", quietly = TRUE)) {
#' plotRGB(im)
#' vv <- unique(quantile(volcano, seq(0, 1, length = 12)))
#' plotRGB(image_raster(volcano, breaks = vv))
#' plotRGB(image_raster(volcano, breaks = vv[-c(4, 6)], col = gray.colors(9)))
#' plotRGB(image_raster(volcano, n = 4))
#' plotRGB(image_raster(volcano, col = grey(seq(0.2, 0.8, by = 0.1))))
#'
#' plotRGB(image_raster(volcano, col = viridis::magma(24)))
#' }
image_raster <- function(x, col, ..., breaks = NULL, n = NULL, zlim = range(x[is.finite(x)])) {
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
#' library(stars)
#' x <- st_as_stars(volcano)
#' if (!requireNamespace("stars", quietly = TRUE)) {
#' plot(image_stars(x), rgb = 1:3)
#' plot(image_stars(x, col = gray.colors), rgb = 1:3)
#' plot(image_stars(x))
#' plot(image_stars(x, col = rainbow, breaks = c(94, 100, 120, 150, 195)), rgb = 1:3)
#' }
image_stars <- function(x, col, ..., breaks = NULL, n = NULL, zlim = range(x[is.finite(x)])) {
  if (!requireNamespace("stars", quietly = TRUE)) stop("stars package is required for 'image_stars()'")
  hex <- image_pal(x[[1L]], col = col, ..., breaks = breaks, n = n, zlim = zlim)  ## we aint proxy yet
  dm <- dim(x[[1L]])
  ## this is not completely proper stars fix-up yet :)
  out <- c(x, x, x, along = 3)
  out[[1L]] <- array(t(col2rgb(hex)), c(dm, 3L))
  out
}
