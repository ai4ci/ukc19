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
2048 rows and 6 columns.

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
