# Country, regional, and subnational total population estimates

ONS National and subnational mid-year population estimates for the UK
and its constituent countries by administrative area, age and sex
(including components of population change, median age and population
density).

## Usage

``` r
data("uk_population_2019")
```

## Format

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with 398
rows and 4 columns.

## Source

<https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates>

Originally licensed under the [Open Government Licence
v3.0](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/)

## Details

Mid-2019: April 2019 local authority district codes edition of this
dataset. This is UK wide and covers country, regions and LTLA (2019
boundaries)

### `uk_population_2019` dataframe with 398 rows and 4 columns

- `name` (chr) :

  The region name

- `code` (chr) :

  The region code

- `codeType` (chr) :

  The ONS geographical region code type (including year)

- `population` (dbl) :

  the count of the population in that age group

## Examples

``` r
dplyr::glimpse(uk_population_2019)
#> Rows: 398
#> Columns: 4
#> $ code       <chr> "K02000001", "K03000001", "K04000001", "E92000001", "E12000…
#> $ population <dbl> 66796807, 64903140, 59439840, 56286961, 2669941, 530094, 10…
#> $ name       <chr> "United Kingdom", "Great Britain", "England and Wales", "En…
#> $ codeType   <chr> "CTRY20", "CTRY20", "CTRY20", "CTRY20", "RGN20", "LAD19", "…
```
