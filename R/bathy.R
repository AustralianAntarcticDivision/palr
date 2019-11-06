

#' Bathymetry
#'
#' Deep bathymetry colours.
#'
#' Colour ramp suitable for deep waters (-5500) to sea level.
#' The palette functions operate in 3 modes:
#' 1) n colours - Pal(6) - returns 6 colours from the palette
#' 2) data      - Pal(c(10, 50, 100)) - return colours for 3 ice concentrations
#' 3) palette   - Pal(palette = TRUE) - return the full palette and breaks
#' Derived from maps created in Matlab by Emmanuel Laurenceau.
#' @param x a vector of data values or a single num (n)
#' @param palette logical, if \code{TRUE} return a list with matching colours and values
#' @param alpha value in 0,1 to specify opacity
#' @param ... currently ignored
#' @export
#' @return colours, palette, or function, see Details
#' @examples
#' plot(1:15, pch = 19, cex = 4, col  = bathy_deep_pal(15))
bathy_deep_pal <- function(x, palette = FALSE, alpha = 1, ...) {
  breaks <- c(-5500, seq(-5000, -1000, by = 1000), -500,  0)
  breaks <- seq(-5500, 0, length = 255)
  cols <- colorRampPalette(rgb(c(0, 18, 60, 103, 141, 194, 255), c(0, 18, 60, 111, 163, 216, 255), c(0, 26, 85, 135, 173, 216, 255), maxColorValue = 255))(256)

  hexalpha <- as.hexmode(round(255 * alpha))
  if (nchar(hexalpha) == 1L)
    hexalpha <- paste(rep(hexalpha, 2L), collapse = "")
  cols <- paste0(cols, hexalpha)
  if (palette)
    return(list(breaks = breaks, cols = cols))
  if (missing(x))
    return(colorRampPalette(cols))
  if (length(x) == 1L) {
    return(paste0(colorRampPalette(cols)(x), hexalpha))
  }
  else {
    return(cols[findInterval(x, breaks)])
  }
}

#' @name bathy_deep_pal
#' @export
bathyDeepPal <- function(x, palette = FALSE, alpha = 1, ...) {
 .Deprecated("bathy_deep_pal")
  bathy_deep_pal(x = x, palette = palette, alpha = alpha)
}
