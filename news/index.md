# Changelog

## palr 0.5.0

- Fixed a long-standing bug in
  [`sst_pal()`](https://australianantarcticdivision.github.io/palr/reference/sst_pal.md),
  [`chl_pal()`](https://australianantarcticdivision.github.io/palr/reference/chl_pal.md),
  [`ice_pal()`](https://australianantarcticdivision.github.io/palr/reference/ice_pal.md),
  and
  [`bathy_deep_pal()`](https://australianantarcticdivision.github.io/palr/reference/bathy_deep_pal.md):
  data values below the first palette break were silently dropped from
  the output (a zero index from
  [`findInterval()`](https://rdrr.io/r/base/findInterval.html)),
  shortening the result and misaligning colours. Out of range values now
  clamp to the end colours and output length always matches input
  length.

- The absolute palettes now share one internal worker `abs_pal()`,
  unifying alpha handling and the n-colours/data/palette/function modes.
  The function mode (`pal()`) now respects `alpha`.

- New function
  [`image_hex()`](https://australianantarcticdivision.github.io/palr/reference/image_hex.md)
  converts matrices and arrays (1-band palette, grey+alpha, RGB, RGBA,
  raw, logical, character) to a matrix of hex colours. This is the
  colour engine shared with the {ximage} package, with robust handling
  of missing, non-finite, and constant data.

- New stretch functions
  [`stretch_linear()`](https://australianantarcticdivision.github.io/palr/reference/stretch_linear.md),
  [`stretch_log()`](https://australianantarcticdivision.github.io/palr/reference/stretch_linear.md),
  [`stretch_sqrt()`](https://australianantarcticdivision.github.io/palr/reference/stretch_linear.md),
  and
  [`stretch_histeq()`](https://australianantarcticdivision.github.io/palr/reference/stretch_linear.md)
  rescale data to \[0, 1\] ahead of colour mapping, based on experience
  with Sentinel-2. They preserve matrix/array dimensions, map constant
  input to 0.5, return NA for non-finite input, and accept absolute
  bounds via `lim` for scene-independent stretches.

- New function
  [`dirty_pal()`](https://australianantarcticdivision.github.io/palr/reference/dirty_pal.md)
  for global bathymetry/topography (AAD underway, DiRT). Follows the
  standard palr palette modes.

- [`d_pal()`](https://australianantarcticdivision.github.io/palr/reference/d_pal.md)
  and
  [`image_pal()`](https://australianantarcticdivision.github.io/palr/reference/image_pal.md)
  now map constant data to a mid-palette colour instead of returning NA.

- Tests moved to testthat edition 3, fixed a test that used the magrittr
  pipe without it being available.

- Removed unused Suggests of viridis, removed large blocks of
  commented-out legacy code.

## palr 0.4.0

CRAN release: 2023-11-06

- [`ice_pal()`](https://australianantarcticdivision.github.io/palr/reference/ice_pal.md)
  now defaults to the more pleasing NSIDC blue palette (use
  `amsre = TRUE` to get the old behavour).

- Fixed a problem with missing values in
  [`d_pal()`](https://australianantarcticdivision.github.io/palr/reference/d_pal.md).
  \# palr 0.3.0

- New function
  [`d_pal()`](https://australianantarcticdivision.github.io/palr/reference/d_pal.md)
  and alias
  [`data_pal()`](https://australianantarcticdivision.github.io/palr/reference/d_pal.md)
  to colour data values (like {colourvalues} but simpler).

- Removed ftp links thanks to CRAN.

## palr 0.2.0

CRAN release: 2020-01-30

- Remove need for sp package by converting example data to a matrix.

## palr 0.1.0

CRAN release: 2019-11-07

- Behaviour of
  [`image_pal()`](https://australianantarcticdivision.github.io/palr/reference/image_pal.md)
  tweaked to match that of
  [`graphics::image.default()`](https://rdrr.io/r/graphics/image.html)
  more closely.

- New alias functions
  [`bathy_deep_pal()`](https://australianantarcticdivision.github.io/palr/reference/bathy_deep_pal.md)
  (bathyDeepPal),
  [`chl_pal()`](https://australianantarcticdivision.github.io/palr/reference/chl_pal.md)
  (chlPal),
  [`ice_pal()`](https://australianantarcticdivision.github.io/palr/reference/ice_pal.md)
  (icePal),
  [`sst_pal()`](https://australianantarcticdivision.github.io/palr/reference/sst_pal.md)
  (sstPal) to start move to consistent and better names. The old
  function names are soft deprecated.

- New function
  [`image_pal()`](https://australianantarcticdivision.github.io/palr/reference/image_pal.md)
  to return the colours created by
  [`image()`](https://rdrr.io/r/graphics/image.html) for numeric input.
  Includes partner functions
  [`image_raster()`](https://australianantarcticdivision.github.io/palr/reference/image_pal.md)
  and
  [`image_stars()`](https://australianantarcticdivision.github.io/palr/reference/image_pal.md)
  to create objects from raster and stars format. Both packages now
  included as Suggests.

- Converted NEWS to NEWS.md.

## VERSION 0.0.6

CRAN release: 2016-07-27

- Added examples and tests

- Installed `oisst` as a built-in data set.

- fixes for 3.3.0

- added bathyDeepPal

## VERSION 0.0.5

- new function mk_timePal

## VERSION 0.0.4

- renamed functions to camel case

- improved vignette

## VERSION 0.0.2

- added ice.pal

## VERSION 0.0.1

- basics working
