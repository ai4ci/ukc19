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

## Examples

``` r
dplyr::glimpse(du_serial_interval)
#> Rows: 752
#> Columns: 3
#> $ id            <dbl> 23, 28, 35, 22, 49, 62, 60, 63, 65, 66, 68, 88, 76, 95, …
#> $ symptom_onset <dbl> 16, 15, 16, 14, 18, 15, 17, 11, 23, 17, 21, 23, 22, 12, …
#> $ infector_id   <dbl> NA, NA, NA, NA, NA, NA, 62, 60, NA, NA, NA, NA, NA, NA, …
```
