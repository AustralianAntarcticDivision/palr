#' Create a time-index colour map. 
#'
#' @param x date-times
#' @param col colours, can be a function or an actual set of colours
#'
#' @return function of date-time
#' @export
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

