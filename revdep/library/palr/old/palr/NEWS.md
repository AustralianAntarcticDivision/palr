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
 

