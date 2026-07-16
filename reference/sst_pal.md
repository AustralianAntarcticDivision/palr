# SST colours

SST colours

## Usage

``` r
sst_pal(x, palette = FALSE, alpha = 1, ...)

sstPal(x, palette = FALSE, alpha = 1, ...)
```

## Arguments

- x:

  a vector of data values or a single number

- palette:

  logical, if `TRUE` return a list with matching colours and values

- alpha:

  value in 0,1 to specify opacity

- ...:

  currently ignored

## Value

colours, palette, or function, see Details

## References

Derived from a file once found at
'http://oceancolor.gsfc.nasa.gov/DOCS/palette_sst.txt'

## Examples

``` r
data(oisst)
sstcols <- sst_pal(palette = TRUE)
image(oisst, col = sstcols$cols, zlim = range(sstcols$breaks))
```
