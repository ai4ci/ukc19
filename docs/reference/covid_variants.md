# COG-UK counts of genomic variants

Weekly counts of identified variants for the whole of England.

## Usage

``` r
data("covid_variants")
```

## Format

An object of class `grouped_df` (inherits from `tbl_df`, `tbl`,
`data.frame`) with 479 rows and 5 columns.

## Source

<https://covid19.sanger.ac.uk/lineages/raw> Contains Ordnance Survey
data © Crown copyright and database right 2019 Contains UK Health
Security Agency data © Crown copyright and database right 2020 Office
for National Statistics licensed under the Open Government Licence v.3.0

## Details

Counts of COVID-19 variants from the COGUK COVID-19 sequencing project.
Positive samples were selected based on viral load on initial PCR
testing and sent onward for testing. Prioritisation and over-sampling of
cases with S-gene target failure happened so this data is not unbiased.

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

### `covid_variants` dataframe with 479 rows and 5 columns

- `date` (date) :

  The date - unclear if this was of the sample or result

- `class` (fct) :

  The variant description as a name and pango lineage

- `who_class` (fct) :

  The WHO short name

- `count` (dbl) :

  The number of sequences of this variant identified on this date

- `denom` (dbl) :

  The total number of sequences of all variants identified on this date

## Examples

``` r
dplyr::glimpse(covid_variants)
#> Rows: 479
#> Columns: 5
#> Groups: class [10]
#> $ date      <date> 2020-09-05, 2020-09-05, 2020-09-12, 2020-09-12, 2020-09-19,…
#> $ class     <fct> Other, Alpha (B.1.1.7), Other, Alpha (B.1.1.7), Other, Alpha…
#> $ who_class <fct> Other, Alpha, Other, Alpha, Other, Alpha, Other, Alpha, Othe…
#> $ count     <dbl> 1182, 371, 1439, 588, 837, 429, 1685, 1157, 1208, 823, 1501,…
#> $ denom     <dbl> 1553, 1553, 2027, 2027, 1266, 1266, 2842, 2842, 2031, 2031, …
```
