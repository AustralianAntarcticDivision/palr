pkgname <- "paletteer"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('paletteer')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("ggplot2-scales-binned")
### * ggplot2-scales-binned

flush(stderr()); flush(stdout())

### Name: ggplot2-scales-binned
### Title: Binned scales to use for ggplot2
### Aliases: ggplot2-scales-binned scale_colour_paletteer_binned
###   scale_color_paletteer_binned scale_fill_paletteer_binned

### ** Examples

## Don't show: 
if (rlang::is_installed(c("scico", "ggplot2"))) withAutoprint({ # examplesIf
## End(Don't show)
library(ggplot2)
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, colour = Petal.Length)) +
  geom_point() +
  scale_colour_paletteer_binned("scico::tokyo")
## Don't show: 
}) # examplesIf
## End(Don't show)



cleanEx()
nameEx("ggplot2-scales-continuous")
### * ggplot2-scales-continuous

flush(stderr()); flush(stdout())

### Name: ggplot2-scales-continuous
### Title: Continuous scales to use for ggplot2
### Aliases: ggplot2-scales-continuous scale_colour_paletteer_c
###   scale_color_paletteer_c scale_fill_paletteer_c

### ** Examples

## Don't show: 
if (rlang::is_installed(c("scico", "ggplot2"))) withAutoprint({ # examplesIf
## End(Don't show)
library(ggplot2)
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, colour = Petal.Length)) +
  geom_point() +
  scale_colour_paletteer_c("scico::tokyo")
## Don't show: 
}) # examplesIf
## End(Don't show)



cleanEx()
nameEx("ggplot2-scales-discrete")
### * ggplot2-scales-discrete

flush(stderr()); flush(stdout())

### Name: scale_colour_paletteer_d
### Title: Discrete scales to use for ggplot2
### Aliases: scale_colour_paletteer_d scale_color_paletteer_d
###   scale_fill_paletteer_d

### ** Examples

## Don't show: 
if (rlang::is_installed("ggplot2")) withAutoprint({ # examplesIf
## End(Don't show)
library(ggplot2)
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, colour = Species)) +
  geom_point() +
  scale_colour_paletteer_d("nord::frost")
## Don't show: 
}) # examplesIf
## End(Don't show)



cleanEx()
nameEx("paletteer_c")
### * paletteer_c

flush(stderr()); flush(stdout())

### Name: paletteer_c
### Title: Get continuous palette by package and name
### Aliases: paletteer_c

### ** Examples

## Don't show: 
if (rlang::is_installed("scico")) withAutoprint({ # examplesIf
## End(Don't show)
paletteer_c("scico::berlin", 100)
## Don't show: 
}) # examplesIf
## End(Don't show)



cleanEx()
nameEx("paletteer_d")
### * paletteer_d

flush(stderr()); flush(stdout())

### Name: paletteer_d
### Title: Get discrete palette by package and name
### Aliases: paletteer_d

### ** Examples

paletteer_d("nord::frost")
paletteer_d("wesanderson::Royal1", 3)
paletteer_d("Redmonder::dPBIPuOr", 14, type = "continuous")



cleanEx()
nameEx("paletteer_dynamic")
### * paletteer_dynamic

flush(stderr()); flush(stdout())

### Name: paletteer_dynamic
### Title: Get dynamic palette by package and name
### Aliases: paletteer_dynamic

### ** Examples

paletteer_dynamic("ggthemes_solarized::green", 8)
paletteer_dynamic("cartography::sand.pal", 20)



### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
