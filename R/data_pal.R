#' Colours for data values
#'
#' Scales input data to the palette, so that colour is mapped linearly to the range of values.
#'
#' Default palette 'pal' is the 'viridis' colours of [grDevices::hcl.colors()], and may be literal colour values
#' or a function.
#'
#' [data_pal()] is an alias of [d_pal()].
#'
#' @param x data vector, maybe be numeric or character
#' @param pal palette, may be colours or a function
#'
#' @export
#' @importFrom grDevices hcl.colors
#' @examples
#' plot(1:100, col = d_pal(1:100))
#' plot(1:100, col = d_pal(1:100, chl_pal))
#'
d_pal <- function(x, pal = hcl.colors(84)) {
  if (is.function(pal)) {
    pal <- pal(84)
  }
  if (is.character(x)) {
    x <- as.integer(factor(x))
  }
  if (is.factor(x)) {
    x <- as.integer(x)
  }
  x <- x[!is.na(x)]
  xx <- (x  - min(x)) / diff(range(x))
  pal[xx * (length(pal) - 1) + 1]
}

#' @name d_pal
#' @export
data_pal <- function(x, pal = hcl.colors(84)) {
  d_pal(x, pal = pal)
}
