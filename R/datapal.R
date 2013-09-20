##' Colours for data
##'
##' Data levels and colour palettes
##' @author Michael D. Sumner \email{michael.sumner@@aad.gov.au}
##'
##' Maintainer: Michael D. Sumner \email{michael.sumner@@aad.gov.au}
##'
##' @name datapal
##' @docType package
##' @keywords package
NULL

##' Colours for data
##'
##' Colour palette for data
##' @title Palette builder
##' @param x number of colours to return, or vector of breaks to
##' return colours for
##' @param pal name of the palette to use
##' @param breaks logical, if \code{TRUE} return the breaks values
##' @return colours in hex format, break values if \code{x} is missing
##' and breaks is TRUE, or a list of colours and breaks if
##' @examples
##' cols <- palbuilder(10)
##' @export
palbuilder <- function(x, pal = c("modis", "seaice.de"), breaks = FALSE) {
    pal <- match.arg(pal)
    .pal <- .load_pal(sprintf("%s_pal", pal))
    if (missing(x) & !breaks) stop("x must be supplied if breaks is FALSE")
    if (missing(x) & breaks) return(.pal$breaks)
    if (length(x) == 1L) {
            cl <- colorRampPalette(.pal$col)
            cols <- cl(x)
        } else {
            ind <- findInterval(x, .pal$breaks)
            cols <- .pal$col[ind]
            ## return both
            if (breaks) list(col = cols, breaks = x)
        }
    cols
}

##' Colours for data
##'
##' Named palette functions.
##' \code{modis} and \code{seawifs} are aliases.
##' @title Named palettes
##' @aliases seawifs seaice.de
##' @param x number of colours to return, or vector of breaks to
##' return colours for
##' @param breaks logical, if \code{TRUE} return the breaks values
##' @return colours in hex format, break values if \code{x} is missing
##' and breaks is TRUE, or a list of colours and breaks if
##' @export
modis <- function(x, breaks = FALSE) {
    palbuilder(x = x, pal = "modis", breaks = breaks)
}

##' @rdname modis
##' @export
seawifs <- function(x, breaks = FALSE) {
    palbuilder(x = x, pal = "modis", breaks = breaks)
}

##' @rdname modis
##' @export
seaice.de <- function(x, breaks = FALSE) {
    palbuilder(x = x, pal = "seaice.de", breaks = breaks)
}
.load_pal <- function(x = "modis_pal") {
    switch(x,
           modis_pal = get(x),
           ## this is now messy, since some is code-based
           seaice.de_pal = .seaice.de()
           )

}
.seaice.de <- function() {
    r <- c(0,30,30,34,250,250,250,186,148,120)
    g <- c(139,255,160,34,0,0,0,211,211,90)
    b <- c(0,144,250,139,250,125,0,85,0,0)
    list(col = rgb(r, g, b, maxColorValue = 255),
         breaks = seq(0, 100, length = length(r)))
}
##' Colours and breaks for a chlorophyll-a palette.
##'
##' Palette built by reverse-engineering MODIS-A images. It's actually
##' pretty brken and needs to be fixed.
##' @name modis_pal
##' @docType data
##' @title Chlorophyll-a ocean colour display palette
##' @format A list with vectors \code{col} and \code{breaks}.
##' @keywords data
NULL
