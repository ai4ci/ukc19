# UK geographic codes an CTRY, RGN and LAD level

Geographic codes and names from the ONS for administrative regions of
the UK relevant to the UKs covid response. There are multiple entries
for lower tier local authority codes as these changed during the course
of the pandemic.

## Usage

``` r
data("geography")
```

## Format

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with
1512 rows and 3 columns.

## Source

<https://geoportal.statistics.gov.uk/> Originally licensed under the
[Open Government Licence
v3.0](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/)

## Details

### `geography` dataframe with 1512 rows and 3 columns

- `name` (chr) :

  The region name

- `code` (chr) :

  The region code

- `codeType` (chr) :

  The ONS geographical region code type (including year)
