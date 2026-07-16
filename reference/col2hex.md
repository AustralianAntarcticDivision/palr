# Colour to hex conversion.

Create colours from colour names in one easy step.

## Usage

``` r
col2hex(x, alpha = 1)
```

## Arguments

- x:

  vector of colour names or hex strings

- alpha:

  optional transparency value in \[0,1\], can be per colour in `x`

## Value

character string of hex colours

## Examples

``` r
col2hex(c("aliceblue", "firebrick"), alpha = c(1, .5))
#> [1] "#F0F8FFFF" "#B2222280"
col2hex(c("#FFFFFF", "#123456FF"), alpha = 0.1)
#> [1] "#FFFFFF1A" "#1234561A"
```
