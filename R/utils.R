.datetimeFrom <- function(x) {
  as.POSIXct(x, tz = "UTC")
}
#' @importFrom stats approxfun
ramp_pal <- function(x, col, breaks = sort(unique(x))) {
  ul <- length(unique(x))
  breaks <- approxfun(seq_along(breaks), breaks)(seq(1, length(breaks), length.out = ul))

  #browser()
  set0_to1 <- function(x) {x[x < 1] <- 1; x}
  colorRampPalette(col, alpha = TRUE)(ul)[set0_to1(findInterval(x, breaks))]
}