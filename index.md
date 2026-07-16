# palr

`palr` provides colour palettes for data, based on some well known
remotely sensed data sets for sea ice concentration, sea surface
temperature and chlorophyll-a. It includes function
[`image_pal()`](https://australianantarcticdivision.github.io/palr/reference/image_pal.md)
to create the data used by the
[`image()`](https://rdrr.io/r/graphics/image.html) function *as
colours*.

There are five main ways of working with palr palette functions, which
have names like
[`ice_pal()`](https://australianantarcticdivision.github.io/palr/reference/ice_pal.md),
[`chl_pal()`](https://australianantarcticdivision.github.io/palr/reference/chl_pal.md)
and
[`sst_pal()`](https://australianantarcticdivision.github.io/palr/reference/sst_pal.md)
for ice, chlorophyll-a and sst respectively and `mk_timePal` for
creating a time-mapped palette function.

- `ice_pal(n)` return n colours from the palette
- `ice_pal(data)` return the right colour for values in `data`
- `ice_pal(palette = TRUE)` returns the entire palette, with colours
  `cols` and intervals `breaks`
- `tfun <- mk_timePal(datetimes, pal); plot(x, tfun(dt))` match
  date-times to a palette, or palette function.
- `image_pal(data, col = colors, breaks = breaks)` emulates the
  behaviour of [`image()`](https://rdrr.io/r/graphics/image.html) but
  return colours as data rather than draw a plot
- `d_pal(data)` returns a colour for a set of values

See the website for documentation:
<https://australianantarcticdivision.github.io/palr/>

## Installation

Install the current release from CRAN using

``` r

install.packages("palr")
```

To install the development version:

``` r

library(devtools)
install_github("AustralianAntarcticDivision/palr")
```

------------------------------------------------------------------------

Please note that the palr project is released with a [Contributor Code
of
Conduct](https://github.com/AustralianAntarcticDivision/palr/blob/master/CODE_OF_CONDUCT.md).
By contributing to this project, you agree to abide by its terms.
