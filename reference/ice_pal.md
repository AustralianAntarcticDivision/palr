# Sea ice colours

Colours for sea ice.

## Usage

``` r
ice_pal(x, palette = FALSE, alpha = 1, ..., amsre = FALSE)

icePal(x, palette = FALSE, alpha = 1, ...)
```

## Arguments

- x:

  a vector of data values or a single num (n)

- palette:

  logical, if `TRUE` return a list with matching colours and values

- alpha:

  value in 0,1 to specify opacity

- ...:

  currently ignored

- amsre:

  use old AMSRE colours (\`FALSE\` by default)

## Value

colours, palette, or function, see Details

## Details

The palette functions operate in 3 modes: 1) n colours - Pal(6) -
returns 6 colours from the palette 2) data - Pal(c(10, 50, 100)) -
return colours for 3 ice concentrations 3) palette - Pal(palette =
TRUE) - return the full palette and breaks

## References

amsre colours derived from 'http://www.iup.uni-bremen.de/seaice/amsr/'.,
nsidc colours extracted in data-raw/.

## Examples

``` r
# \donttest{
if (requireNamespace("raster")) {
nsidcfile <- system.file("extdata", "nt_20140320_f17_v01_s.bin", 
    package = "palr", mustWork = TRUE)
r <- raster::raster(nsidcfile) 
icp <- ice_pal(palette = TRUE)
## The AMSR colours
raster::plot(r, col = icp$col, zlim = range(icp$breaks),
main = sprintf("NSIDC ice %s", format(raster::getZ(r))))
}
#> Loading required namespace: raster

# }
```
