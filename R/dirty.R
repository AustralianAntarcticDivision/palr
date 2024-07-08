## DiRT bathy


.dirty_pal <- function() {
  pal <- structure(list(value = c(1000L, 500L, 0L, -250L, -500L, -750L, 
                                  -1000L, -1500L, -2000L, -2500L, -3000L, -3500L, -4000L, -5000L, 
                                  -6000L, -7000L, -8000L), red = c(207L, 236L, 255L, 229L, 172L, 
                                                                   86L, 8L, 1L, 1L, 1L, 1L, 1L, 30L, 75L, 126L, 126L, 126L), green = c(246L, 
                                                                                                                                       254L, 255L, 192L, 218L, 208L, 198L, 187L, 177L, 152L, 84L, 25L, 
                                                                                                                                       1L, 2L, 2L, 2L, 2L), blue = c(239L, 251L, 255L, 0L, 0L, 0L, 0L, 
                                                                                                                                                                     64L, 127L, 167L, 156L, 146L, 136L, 126L, 118L, 62L, 2L)), class = "data.frame", row.names = c(NA, 
                                                                                                                                                                                                                                                                   -17L))
  pal[nrow(pal):1, ]
}

dirt_bathy_cols <- function(alpha = 1) {
  p <- .dirty_pal()
  list(value = p$value, col = rgb(p$red, p$green, p$blue, alpha, maxColorValue = 255))
}

#' Bathymetry palette, absolute for global use
#'
#' From AAD underway facility. 
#' 
#' @param x numeric value
#' @param alpha 0 to 1 for transparency
#'
#' @return vector of hex colours
#' @export
#'
#' @examples
#' dirty_pal(seq(-8000, 0, length.out = 10))
dirty_pal <- function(x, alpha = 1) {
  pal <- dirt_bathy_cols(alpha * 255)
  #browser()
  ramp_pal(x, pal$col, breaks = pal$value)
}

#' Convert list of raster output to bathymetry palette
#'
#' @param x object returned by vapour package 'gdal_raster_data()'
#' @param alpha 0 to 1 for transparency
#'
#' @return modified x
#' @export
#'
dirty_image <- function(x, alpha = 1) {
  x[[1]] <- dirty_pal(x[[1]], alpha = alpha)
  x
}
