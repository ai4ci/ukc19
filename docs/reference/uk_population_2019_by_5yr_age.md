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

## Examples

``` r
dplyr::glimpse(uk_population_2019_by_5yr_age)
#> Rows: 7,562
#> Columns: 6
#> Groups: name, code, codeType [398]
#> $ code                <chr> "E06000001", "E06000001", "E06000001", "E06000001"…
#> $ class               <chr> "00_04", "05_09", "10_14", "15_19", "20_24", "25_2…
#> $ population          <dbl> 5229, 5923, 5812, 5167, 5176, 6103, 6112, 5575, 49…
#> $ name                <chr> "Hartlepool", "Hartlepool", "Hartlepool", "Hartlep…
#> $ codeType            <chr> "LAD19", "LAD19", "LAD19", "LAD19", "LAD19", "LAD1…
#> $ baseline_proportion <dbl> 0.055827808, 0.063237351, 0.062052251, 0.055165861…
```
