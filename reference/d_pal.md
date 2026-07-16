# Colours for data values

Scales input data to the palette, so that colour is mapped linearly to
the range of values.

## Usage

``` r
d_pal(x, pal = hcl.colors(84))

data_pal(x, pal = hcl.colors(84))
```

## Arguments

- x:

  data vector, maybe be numeric or character

- pal:

  palette, may be colours or a function

## Value

character string of hex colours

## Details

Default palette 'pal' is the 'viridis' colours of
\[grDevices::hcl.colors()\], and may be literal colour values or a
function.

\[data_pal()\] is an alias of \[d_pal()\].

## Examples

``` r
plot(1:100, col = d_pal(1:100))

plot(1:100, col = d_pal(1:100, chl_pal))

```
