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

## densify a set of anchor breaks/colours to a fixed resolution, preserving
## the (irregular) spacing of the anchors, independent of the input data
#' @importFrom stats approx
.densify_pal <- function(value, col, n = 256) {
  list(breaks = approx(seq_along(value), value, n = n)$y,
       cols = colorRampPalette(col)(n))
}

#' Bathymetry palette, absolute for global use
#'
#' From AAD underway facility (DiRT).
#'
#' The palette functions operate in 3 modes:
#' 1) n colours - Pal(6) - returns 6 colours from the palette
#' 2) data      - Pal(c(-4000, -2000, 100)) - return colours for 3 elevations
#' 3) palette   - Pal(palette = TRUE) - return the full palette and breaks
#'
#' The palette spans -8000 to 1000 metres, values outside that range clamp to
#' the end colours.
#' @param x a vector of data values or a single num (n)
#' @param palette logical, if \code{TRUE} return a list with matching colours and values
#' @param alpha 0 to 1 for transparency
#'
#' @return colours, palette, or function, see Details
#' @export
#'
#' @examples
#' dirty_pal(seq(-8000, 0, length.out = 10))
dirty_pal <- function(x, palette = FALSE, alpha = 1) {
  p <- .dirty_pal()
  d <- .densify_pal(p$value, rgb(p$red, p$green, p$blue, maxColorValue = 255))
  abs_pal(x, palette = palette, alpha = alpha, breaks = d$breaks, cols = d$cols)
}

dirty_image <- function(x, alpha = 1) {
  x[[1]] <- dirty_pal(x[[1]], alpha = alpha)
  x
}
