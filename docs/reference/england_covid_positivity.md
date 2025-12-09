# England only COVID-19 case counts with total test numbers

The daily count of COVID-19 new PCR positive cases in England. The
denominator the overall number of PCR tests conducted. This gives us a
proportion of positive tests which can be used to correct for testing
effort.

## Usage

``` r
data("england_covid_positivity")
```

## Format

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
1413 rows and 6 columns.

## Source

<https://ukhsa-dashboard.data.gov.uk/covid-19-archive-data-download>

Originally licensed under the [Open Government Licence
v3.0](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/)

## Details

### `england_covid_positivity` dataframe with 2048 rows and 6 columns

- `name` (chr) :

  The region name

- `code` (chr) :

  The region code

- `codeType` (chr) :

  The ONS geographical region code type (including year)

- `date` (date) :

  The date

- `count` (dbl) :

  the count of PCR test positives

- `denom` (dbl) :

  the total count of PCR tests conducted on that day

## Examples

``` r
dplyr::glimpse(england_covid_positivity)
#> Rows: 1,413
#> Columns: 6
#> $ date     <date> 2020-01-30, 2020-01-31, 2020-02-01, 2020-02-02, 2020-02-03, …
#> $ code     <chr> "E92000001", "E92000001", "E92000001", "E92000001", "E9200000…
#> $ name     <chr> "England", "England", "England", "England", "England", "Engla…
#> $ count    <dbl> 1, 0, 0, 1, 18, 0, 1, 0, 0, 3, 1, 1, 4, 1, 1, 0, 0, 0, 1, 0, …
#> $ denom    <dbl> 53, 75, 165, 172, 297, 147, 155, 103, 186, 568, 583, 599, 887…
#> $ codeType <chr> "CTRY20", "CTRY20", "CTRY20", "CTRY20", "CTRY20", "CTRY20", "…
```
