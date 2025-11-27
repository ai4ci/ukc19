# NHS digital contact tracing activity

Summary data collected as part of the NHS digital contact tracing app
monitoring. This describes the number of alerts issued, and venue
"check-ins".

## Usage

``` r
data("nhs_app")
```

## Format

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with 137
rows and 3 columns.

## Source

<https://www.gov.uk/government/publications/nhs-covid-19-app-statistics>

Originally licensed under the [Open Government Licence
v3.0](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/)

## Details

- `date` (date) :

  The date

- `alerts` (int) :

  Number of alerts

- `visits` (int) :

  Number of check-ins
