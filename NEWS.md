# palr 0.5.0

* Fixed a long-standing bug in `sst_pal()`, `chl_pal()`, `ice_pal()`, and
 `bathy_deep_pal()`: data values below the first palette break were silently
 dropped from the output (a zero index from `findInterval()`), shortening the
 result and misaligning colours. Out of range values now clamp to the end
 colours and output length always matches input length.

* The absolute palettes now share one internal worker `abs_pal()`, unifying
 alpha handling and the n-colours/data/palette/function modes. The function
 mode (`pal()`) now respects `alpha`.

* New function `image_hex()` converts matrices and arrays (1-band palette,
 grey+alpha, RGB, RGBA, raw, logical, character) to a matrix of hex colours.
 This is the colour engine shared with the {ximage} package, with robust
 handling of missing, non-finite, and constant data.

* New stretch functions `stretch_linear()`, `stretch_log()`, `stretch_sqrt()`,
 and `stretch_histeq()` rescale data to [0, 1] ahead of colour mapping, based
 on experience with Sentinel-2. They preserve matrix/array dimensions, map
 constant input to 0.5, return NA for non-finite input, and accept absolute
 bounds via `lim` for scene-independent stretches.

* New function `dirty_pal()` for global bathymetry/topography (AAD underway,
 DiRT), with companion `dirty_image()` for `vapour::gdal_raster_data()`
 output. Follows the standard palr palette modes.

* `d_pal()` and `image_pal()` now map constant data to a mid-palette colour
 instead of returning NA.

* Tests moved to testthat edition 3, fixed a test that used the magrittr pipe
 without it being available.

* Removed unused Suggests of viridis, removed large blocks of commented-out
 legacy code.

# palr 0.4.0

* `ice_pal()` now defaults to the more pleasing NSIDC blue palette (use `amsre = TRUE` to get the old behavour).

* Fixed a problem with missing values in `d_pal()`. 
# palr  0.3.0

* New function `d_pal()` and alias `data_pal()` to colour data values (like {colourvalues} but
 simpler). 
 
* Removed ftp links thanks to CRAN. 

# palr  0.2.0

* Remove need for sp package by converting example data to a matrix. 

# palr  0.1.0
    
* Behaviour of `image_pal()` tweaked to match that of `graphics::image.default()` more
 closely.
 
* New alias functions `bathy_deep_pal()` (bathyDeepPal), `chl_pal()` (chlPal), 
 `ice_pal()` (icePal), `sst_pal()` (sstPal) to start move to consistent and
 better names. The old function names are soft deprecated. 
 
* New function `image_pal()` to return the colours created by `image()` for numeric
 input. Includes partner functions `image_raster()` and `image_stars()` to create
 objects from raster and stars format. Both packages now included as Suggests. 
 
* Converted NEWS to NEWS.md. 

#   VERSION 0.0.6

* Added examples and tests

* Installed `oisst` as a built-in data set. 

* fixes for 3.3.0

* added bathyDeepPal

#   VERSION 0.0.5
     
* new function mk_timePal

#   VERSION 0.0.4

* renamed functions to camel case

* improved vignette

#   VERSION 0.0.2

* added ice.pal

#   VERSION 0.0.1

* basics working
 

