## code to prepare `DATASET` dataset goes here
chl <- as.matrix(raadtools::readchla(xylim = c(140, 160, -43, -40), product = "VIIRS"))
#pal <- palr::chl_pal(palette = TRUE)
#ximage::ximage(as.matrix(chl), c( 140, 160, -43, -40), col = pal$cols, breaks = pal$breaks)
#maps::map(add = T)
usethis::use_data(chl, overwrite = TRUE)
