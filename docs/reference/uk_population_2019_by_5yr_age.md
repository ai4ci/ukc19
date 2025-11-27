# Country, regional, and subnational population estimates by 5 year age groups

ONS National and subnational mid-year population estimates for the UK
and its constituent countries by administrative area, age and sex
(including components of population change, median age and population
density).

## Usage

``` r
data("uk_population_2019_by_5yr_age")
```

## Format

An object of class `grouped_df` (inherits from `tbl_df`, `tbl`,
`data.frame`) with 7562 rows and 6 columns.

## Source

<https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates>

Originally licensed under the [Open Government Licence
v3.0](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/)

## Details

Mid-2019: April 2019 local authority district codes edition of this
dataset, this is UK wide and covers country, regions and LTLA (2019
boundaries)

Stratified by 5 year age groups

### `uk_population_2019_by_5yr_age` dataframe with 7562 rows and 6 columns

- `name` (chr) :

  The region name

- `code` (chr) :

  The region code

- `codeType` (chr) :

  The ONS geographical region code type (including year)

- `class` (chr) :

  The age group in 5 year age bands

- `population` (dbl) :

  the count of the population in that age group

- `baseline_proportion` (dbl) :

  the proportion of the total regional population that is in an age
  group
