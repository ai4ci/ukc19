# Covid-19 Viral load following challenge

Viral load from nasal swabs of subset of positive participants from
COVID-19 human challenge study, as deteced by Quantitative PCR. Values
were mined from the vector files of the figures. The Y-axis values are
approximate as had to be manually read from the scale.

## Usage

``` r
data("covid_challenge")
```

## Format

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with 629
rows and 3 columns.

## Source

<https://www.nature.com/articles/s41591-022-01780-9/figures/2>

## Details

Data extracted from figure 2 Viral shedding after a short incubation
period peaks rapidly after human SARS-CoV-2 challenge. Panel A (middle
left subpanel).

Killingley, B., Mann, A.J., Kalinova, M. et al. Safety, tolerability and
viral kinetics during SARS-CoV-2 human challenge in young adults. Nat
Med 28, 1031–1041 (2022). https://doi.org/10.1038/s41591-022-01780-9

For datasets compiled from existing literature, Scientific Data’s policy
is that compilers (creators of the secondary compilation dataset and
authors of the associated Data Descriptor) are not required by the
journal to ask permission from the original authors to extract small
amounts of numerical information or other fields. Expected practice is
to attribute the original work via citation.

- `id` (chr) :

  id a unique ID for participant

- `log10_viral_load` (dbl) :

  log 10 viral load in copies per millilitre detected

- `time` (dbl) :

  time of the sample in days from exposure.

## Examples

``` r
dplyr::glimpse(covid_challenge)
#> Rows: 629
#> Columns: 3
#> $ id               <chr> "g3158", "g3158", "g3158", "g3158", "g3158", "g3158",…
#> $ log10_viral_load <dbl> 0.000000, 0.000000, 0.000000, 0.000000, 4.536073, 7.2…
#> $ time             <dbl> 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0, 5.5, 6.0…
```
