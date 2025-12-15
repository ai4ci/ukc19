# John Hopkins data from the early outbreak

Mined out the commit history of COVID-19 Data Repository by the Center
for Systems Science and Engineering (CSSE) at Johns Hopkins University
this dataset has early outbreak trajectories (21st Jan 2020 up to March
8th 2020) for a wide range of geographies, for confirmed cases, deaths
and recovered cases. These trajectories are based on reported date, but
are occasionally revised which will vary from region to region and maybe
between different statistics, which show up as infrequent changes in
published estimates over time.

## Usage

``` r
data("early_global_combined")
```

## Format

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
104036 rows and 9 columns.

## Source

<https://github.com/CSSEGISandData/COVID-19>

## Details

This data set is originally licensed under the Creative Commons
Attribution 4.0 International (CC BY 4.0) by the Johns Hopkins
University on behalf of its Center for Systems Science in Engineering.
Copyright Johns Hopkins University 2020.

- `country` (chr) :

  The country

- `province` (chr) :

  Sub-national division

- `lat` (dbl) :

  Latitude

- `long` (dbl) :

  Longitude

- `reported_date` (date) :

  Date of the observation based on reports of cases on this date.

- `total_cases` (dbl) :

  Cumulative cases

- `published_date` (date) :

  Date the observation was published on the JHU github.

- `total_deaths` (dbl) :

  Cumulative deaths

- `total_recovered` (dbl) :

  Cumulative recovered

## Examples

``` r
dplyr::glimpse(early_global_combined)
#> Rows: 104,036
#> Columns: 9
#> $ country         <chr> "Mainland China", "Mainland China", "Mainland China", …
#> $ province        <chr> "Anhui", "Beijing", "Chongqing", "Fujian", "Gansu", "G…
#> $ lat             <dbl> 31.82570, 40.18240, 30.05720, 26.07890, 36.06110, 23.3…
#> $ long            <dbl> 117.2264, 116.4142, 107.8740, 117.9874, 103.8343, 113.…
#> $ reported_date   <date> 2020-03-07, 2020-03-07, 2020-03-07, 2020-03-07, 2020-…
#> $ total_cases     <dbl> 990, 426, 576, 296, 120, 1352, 252, 146, 168, 318, 481…
#> $ published_date  <date> 2020-03-07, 2020-03-07, 2020-03-07, 2020-03-07, 2020-…
#> $ total_deaths    <dbl> 6, 8, 6, 1, 2, 7, 2, 2, 6, 6, 13, 22, 2959, 4, 1, 0, 1…
#> $ total_recovered <dbl> 979, 303, 526, 295, 87, 1237, 218, 115, 158, 307, 403,…
```
