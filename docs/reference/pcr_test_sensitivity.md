# COVID PCR test sensitivity over time

Rachelle N Binny, Patricia Priest, Nigel P French, Matthew Parry, Audrey
Lustig, Shaun C Hendy, Oliver J Maclaren, Kannan M Ridings, Nicholas
Steyn, Giorgia Vattiato, Michael J Plank, Sensitivity of Reverse
Transcription Polymerase Chain Reaction Tests for Severe Acute
Respiratory Syndrome Coronavirus 2 Through Time, The Journal of
Infectious Diseases, Volume 227, Issue 1, 1 January 2023, Pages 9–17,
https://doi.org/10.1093/infdis/jiac317

## Usage

``` r
data("pcr_test_sensitivity")
```

## Format

An object of class `list` of length 2.

## Source

<https://pmc.ncbi.nlm.nih.gov/articles/instance/9796165/bin/jiac317_supplementary_data.zip>

## Details

### `pcr_test_sensitivity` named list with 2 items

- `modelled` (df modelled\*) :

  Original data from supplementary

- `resampled` (df resampled\*) :

  resampled description

### `df modelled` dataframe with 501 rows and 4 columns

Model output

- `days_since_infection` (dbl) :

  days since infection

- `median` (dbl) :

  median sensitivity

- `lower_95` (dbl) :

  lower 95% CI of sensitivity

- `upper_95` (dbl) :

  upper 95% CI of sensitivity

### `df resampled` dataframe with 5100 rows and 3 columns

- `tau` (dbl) :

  days since infection

- `probability` (dbl) :

  the sensitivity as a probability of detection

- `boot` (int) :

  a bootstrap identifier
