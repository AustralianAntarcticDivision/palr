
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Linux Build Status](https://travis-ci.org/AustralianAntarcticDivision/palr.svg?branch=master)](https://travis-ci.org/AustralianAntarcticDivision/palr) [![Windows Build Status](https://ci.appveyor.com/api/projects/status/github/AustralianAntarcticDivision/palr?branch=master&svg=true)](https://ci.appveyor.com/project/mdsumner/palr) [![](http://www.r-pkg.org/badges/version/palr)](http://www.r-pkg.org/pkg/palr) [![CRAN RStudio mirror downloads](http://cranlogs.r-pkg.org/badges/palr)](http://www.r-pkg.org/pkg/palr) [![Coverage Status](https://img.shields.io/codecov/c/github/AustralianAntarcticDivision/palr/master.svg)](https://codecov.io/github/AustralianAntarcticDivision/palr?branch=master)

palr
====

`palr` provides colour palettes for data, based on some well known remotely sensed data sets for sea ice concentration, sea surface temperature and chlorophyll-a.

There are four main ways of working with palr palette functions, which have names like `icePal`, `chlPal` and `sstPal` for ice, chlorophyll-a and sst respectively and `mk_timePal` for creating a time-mapped palette function.

-   `icePal(n)` return n colours from the palette
-   `icePal(data)` return the right colour for values in `data`
-   `icePal(palette = TRUE)` returns the entire palette, with colours `cols` and intervals `breaks`
-   `tfun <- mk_timePal(datetimes, pal); plot(x, tfun(dt))` match date-times to a palette, or palette function.

There is a vignette illustrating basic usage, this can be read on CRAN or loaded from within R.

[palr vignette](https://cloud.r-project.org/web/packages/palr/vignettes/palr.html)

Run this code to load the vignette within R:

``` r
library(palr)
vignette("palr")
```

This repository holds the *current development version* of the contributed R-package `palr`.

This development version is more recent than the current *release* of `palr` on CRAN.

Users of `palr` are encouraged to report bugs and make feature requests here (click *Issues* in the menu on the right to start a new bug report or feature request).

Feel free to fork `palr` and make pull requests.

`palr` is a companion package to the data package `raadtools`, but is not tied to it.

Installation
------------

Install the current release from CRAN using

``` r
install.packages("palr")
```

The easiest way to install the github version of `palr` is through the `devtools` package:

``` r
library(devtools)
install_github("AustralianAntarcticDivision/palr")
```

If you don't have `devtools` installed you should first run

``` r
install.packages('devtools')
```
