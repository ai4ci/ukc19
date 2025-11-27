# SPI-M-O consensus reproduction number and growth rate estimates

A set of consensus estimates for the reproduction number and growth rate
of the COVID-19 epidemic in England

## Usage

``` r
data("spim_consensus")
```

## Format

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with 113
rows and 5 columns.

## Source

<https://www.gov.uk/guidance/the-r-value-and-growth-rate>

Originally licensed under the [Open Government Licence
v3.0](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/)

## Details

### `spim_consensus_rt` dataframe with 113 rows and 5 columns

- `date` (date) :

  the date

- `rt.low` (dbl) :

  the lower estimate of the reproduction number

- `rt.high` (dbl) :

  the upper estimate of the reproduction number

- `growth.low` (dbl) :

  the lower estimate of the exponential growth rate

- `growth.high` (dbl) :

  the higher estimate of the exponential growth rate

## Examples

``` r
dplyr::glimpse(spim_consensus)
#> Rows: 113
#> Columns: 5
#> $ date        <date> 2020-05-29, 2020-06-05, 2020-06-12, 2020-06-19, 2020-06-2…
#> $ rt.low      <dbl> 0.7, 0.7, 0.8, 0.7, 0.7, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8…
#> $ rt.high     <dbl> 0.9, 1.0, 1.0, 0.9, 0.9, 0.9, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0…
#> $ growth.low  <dbl> NA, NA, -0.01, -0.04, -0.05, -0.05, -0.04, -0.04, -0.04, -…
#> $ growth.high <dbl> NA, NA, -0.03, -0.01, -0.02, -0.02, -0.01, 0.00, 0.00, -0.…
```
