# #https://github.com/AustralianAntarcticDivision/raadtools
#   library(raadtools)
#  # readsst(latest = TRUE)
#   f <- tail(sstfiles(), 1)
#   oisst <- readsst(f$date, xylim = extent(140, 180, -65, -30))
#   metadata(oisst) <- list(ncdump = local({suppressWarnings(r <- raster(f$fullname)); capture.output(print(r))[-1]}),
#  filename = gsub("data/", "", f$file))

## move to data 0.0.6
#devtools::use_data(oisst, compress = "bzip2")

## forget raster/sp so we can pass check

library(raadtools)
oisst <- t(as.matrix(flip(readsst("2016-06-11", xylim = extent(140, 180, -65, -30)), "y")))
usethis::use_data(oisst, compress= "bzip2")
