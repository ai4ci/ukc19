# COG-UK counts of genomic variants by lower tier local authority

Counts of COVID-19 variants from the COGUK COVID-19 sequencing project.
Positive samples were selected based on viral load on initial PCR
testing and sent onward for testing. Prioritisation and over-sampling of
cases with S-gene target failure happened so this data is not unbiased.

## Usage

``` r
data("covid_variants_ltla")
```

## Format

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
55785 rows and 8 columns.

## Source

<https://covid19.sanger.ac.uk/lineages/raw> Contains Ordnance Survey
data © Crown copyright and database right 2019 Contains UK Health
Security Agency data © Crown copyright and database right 2020 Office
for National Statistics licensed under the Open Government Licence v.3.0

## Details

Weekly counts of identified variants by Lower tier local authority (2019
names) This dataset has implicit zeros. The full range of areas can be
got from the `geography` data set with:
`geography %>% dplyr::filter(codeType == "LAD19")`

From late March 2023 onward, due to the low number of sequenced samples,
the UK SARS-CoV-2 sequencing surveillance data is not updated on the
Wellcome Sanger Institute COVID-19 Genomic surveillance dashboard. Due
to changes since the end of mass COVID-19 testing in the UK since April
2022 - the Wellcome Sanger Institute COVID-19 Genomic surveillance
dashboard only includes a subset of UK SARS-CoV-2 sequencing
surveillance data and should not be used to estimate frequency of
SARS-CoV-2 variants circulating. Not all samples sequenced and deposited
in public databases are presented here. This data is not de-duplicated
on a patient level - and may include targeted sequencing that may
introduce biases.

### `covid_variants_ltla` dataframe with 55785 rows and 8 columns

- `date` (date) :

  The date - unclear if this was of the sample or result

- `code` (chr) :

  The ONS geographical region code

- `codeType` (chr) :

  The type of ONS geographical code

- `name` (chr) :

  The ONS geographical region name

- `who_class` (fct) :

  The WHO short name

- `count` (dbl) :

  The number of sequences of this variant identified on this date

- `denom` (dbl) :

  The total number of sequences of all variants identified on this date

## Examples

``` r
dplyr::glimpse(covid_variants_ltla)
#> Rows: 55,785
#> Columns: 8
#> $ date      <date> 2020-09-05, 2020-09-05, 2020-09-05, 2020-09-05, 2020-09-05,…
#> $ name      <chr> "Arun", "Aylesbury Vale", "Babergh", "Babergh", "Barking and…
#> $ codeType  <chr> "LAD19", "LAD19", "LAD19", "LAD19", "LAD19", "LAD19", "LAD19…
#> $ code      <chr> "E07000224", "E07000004", "E07000200", "E07000200", "E090000…
#> $ class     <fct> Other, Other, Other, Alpha (B.1.1.7), Other, Alpha (B.1.1.7)…
#> $ who_class <fct> Other, Other, Other, Alpha, Other, Alpha, Other, Alpha, Othe…
#> $ count     <dbl> 5, 3, 1, 1, 16, 4, 32, 7, 9, 2, 4, 2, 2, 2, 3, 8, 10, 5, 31,…
#> $ denom     <dbl> 5, 3, 2, 2, 20, 20, 39, 39, 11, 11, 6, 6, 2, 5, 5, 8, 15, 15…
```
