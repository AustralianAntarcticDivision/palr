#' Create a time-index colour map. 
#'
#' @param x date-times
#' @param col colours, can be a function or an actual set of colours
#'
#' @return function of date-time
#' @export
#' @examples 
#' library(trip)
#' library(adehabitatLT)
#' tr <- as.data.frame(as.trip(albatross))
#' trs <- split(tr, tr$id)
#' palfun <- mk_timePal(tr$date, colorRampPalette(c("red", "blue")))
#' plot(tr$x, tr$y, pch = ".")
#' for (i in seq_along(trs)) {
#'   for (j in seq(nrow(trs[[i]]))[-1]) {
#'     lines(trs[[i]][(j-1):j, c("x", "y")], col = palfun(trs[[i]]$date[j]))
#'   }
#' }
mk_timePal <- function(x, col) {
  
  timerange <- range(.datetimeFrom(x))
  
  if (is.function(col)) {
    cols <- col(256)
  } else {
    cols <- col
  }
  timemap <- seq(timerange[1], timerange[2], length = length(cols) + 1)
  function(x) {
    cols[findInterval(.datetimeFrom(x), timemap)]
  }
}

