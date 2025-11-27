# UK-wide COVID-19 case counts stratified by Lower tier local authority

A dataset of the daily count of COVID-19 cases by Lower tier local
authority in the UK downloaded from the UKHSA coronavirus API, and
formatted for use in `ggoutbreak`.

## Usage

``` r
data("ltla_cases")
```

## Format

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
512050 rows and 6 columns.

## Source

<https://ukhsa-dashboard.data.gov.uk/covid-19-archive-data-download>

Originally licensed under the [Open Government Licence
v3.0](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/)

## Details

### `ltla_cases` dataframe with 512050 rows and 6 columns

- `name` (chr) :

  The region name

- `code` (chr) :

  The region code

- `codeType` (chr) :

  The ONS geographical region code type (including year)

- `date` (date) :

  The date

- `count` (dbl) :

  the test positives for each LTLA

- `population` (dbl) :

  the population size for this geography

## Examples

``` r
dplyr::glimpse(ltla_cases)
#> Rows: 512,050
#> Columns: 6
#> $ code       <chr> "S12000033", "S12000033", "S12000033", "S12000033", "S12000…
#> $ date       <date> 2020-03-04, 2020-03-05, 2020-03-06, 2020-03-07, 2020-03-08…
#> $ count      <dbl> 1, 0, 0, 0, 0, 0, 0, 0, 3, 3, 0, 0, 0, 2, 1, 0, 1, 0, 0, 3,…
#> $ population <dbl> 228670, 228670, 228670, 228670, 228670, 228670, 228670, 228…
#> $ name       <chr> "Aberdeen City", "Aberdeen City", "Aberdeen City", "Aberdee…
#> $ codeType   <chr> "LAD19", "LAD19", "LAD19", "LAD19", "LAD19", "LAD19", "LAD1…
```
