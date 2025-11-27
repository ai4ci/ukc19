# England only COVID-19 case counts stratified by 5-year age bands

A dataset of the daily count of COVID-19 cases by age group in England
downloaded from the UKHSA coronavirus API, and formatted for use in
`ggoutbreak`. A denominator is calculated which is the overall positive
count for all age groups. This data set can be used to calculate
group-wise incidence and absolute growth rates and group wise
proportions and relative growth rates by age group.

## Usage

``` r
data("england_cases_by_5yr_age")
```

## Format

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
26790 rows and 8 columns.

## Source

<https://ukhsa-dashboard.data.gov.uk/covid-19-archive-data-download>
Originally licensed under the [Open Government Licence
v3.0](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/)

## Details

You may want `england_covid_positivity` instead which includes the test
denominator. The denominator here is the total number of positive tests
across all age groups and not the number of tests taken or population
size.

### `england_cases_by_5yr_age` dataframe with 26790 rows and 8 columns

- `name` (chr) :

  The region name

- `code` (chr) :

  The region code

- `codeType` (chr) :

  The ONS geographical region code type (including year)

- `date` (date) :

  The date

- `class` (chr) :

  the age group in 5 year age bands

- `count` (dbl) :

  the test positives for each age group

- `denom` (dbl) :

  the test positives across all age groups

- `population` (dbl) :

  the population size for this age group
