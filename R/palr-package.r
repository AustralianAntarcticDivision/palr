#' palr: colours for data
#'
#' @docType package
#' @name palr
#' @importFrom grDevices col2rgb colorRampPalette rgb
#' @importFrom utils  head

NULL

#' Sea surface temperature (SST).
#'
#' SST example raster data set, at 0.25 degree resolution for global coverage
#' in "longitude180/latitude".
#'
#' Created using script in data-raw/ using `raadtools` package.
#' @references
#' Reynolds, et al.(2007) Daily High-resolution Blended Analyses. Available at
#' ftp://eclipse.ncdc.noaa.gov/pub/OI-daily/daily-sst.pdf.
#' Climatology is based on 1971-2000 OI.v2 SST, Satellite data: Navy  NOAA19
#' METOP AVHRR, Ice data: #' NCEP ice Source: NOAA/National Climatic Data Center.
#'
#' @name oisst
#' @docType data
#' @rdname oisst
#' @examples
#' dim(oisst)
#' class(oisst)
#' image(oisst, useRaster = TRUE)
NULL
