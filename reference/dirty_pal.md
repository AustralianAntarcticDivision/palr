# Bathymetry palette, absolute for global use

From AAD underway facility (DiRT).

## Usage

``` r
dirty_pal(x, palette = FALSE, alpha = 1)
```

## Arguments

- x:

  a vector of data values or a single num (n)

- palette:

  logical, if `TRUE` return a list with matching colours and values

- alpha:

  0 to 1 for transparency

## Value

colours, palette, or function, see Details

## Details

The palette functions operate in 3 modes: 1) n colours - Pal(6) -
returns 6 colours from the palette 2) data - Pal(c(-4000, -2000, 100)) -
return colours for 3 elevations 3) palette - Pal(palette = TRUE) -
return the full palette and breaks

The palette spans -8000 to 1000 metres, values outside that range clamp
to the end colours.

## Examples

``` r
dirty_pal(seq(-8000, 0, length.out = 10))
#>  [1] "#7E0202ff" "#7E0236ff" "#7E0268ff" "#5D027Bff" "#330183ff" "#051490ff"
#>  [7] "#0180A3ff" "#01B565ff" "#28CA00ff" "#FEFEFDff"
```
