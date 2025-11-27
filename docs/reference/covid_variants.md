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

From late March 2023 onwards, due to the low number of sequenced
samples, the UK SARS-CoV-2 sequencing surveillance data is not updated
on the Wellcome Sanger Institute COVID-19 Genomic surveillance
dashboard. Due to changes since the end of mass COVID-19 testing in the
UK since April 2022 - the Wellcome Sanger Institute COVID-19 Genomic
surveillance dashboard only includes a subset of UK SARS-CoV-2
sequencing surveillance data and should not be used to estimate
frequency of SARS-CoV-2 variants circulating. Not all samples sequenced
and deposited in public databases are presented here. This data is not
de-duplicated on a patient level - and may include targeted sequencing
that may introduce biases.

### `covid_variants` dataframe with 479 rows and 5 columns

- `date` (date) :

  The date

- `class` (fct) :

  The variant description as a name and pango lineage

- `who_class` (fct) :

  The WHO short name

- `count` (dbl) :

  The number of sequences of this variant identified on this date

- `denom` (dbl) :

  The total number of sequences of all variants identified on this date
