# Serial interval from publicly reported cases

Data from Z. Du, X. Xu, Y. Wu, L. Wang, B. J. Cowling, and L. A. Meyers,
‘Serial Interval of COVID-19 among Publicly Reported Confirmed Cases’,
Emerg Infect Dis, vol. 26, no. 6, pp. 1341–1343, Jun. 2020, doi:
10.3201/eid2606.200357.

## Usage

``` r
data("du_serial_interval")
```

## Format

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with 752
rows and 3 columns.

## Source

<https://github.com/MeyersLabUTexas/COVID-19>

## Details

### `du_serial_interval` dataframe with 752 rows and 3 columns

- `id` (dbl) :

  Unique case id

- `symptom_onset` (dbl) :

  Time of symptom onset as an integer

- `infector_id` (dbl) :

  Case id of infector where known
