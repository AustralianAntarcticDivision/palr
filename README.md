[![Travis-CI Build Status](https://travis-ci.org/AustralianAntarcticDivision/palr.svg?branch=master)](https://travis-ci.org/AustralianAntarcticDivision/palr)
[![](http://www.r-pkg.org/badges/version/pkgconfig)](http://www.r-pkg.org/pkg/pkgconfig)
[![](http://cranlogs.r-pkg.org/badges/pkgconfig)](http://www.r-pkg.org/pkg/pkgconfig)


palr
========

`palr` provides colour palettes for data, based on some well known remotely sensed data sets for sea ice concentration, sea surface temperature and chlorophyll-a. 

There are three main ways of working with palr palette functions, which have names like `icePal`, `chlPal` and `sstPal` for ice, chlorophyll-a and sst respectively.  

* `icePal(n)` return n colours from the palette
* `icePal(data)` return the right colour for values in `data`
* `icePal(palette = TRUE)` returns the entire palette, with colours `cols` and intervals `breaks`
 
There is a vignette illustrating basic usage, this can be read on CRAN or loaded from within R. 

[palr vignette](http://cran.rstudio.com/web/packages/palr/vignettes/palr.html)

Run this code to load the vignette within R: 

```R
library(palr)
vignette("palr")
```

This repository holds the _current development version_ of the contributed R-package `palr`.

This development version is more recent than the current *release* of `palr` on CRAN.

Users of `palr` are encouraged to report bugs and make feature
requests here (click *Issues* in the menu on the right to start a new bug report or feature request).

Feel free to fork `palr` and make pull requests. 

`palr`  is a companion package to the data  package `raadtools`, but is not tied to it. 

## Installation

Install the current release from CRAN using 

```R
install.packages("palr")
```
The easiest way to install the github version of `palr` is through the `devtools` package:

```R
library(devtools)
install_github("AustralianAntarcticDivision/palr")
```

If you don't have `devtools` installed you should first run

```R
install.packages('devtools')
```
