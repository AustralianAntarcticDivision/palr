 r <- terra::rast("/vsicurl/https://noaadata.apps.nsidc.org/NOAA/G02135/south/daily/geotiff/2023/10_Oct/S_20231030_concentration_v3.0.tif")
.nsidc_coltab <- terra::coltab(r) [[1]][1:1001, ]

.nsidc_colours <- rgb(.nsidc_coltab[["red"]], .nsidc_coltab[["green"]], .nsidc_coltab[["blue"]], maxColorValue = 255)
usethis::use_data(.nsidc_colours, internal = TRUE)
