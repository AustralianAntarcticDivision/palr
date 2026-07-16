# Ocean colour colours for chlorophyll-a.

Ocean colour palette for chlorophyll-a.

## Usage

``` r
chl_pal(x, palette = FALSE, alpha = 1)

chlPal(x, palette = FALSE, alpha = 1, ...)
```

## Arguments

- x:

  a vector of data values or a single number

- palette:

  logical, if `TRUE` return a list with matching colours and values

- alpha:

  value in 0,1 to specify opacity

- ...:

  currently unused

## Value

colours, palette, or function, see Details

## Details

Flexible control of the chlorophyll-a palette. If `x` is a single
number, the function returns that many colours evenly spaced from the
palette. If `x` is a vector of multiple values the palette is queried
for colours matching those values, and these are returned. If `x` is
missing and `palette` is `FALSE` then a function is returned that will
generate n evenly spaced colours from the palette, as per
[`colorRampPalette`](https://rdrr.io/r/grDevices/colorRamp.html).

## References

Derived from a file once found at
'http://oceancolor.gsfc.nasa.gov/DOCS/palette_chl_etc.txt'

## Examples

``` r
## just get a small number of evenly space colours
plot(1:10, col = chl_pal(10))

## store the full palette and work with values and colours
pal <- chl_pal(palette = TRUE)
## the standard full palette
image(chl, breaks = pal$breaks, col = pal$cols[-1])
```
