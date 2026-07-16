#' Stretch numeric values to [0, 1]
#'
#' A family of contrast-stretch functions that rescale numeric vectors,
#' matrices, or arrays to the unit interval. These are the data-normalization
#' step that naturally precedes colour mapping with [d_pal()], [image_pal()],
#' or [image_hex()]. Dimensions of the input are preserved, so a stretched
#' matrix can go straight to an image plot.
#'
#' `stretch_linear()` clips to quantile bounds then linearly rescales, this is
#' the workhorse default.
#'
#' `stretch_log()` applies `log1p` after shifting values to be non-negative,
#' then linearly rescales. Useful for data with high dynamic range (e.g.
#' overview-resolution satellite imagery where integer counts span several
#' orders of magnitude).
#'
#' `stretch_sqrt()` applies square-root after shifting, gentler compression
#' than log, a good middle ground.
#'
#' `stretch_histeq()` maps values to their empirical quantile rank, producing
#' an approximately uniform distribution. Good for scenes with detail in both
#' deep shadow and bright areas simultaneously.
#'
#' By default the clip bounds are quantiles of the data itself, so the result
#' is scene-dependent. Use 'lim' to give absolute bounds in data units instead
#' (for example 'lim = c(0, 3000)' for Sentinel-2 surface reflectance), which
#' fixes the mapping so that it is stable across tiles and timesteps (no seams
#' in mosaics, no flicker in animations). When 'lim' is set the quantile
#' arguments are ignored.
#'
#' Values that stretch outside [0, 1] are clamped. Non-finite input values
#' (NA, NaN) are returned as NA; constant input maps to 0.5.
#'
#' For multi-band data (e.g. RGB), apply per-band for maximum per-channel
#' contrast, or pool all bands into one vector for a joint stretch that
#' preserves inter-band luminance relationships.
#'
#' @param x numeric vector, matrix, or array (NA values are preserved)
#' @param low,high quantile probabilities for the clip bounds (default 2nd and
#'   98th percentiles), ignored if 'lim' is set
#' @param lim optional absolute clip bounds in data units, a range like
#'   'c(0, 3000)' (for `stretch_log()` and `stretch_sqrt()` this is given on
#'   the original data scale and transformed internally)
#' @param offset numeric offset added before the log or sqrt transform. If `NULL`
#'   (default), auto-detected so that all values are non-negative.
#' @param n number of bins for histogram equalisation (default 256)
#'
#' @return numeric vector, matrix, or array matching the input, with values in
#'  [0, 1] (NA where input was not finite)
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
#' ## absolute bounds, stable across scenes
#' stretch_linear(c(-100, 0, 1500, 3000, 9000), lim = c(0, 3000))
#'
#' ## feed into colour mapping
#' plot(1:200, col = d_pal(stretch_linear(sort(rnorm(200)))), pch = 19)
stretch_linear <- function(x, low = 0.02, high = 0.98, lim = NULL) {
  dm <- dim(x)
  ok <- is.finite(x)
  if (!any(ok)) return(.stretch_blank(x))
  if (is.null(lim)) {
    lo <- quantile(x[ok], low,  names = FALSE)
    hi <- quantile(x[ok], high, names = FALSE)
  } else {
    lim <- range(lim)
    lo <- lim[1L]
    hi <- lim[2L]
  }
  if (!(hi > lo)) {
    ## constant data (or degenerate bounds) maps to mid scale
    out <- rep(0.5, length(x))
    out[!ok] <- NA_real_
    dim(out) <- dm
    return(out)
  }
  out <- (x - lo) / (hi - lo)
  out[ok & out < 0] <- 0
  out[ok & out > 1] <- 1
  out[!ok] <- NA_real_
  dim(out) <- dm
  out
}

#' @name stretch_linear
#' @export
stretch_log <- function(x, low = 0.02, high = 0.98, offset = NULL, lim = NULL) {
  if (is.null(offset)) {
    mn <- suppressWarnings(min(x[is.finite(x)]))
    offset <- if (is.finite(mn) && mn < 0) -mn else 0
  }
  if (!is.null(lim)) lim <- log1p(range(lim) + offset)
  stretch_linear(log1p(x + offset), low, high, lim = lim)
}

#' @name stretch_linear
#' @export
stretch_sqrt <- function(x, low = 0.02, high = 0.98, offset = NULL, lim = NULL) {
  if (is.null(offset)) {
    mn <- suppressWarnings(min(x[is.finite(x)]))
    offset <- if (is.finite(mn) && mn < 0) -mn else 0
  }
  if (!is.null(lim)) lim <- sqrt(pmax(0, range(lim) + offset))
  stretch_linear(sqrt(x + offset), low, high, lim = lim)
}

#' @name stretch_linear
#' @export
stretch_histeq <- function(x, n = 256) {
  dm <- dim(x)
  ok <- is.finite(x)
  if (!any(ok)) return(.stretch_blank(x))
  breaks <- quantile(x[ok], probs = seq(0, 1, length.out = n + 1), names = FALSE)
  ubreaks <- unique(breaks)
  if (length(ubreaks) < 2L) {
    out <- rep(0.5, length(x))
    out[!ok] <- NA_real_
    dim(out) <- dm
    return(out)
  }
  out <- (findInterval(x, ubreaks) - 1) / (length(ubreaks) - 1)
  out[!ok] <- NA_real_
  dim(out) <- dm
  out
}

## all-missing input: same shape, all NA
.stretch_blank <- function(x) {
  out <- rep(NA_real_, length(x))
  dim(out) <- dim(x)
  out
}
