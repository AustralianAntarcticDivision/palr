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
##' @param breaks return break values as well as colours?
##' @return colours in hex format and data values
##' @examples
##' cols <- palbuilder(10)
##' @export
palbuilder <- function(x, pal = "chl_standard", breaks = FALSE) {
    .pal <- .load_pal(pal)
    if (length(x) == 1L) {
            cl <- colorRampPalette(.pal$col)
            cols <- cl(x)
        } else {
            ind <- findInterval(x, .pal$breaks)
            cols <- .pal$col[ind]
            ## return both
            if (breaks) return(list(col = cols, breaks = x))
        }
    cols
}

##' @rdname palbuilder
##' @export
palbreaks <- function(pal) {
    .pal <- .load_pal(pal)
    .pal$breaks
}
##' Colours for data
##'
##' Named palette functions.
##' \code{modis} and \code{seawifs} are aliases.
##' @title Named palettes
##' @aliases seawifs
##' @param x number of colours to return, or vector of breaks to
##' return colours for
##' @param breaks logical, if \code{TRUE} return the breaks values
##' @return colours in hex format, break values if \code{x} is missing
##' and breaks is TRUE, or a list of colours and breaks if
##' @export
modis <- function(x, breaks = FALSE) {
    palbuilder(x = x, pal = "modis", breaks = breaks)
}
seawifs <- modis


oceancolor <- function(x, pal = "chla", breaks = FALSE) {
    breakvals <- exp(round(seq(-4.6, 3.4, length = 24), digits = 2))
    cols <- c("#90006F", "#6F0090", "#4E00B0", "#2D00D1", "#0C00F2", "#0024FF",
"#005FFF", "#0099FF", "#00D5FF", "#00FFE6", "#00FF8E", "#00FF37",
"#28FF00", "#7FFF00", "#D7FF00", "#FFE700", "#FFBA00", "#FF8E00",
"#FF6200", "#FF3600", "#FF0A00", "#D60000", "#A00000", "#690000"
)

    if (length(x) == 1L) {
        cl <- colorRampPalette(cols)
        cols <- cl(x)
    } else {
        ind <- findInterval(x, breakvals)
        cols <- cols[ind]
        if (breaks) return(list(col = cols, breaks = x))
    }
    cols
}

## rdname modis
## export
##seaice.de <- function(x, breaks = FALSE) {
##    palbuilder(x = x, pal = "seaice.de", breaks = breaks)
##}
.load_pal <- function(x = "chl_standard") {
    colours[[x]]
}
##.seaice.de <- function() {
##    r <- c(0,30,30,34,250,250,250,186,148,120)
##    g <- c(139,255,160,34,0,0,0,211,211,90)
##    b <- c(0,144,250,139,250,125,0,85,0,0)
##    list(col = rgb(r, g, b, maxColorValue = 255),
##         breaks = seq(0, 100, length = length(r)))
##}

##'
##' Colours and breaks for palettes taken from SEADAS and elsewhere
##'
##' See Examples for how some of these data were collected from a SEADAS (7) installation.
##' @name colours
##' @references \url{http://seadas.gsfc.nasa.gov/}
##' @docType data
##' @title Data values and matching colour display palette
##' @format A list of lists, each consisting of vectors \code{col} and \code{breaks}.
##' @keywords data
##' @examples
##' names(colours)
##'
##' \dontrun{
##' read.cpd <- function(x) {
##'        txt <- readLines(x)
##'        cold <- read.table(text = sapply(strsplit(grep("^color", txt, value = TRUE), "="), "[", 2), sep = ",")
##'        cold$value <- as.numeric(sapply(strsplit(grep("^sample", txt, value = TRUE), "="), "[", 2))
##'        list(breaks = cold$value, col = rgb(cold[,1], cold[,2], cold[, 3], max = 255))
##'}
##'
##'up <- file.path("C:/Users/michae_sum", ".seadas", "beam-ui", "auxdata", "color-palettes")
##'fs <- list.files(up, pattern = "cpd$")
##'
##'seadas.colours <- vector("list", length(fs))
##'names(seadas.colours) <- gsub(".cpd$", "", fs)
##'for (i in seq_along(fs)) {
##'    seadas.colours[[i]] <- read.cpd(file.path(up, fs[i]))
##'}
##' ## save(seadas.colours, file = "seadas.colours.rda")
##' }
NULL


