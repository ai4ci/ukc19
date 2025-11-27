# The `regional_population` dataset

Population estimates by geography and age band based on 2021 census
estimates. Because this was taken from the census it uses local
authority boundaries that are different from the majority of COVID
statistics.

## Usage

``` r
data("regional_population")
```

## Format

An object of class `grouped_df` (inherits from `tbl_df`, `tbl`,
`data.frame`) with 228 rows and 6 columns.

## Source

<https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates>

## Details

### `regional_population` dataframe with 228 rows and 6 columns

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
