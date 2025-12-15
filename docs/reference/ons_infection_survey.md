# ONS COVID-19 infection survey

The COVID-19 ONS infection survey took a random sample of the population
and provides an estimate of the prevalence of COVID-19 that is
theoretically free from ascertainment bias. This data set is the output
of the model based on underlying data.

## Usage

``` r
data("ons_infection_survey")
```

## Format

An object of class `grouped_df` (inherits from `tbl_df`, `tbl`,
`data.frame`) with 9820 rows and 8 columns.

## Source

<https://www.ons.gov.uk/peoplepopulationandcommunity/healthandsocialcare/conditionsanddiseases/datasets/coronaviruscovid19infectionsurveydata>

Originally licensed under the [Open Government Licence
v3.0](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/)

## Details

- `code` (chr) :

  The ONS geographical region code

- `codeType` (chr) :

  The type of ONS geographical code

- `name` (chr) :

  The ONS geographical region name

- `date` (date) :

  A date

- `prevalence.0.5` (dbl) :

  the median proportion of people in the region testing positive for
  COVID-19

- `prevalence.0.025` (dbl) :

  the lower CI of the proportion of people in the region testing
  positive for COVID-19

- `prevalence.0.975` (dbl) :

  the upper CI of the proportion of people in the region testing
  positive for COVID-19

- `denom` (int) :

  the sample size on which this estimate was made (daily rate inferred
  from weekly sample sizes.)

## Examples

``` r
dplyr::glimpse(ons_infection_survey)
#> Rows: 9,820
#> Columns: 8
#> Groups: code, codeType, name [10]
#> $ code             <chr> "E92000001", "E12000001", "E12000002", "E12000003", "…
#> $ codeType         <chr> "CTRY20", "RGN20", "RGN20", "RGN20", "RGN20", "RGN20"…
#> $ name             <chr> "England", "North East", "North West", "Yorkshire and…
#> $ date             <date> 2023-01-11, 2023-01-11, 2023-01-11, 2023-01-11, 2023…
#> $ prevalence.0.5   <dbl> 0.01970572, 0.01908564, 0.01939597, 0.01940800, 0.021…
#> $ prevalence.0.025 <dbl> 0.01878849, 0.01574656, 0.01698355, 0.01677878, 0.018…
#> $ prevalence.0.975 <dbl> 0.02067670, 0.02286518, 0.02186157, 0.02226405, 0.024…
#> $ denom            <int> 9721, 436, 1335, 964, 736, 896, 1094, 1821, 1463, 971…
```
