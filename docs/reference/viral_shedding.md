# COVID-19 Viral shedding data

Data from van Kampen et al, 2019, describing duration of viral shedding
from symptom onset in patients with COVID-19.

## Usage

``` r
data("viral_shedding")
```

## Format

An object of class `list` of length 2.

## Source

<https://static-content.springer.com/esm/art%3A10.1038%2Fs41467-020-20568-4/MediaObjects/41467_2020_20568_MOESM4_ESM.xlsx>

## Details

### `viral_shedding` named list with 2 items

- `original` (df original\*) :

  original description

- `resampled` (df resampled\*) :

  resampled description

### `df original` dataframe with 690 rows and 4 columns

- `duration of symptoms in days` (dbl) :

  duration of symptoms in days

- `RNA copies per mL` (chr) :

  RNA copies per mL

- `PRNT titer` (chr) :

  PRNT titer

- `virus culture result` (chr) :

  virus culture result

### `df resampled` dataframe with 2600 rows and 3 columns

- `tau` (int) :

  time from symptom onset to measurement

- `probability` (dbl) :

  probability of detected viral excretion

- `boot` (int) :

  a bootstrap identifier

## References

van Kampen, J.J.A., van de Vijver, D.A.M.C., Fraaij, P.L.A. et al.
Duration and key determinants of infectious virus shedding in
hospitalized patients with coronavirus disease-2019 (COVID-19). Nat
Commun 12, 267 (2021). https://doi.org/10.1038/s41467-020-20568-4
