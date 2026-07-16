# Sea surface temperature (SST) and ocean color chlorophyll-a (CHLA).

SST example raster data set, at 0.25 degree resolution for global
coverage in "longitude180/latitude".

## Details

Small sample of 'VIIRS' daily chlorophyll-a 2026-06-15 from near
Tasmania.

Created using script in data-raw/ using \`raadtools\` package.

## References

Reynolds, et al.(2007) Daily High-resolution Blended Analyses. Available
from 'NOAA' search for 'OISST'.

Climatology is based on 1971-2000 OI.v2 SST, Satellite data: Navy NOAA19
METOP AVHRR, Ice data: \#' NCEP ice Source: NOAA/National Climatic Data
Center.

## Examples

``` r
dim(oisst)
#> [1] 160 140
class(oisst)
#> [1] "matrix" "array" 
image(oisst, useRaster = TRUE)

pal <- chl_pal(palette = TRUE)
image(t(chl[nrow(chl):1, ]), col = pal$cols[-1], breaks = pal$breaks)
```
