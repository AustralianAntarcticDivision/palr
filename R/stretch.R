#' Stretch numeric values to [0, 1]
#'
#' A family of contrast-stretch functions that rescale numeric vectors to the
#' unit interval. These are the data-normalization step that naturally precedes
#' colour mapping with [d_pal()] or [image_pal()].
#'
#' `stretch_linear()` clips to quantile bounds then linearly rescales — the
#' workhorse default.
#'
#' `stretch_log()` applies `log1p` after shifting values to be non-negative,
#' then linearly rescales. Useful for data with high dynamic range (e.g.
#' overview-resolution satellite imagery where integer counts span several
#' orders of magnitude).
#'
#' `stretch_sqrt()` applies square-root after shifting — gentler compression
#' than log, a good middle ground.
#'
#' `stretch_histeq()` maps values to their empirical quantile rank, producing
#' an approximately uniform distribution. Good for scenes with detail in both
#' deep shadow and bright areas simultaneously.
#'
#' For multi-band data (e.g. RGB), apply per-band for maximum per-channel
#' contrast, or pool all bands into one vector for a joint stretch that
#' preserves inter-band luminance relationships.
#'
#' @param x numeric vector (NA values are preserved)
#' @param low,high quantile probabilities for the clip bounds (default 2nd and
#'   98th percentiles)
#' @param offset numeric offset added before log transform. If `NULL`
#'   (default), auto-detected to ensure all values are positive.
#' @param n number of bins for histogram equalisation (default 256)
#'
#' @return numeric vector with values in [0, 1] (NA where input was NA)
#' @references  worked examples here \href{https://mdsumner.github.io/gdal-r-python/sentinel2_stretch.html}{sentinel2_stretch}
#' @importFrom stats quantile
#' @name stretch_linear
#' @export
#' @examples
#' x <- sort(rnorm(200))
#' plot(x, stretch_linear(x), pch = ".")
#' plot(x, stretch_sqrt(x), pch = ".")
#'
#' ## high dynamic range data benefits from log stretch
#' x <- c(rexp(500, 0.01), rexp(500, 1))
#' plot(x, stretch_linear(x), pch = ".", main = "linear")
#' plot(x, stretch_log(x), pch = ".", main = "log")
#'
#' ## histogram equalisation
#' plot(x, stretch_histeq(x), pch = ".", main = "histeq")
#'
#' ## feed into colour mapping
#' plot(1:200, col = d_pal(stretch_linear(sort(rnorm(200)))), pch = 19)
stretch_linear <- function(x, low = 0.02, high = 0.98) {
  lo <- quantile(x, low,  na.rm = TRUE)
  hi <- quantile(x, high, na.rm = TRUE)
  out <- (x - lo) / (hi - lo)
  out[!is.na(out) & out < 0] <- 0
  out[!is.na(out) & out > 1] <- 1
  out
}

#' @name stretch_linear
#' @export
stretch_log <- function(x, low = 0.02, high = 0.98, offset = NULL) {
  if (is.null(offset)) {
    mn <- min(x, na.rm = TRUE)
    offset <- if (mn <= 0) abs(mn) + 1 else 0
  }
  stretch_linear(log1p(x + offset), low, high)
}

#' @name stretch_linear
#' @export
stretch_sqrt <- function(x, low = 0.02, high = 0.98) {
  mn <- min(x, na.rm = TRUE)
  offset <- if (mn < 0) abs(mn) else 0
  stretch_linear(sqrt(x + offset), low, high)
}

#' @name stretch_linear
#' @export
stretch_histeq <- function(x, n = 256) {
  breaks <- quantile(x, probs = seq(0, 1, length.out = n + 1), na.rm = TRUE)
  ubreaks <- unique(breaks)
  findInterval(x, ubreaks) / length(ubreaks)
}


