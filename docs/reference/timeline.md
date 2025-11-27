# Timeline of events

Major events in the UK COVID-19 pandemic, limited to lockdowns,
vaccination rollout and first identification of major variants.

## Usage

``` r
data("timeline")
```

## Format

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with 19
rows and 3 columns.

## Source

<https://en.wikipedia.org/wiki/Timeline_of_the_COVID-19_pandemic_in_the_United_Kingdom>

## Details

- `label` (chr) :

  The event

- `start` (date) :

  The start date

- `end` (date) :

  The end date if a period

## Examples

``` r
dplyr::glimpse(timeline)
#> Rows: 19
#> Columns: 3
#> $ label <chr> "1st lockdown", "First schools return", "Alpha first UK sequence…
#> $ start <date> 2020-03-23, 2020-06-01, 2020-10-01, 2020-11-05, 2020-12-08, 202…
#> $ end   <date> 2020-07-04, NA, NA, 2020-12-02, NA, 2021-03-29, NA, NA, NA, NA,…
```
