# Bathymetry

Deep bathymetry colours.

## Usage

``` r
bathy_deep_pal(x, palette = FALSE, alpha = 1, ...)

bathyDeepPal(x, palette = FALSE, alpha = 1, ...)
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

## Value

colours, palette, or function, see Details

## Details

Colour ramp suitable for deep waters (-5500) to sea level. The palette
functions operate in 3 modes: 1) n colours - Pal(6) - returns 6 colours
from the palette 2) data - Pal(c(-4000, -2000, -100)) - return colours
for 3 depths 3) palette - Pal(palette = TRUE) - return the full palette
and breaks Derived from maps created in Matlab by Emmanuel Laurenceau.

## Examples

``` r
plot(1:15, pch = 19, cex = 4, col  = bathy_deep_pal(15))
```
