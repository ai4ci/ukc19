# COVID-19 cluster outbreaks data from Tianjin and Singapore

Ganyani T, Kremer C, Chen D, Torneri A, Faes C, Wallinga J, Hens N.
Estimating the generation interval for coronavirus disease (COVID-19)
based on symptom onset data, March 2020. Euro Surveill. 2020
Apr;25(17):2000257. doi: 10.2807/1560-7917.ES.2020.25.17.2000257. PMID:
32372755; PMCID: PMC7201952.

## Usage

``` r
data("ganyani_clusters")
```

## Format

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with 196
rows and 6 columns.

## Source

<https://github.com/cecilekremer/COVID19>

## Details

### `ganyani_clusters` dataframe with 196 rows and 6 columns

- `id` (dbl) :

  a unique id for a person (unique within the `source`)

- `contacts` (list dbl) :

  list of known contacts in the cluster

- `cluster_id` (dbl) :

  id of a cluster (unique within the `source`)

- `symptom_onset` (date) :

  symptom onset date

- `known_primary_case` (lgl) :

  flag if this person is know to be the primary case in the cluster

- `source` (chr) :

  geographical source of the data

## Examples

``` r
dplyr::glimpse(ganyani_clusters)
#> Rows: 196
#> Columns: 6
#> $ id                 <dbl> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, …
#> $ contacts           <list> <3, 4, 9, 22, 25, 7, 11, 13, 14, 17, 18, 24, 28, 3…
#> $ cluster_id         <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, …
#> $ symptom_onset      <date> 2020-01-22, 2020-01-24, 2020-01-25, 2020-01-21, 20…
#> $ known_primary_case <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FA…
#> $ source             <chr> "tianjin", "tianjin", "tianjin", "tianjin", "tianji…
```
