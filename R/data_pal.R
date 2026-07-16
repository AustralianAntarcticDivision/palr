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
#' @return character string of hex colours
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
  bad <- is.na(x)
  if (length(x[!bad]) < 1) {
    message("no valid values in 'x'")
    return(rep(NA_character_, length(x)))
  }
  if (length(x) == 1) {
    if (is.na(x)) return(NA_character_)
    return(pal[1L])
  }
  if (sum(!bad) == 1) {
    out <- rep(pal[1], length(x))
    out[bad] <- NA
    return(out)
  }
  rg <- range(x, na.rm = TRUE)
  if (!(diff(rg) > 0)) {
    ## constant data maps to the middle of the palette
    out <- rep(pal[ceiling(length(pal) / 2)], length(x))
    out[bad] <- NA_character_
    return(out)
  }
  xx <- (x - rg[1L]) / diff(rg)
  pal[xx * (length(pal) - 1) + 1]
}

#' @name d_pal
#' @export
data_pal <- function(x, pal = hcl.colors(84)) {
  d_pal(x, pal = pal)
}
