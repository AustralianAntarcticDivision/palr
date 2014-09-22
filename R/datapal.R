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


oceancolor_temperature <- function(x, pal = "temp", breaks = FALSE) {

    breakvals <- seq(-2, 44, length = 255)
    cols <- c("#5B0A76", "#3707EF", "#0808C6", "#081682", "#08636F", "#087C9E",
"#08B0B0", "#08DCDC", "#08ECD7", "#08DB72", "#08B25B", "#08854D",
"#2F9708", "#5DC808", "#B3E308", "#E0CD08", "#E08308", "#DF3708",
"#B90808", "#6C0808", "#7E3030", "#915555", "#A47C7C", "#B7A3A3",
"#CCCCCC")

    cols <- c("#5B0A76", "#63088B", "#7007AB", "#7C07CA", "#8107DF", "#7F07EA",
"#7707EE", "#6D07EE", "#6307EF", "#5707EF", "#4807EF", "#3507EE",
"#2108ED", "#1108EB", "#0A08E8", "#0808E3", "#0808DF", "#0808DC",
"#0808D8", "#0808D3", "#0808CE", "#0808C8", "#0808C3", "#0808BE",
"#0808B8", "#0808B2", "#0808AC", "#0808A5", "#08089E", "#080898",
"#080B92", "#08108A", "#081781", "#081E78", "#082671", "#082E6C",
"#083669", "#083E68", "#084668", "#084E68", "#08566A", "#085D6B",
"#08626D", "#086370", "#086272", "#086175", "#08617A", "#086283",
"#08658B", "#086893", "#086C98", "#08719B", "#08769D", "#087B9E",
"#08809F", "#08859F", "#0888A0", "#088CA2", "#0891A3", "#0896A5",
"#089CA6", "#08A1A7", "#08A6A9", "#08ACAC", "#08B1B1", "#08B6B6",
"#08BBBB", "#08C0C0", "#08C5C5", "#08C8C8", "#08CCCC", "#08D1D1",
"#08D5D5", "#08D8D8", "#08DBDB", "#08DEDE", "#08E1E1", "#08E3E3",
"#08E6E6", "#08E9E9", "#08EBEB", "#08EDEB", "#08EEE9", "#08EEE4",
"#08EEDE", "#08ECD7", "#08EBD0", "#08E9C8", "#08E8BE", "#08E7B0",
"#08E6A0", "#08E491", "#08E383", "#08E17A", "#08DF73", "#08DD72",
"#08DA72", "#08D773", "#08D475", "#08D076", "#08CB76", "#08C675",
"#08C173", "#08BE71", "#08B96D", "#08B667", "#08B35F", "#08B057",
"#08AD52", "#08AA50", "#08A650", "#08A150", "#089B50", "#08964F",
"#08914F", "#088C4F", "#08884E", "#08854C", "#088448", "#088742",
"#088A3B", "#088C34", "#088B2A", "#088A1E", "#0B8A13", "#128B0B",
"#1E8F08", "#299408", "#319908", "#359E08", "#38A308", "#3AA908",
"#3EAE08", "#43B308", "#48B808", "#4DBD08", "#52C208", "#57C508",
"#5CC808", "#62CA08", "#6ACD08", "#71CF08", "#79D208", "#81D408",
"#89D708", "#92DA08", "#9BDC08", "#A4DF08", "#ADE208", "#B7E408",
"#BFE508", "#C7E608", "#D1E608", "#DAE508", "#E0E308", "#E1E108",
"#E0DE08", "#E0DB08", "#E0D508", "#E0CF08", "#E0C908", "#E0C208",
"#E0BC08", "#E0B608", "#E0B108", "#E0AA08", "#E0A208", "#E09B08",
"#E09308", "#E08B08", "#E08308", "#E07B08", "#E07308", "#E06B08",
"#E06308", "#E05C08", "#E05608", "#E05108", "#DF4A08", "#DF4308",
"#DF3B08", "#DE3308", "#DD2A08", "#DC2108", "#D91808", "#D61008",
"#D30A08", "#CE0808", "#CA0808", "#C60808", "#C10808", "#BB0808",
"#B30808", "#AB0808", "#A30808", "#9B0808", "#930808", "#8B0808",
"#830808", "#7C0808", "#760808", "#710808", "#6C0808", "#690909",
"#6D0E0E", "#701313", "#721717", "#731B1B", "#761F1E", "#772222",
"#792626", "#7B2929", "#7D2D2D", "#7F3131", "#803435", "#813737",
"#833B3B", "#853F3E", "#874242", "#894645", "#8B4A49", "#8D4E4D",
"#8E5151", "#905454", "#925859", "#945C5C", "#956060", "#976363",
"#996767", "#9B6A6B", "#9D6F6E", "#9F7272", "#A17676", "#A37A7A",
"#A47D7D", "#A78181", "#A88585", "#A98988", "#AC8C8C", "#AE9090",
"#AF9494", "#B19898", "#B49B9B", "#B59E9E", "#B6A2A2", "#B8A6A6",
"#BBA9AA", "#BDADAD", "#BEB1B1", "#C0B5B5", "#C2B8B8", "#C4BCBC",
"#C6BFC0", "#C7C4C4", "#C9C7C8", "#CCCCCC")



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


