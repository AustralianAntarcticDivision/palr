# Package index

## Absolute palettes

Colour palettes matched to real data values on a fixed scale, for sea
surface temperature, chlorophyll-a, sea ice concentration, and
bathymetry. Each works in three modes, n colours with pal(n), colours
for data values with pal(data), and the full palette with pal(palette =
TRUE).

- [`sst_pal()`](https://australianantarcticdivision.github.io/palr/reference/sst_pal.md)
  [`sstPal()`](https://australianantarcticdivision.github.io/palr/reference/sst_pal.md)
  : SST colours
- [`chl_pal()`](https://australianantarcticdivision.github.io/palr/reference/chl_pal.md)
  [`chlPal()`](https://australianantarcticdivision.github.io/palr/reference/chl_pal.md)
  : Ocean colour colours for chlorophyll-a.
- [`ice_pal()`](https://australianantarcticdivision.github.io/palr/reference/ice_pal.md)
  [`icePal()`](https://australianantarcticdivision.github.io/palr/reference/ice_pal.md)
  : Sea ice colours
- [`bathy_deep_pal()`](https://australianantarcticdivision.github.io/palr/reference/bathy_deep_pal.md)
  [`bathyDeepPal()`](https://australianantarcticdivision.github.io/palr/reference/bathy_deep_pal.md)
  : Bathymetry
- [`dirty_pal()`](https://australianantarcticdivision.github.io/palr/reference/dirty_pal.md)
  : Bathymetry palette, absolute for global use

## Data-relative colours

Map values to colours by the range of the data itself, or by absolute
date-time.

- [`d_pal()`](https://australianantarcticdivision.github.io/palr/reference/d_pal.md)
  [`data_pal()`](https://australianantarcticdivision.github.io/palr/reference/d_pal.md)
  : Colours for data values
- [`mk_timePal()`](https://australianantarcticdivision.github.io/palr/reference/mk_timePal.md)
  : Time-indexed colour.

## Image colour mapping

Convert numeric data to hex colours the way image() does, or convert
matrices and multi-band arrays to hex colour matrices ready for
rasterImage(), textures, or export.

- [`image_hex()`](https://australianantarcticdivision.github.io/palr/reference/image_hex.md)
  : Convert image data to a matrix of hex colours
- [`image_pal()`](https://australianantarcticdivision.github.io/palr/reference/image_pal.md)
  [`image_raster()`](https://australianantarcticdivision.github.io/palr/reference/image_pal.md)
  [`image_stars()`](https://australianantarcticdivision.github.io/palr/reference/image_pal.md)
  : Map data values to colours

## Stretching

Rescale data to the unit interval ahead of colour mapping, linear
quantile clip, log, square root, and histogram equalisation.

- [`stretch_linear()`](https://australianantarcticdivision.github.io/palr/reference/stretch_linear.md)
  [`stretch_log()`](https://australianantarcticdivision.github.io/palr/reference/stretch_linear.md)
  [`stretch_sqrt()`](https://australianantarcticdivision.github.io/palr/reference/stretch_linear.md)
  [`stretch_histeq()`](https://australianantarcticdivision.github.io/palr/reference/stretch_linear.md)
  : Stretch numeric values to \[0, 1\]

## Helpers

- [`col2hex()`](https://australianantarcticdivision.github.io/palr/reference/col2hex.md)
  : Colour to hex conversion.

## Data

- [`oisst`](https://australianantarcticdivision.github.io/palr/reference/oisst.md)
  [`chl`](https://australianantarcticdivision.github.io/palr/reference/oisst.md)
  : Sea surface temperature (SST) and ocean color chlorophyll-a (CHLA).

## Package

- [`palr-package`](https://australianantarcticdivision.github.io/palr/reference/palr.md)
  [`palr`](https://australianantarcticdivision.github.io/palr/reference/palr.md)
  : palr
