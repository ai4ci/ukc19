#' COG-UK counts of genomic variants
#'
#' Weekly counts of identified variants for the whole of England.
#'
#' From late March 2023 onwards, due to the low number of sequenced samples, the
#' UK SARS-CoV-2 sequencing surveillance data is not updated on the Wellcome
#' Sanger Institute COVID-19 Genomic surveillance dashboard. Due to changes
#' since the end of mass COVID-19 testing in the UK since April 2022 - the
#' Wellcome Sanger Institute COVID-19 Genomic surveillance dashboard only
#' includes a subset of UK SARS-CoV-2 sequencing surveillance data and should
#' not be used to estimate frequency of SARS-CoV-2 variants circulating. Not all
#' samples sequenced and deposited in public databases are presented here. This
#' data is not de-duplicated on a patient level - and may include targeted
#' sequencing that may introduce biases.
#'
#' ## `covid_variants` dataframe with 479 rows and 5 columns
#'
#' \describe{
#'     \item{ `date` (date) }{
#'         The date
#'       }
#'     \item{ `class` (fct) }{
#'         The variant description as a name and pango lineage
#'       }
#'     \item{ `who_class` (fct) }{
#'         The WHO short name
#'       }
#'     \item{ `count` (dbl) }{
#'         The number of sequences of this variant identified on this date
#'       }
#'     \item{ `denom` (dbl) }{
#'         The total number of sequences of all variants identified on this date
#'       }
#'  }
#'
#'
#' @usage data("covid_variants")
#'
#' @docType data
#' @keywords datasets
#' @concept datasets
#' @source <https://covid19.sanger.ac.uk/lineages/raw>
#' Contains Ordnance Survey data © Crown copyright and database right 2019
#' Contains UK Health Security Agency data © Crown copyright and database right 2020
#' Office for National Statistics licensed under the Open Government Licence v.3.0
#'
#' @examples
#' dplyr::glimpse(covid_variants)
#'
"covid_variants"


## documentation block for `covid_variants_ltla` ----

#' COG-UK counts of genomic variants by lower tier local authority
#'
#' Weekly counts of identified variants by Lower tier local authority (2019 names)
#' This dataset has implicit zeros. The full range of areas can be got from the
#' `geography` data set with: `geography %>% dplyr::filter(codeType == "LAD19")`
#'
#' From late March 2023 onwards, due to the low number of sequenced samples, the
#' UK SARS-CoV-2 sequencing surveillance data is not updated on the Wellcome
#' Sanger Institute COVID-19 Genomic surveillance dashboard. Due to changes
#' since the end of mass COVID-19 testing in the UK since April 2022 - the
#' Wellcome Sanger Institute COVID-19 Genomic surveillance dashboard only
#' includes a subset of UK SARS-CoV-2 sequencing surveillance data and should
#' not be used to estimate frequency of SARS-CoV-2 variants circulating. Not all
#' samples sequenced and deposited in public databases are presented here. This
#' data is not de-duplicated on a patient level - and may include targeted
#' sequencing that may introduce biases.
#'
#' ## `covid_variants_ltla` dataframe with 55785 rows and 8 columns
#'
#' \describe{
#'     \item{ `date` (date) }{
#'         The date
#'       }
#'    \item{ `code` (chr) }{
#'      The ONS geographical region code
#'    }
#'    \item{ `codeType` (chr) }{
#'      The type of ONS geographical code
#'    }
#'    \item{ `name` (chr) }{
#'      The ONS geographical region name
#'    }
#'     \item{ `who_class` (fct) }{
#'         The WHO short name
#'       }
#'     \item{ `count` (dbl) }{
#'         The number of sequences of this variant identified on this date
#'       }
#'     \item{ `denom` (dbl) }{
#'         The total number of sequences of all variants identified on this date
#'       }
#'  }
#'
#' @usage data("covid_variants_ltla")
#'
#' @docType data
#' @keywords datasets
#' @concept datasets
#' @source <https://covid19.sanger.ac.uk/lineages/raw>
#' Contains Ordnance Survey data © Crown copyright and database right 2019
#' Contains UK Health Security Agency data © Crown copyright and database right 2020
#' Office for National Statistics licensed under the Open Government Licence v.3.0
#'
#' @examples
#' dplyr::glimpse(covid_variants_ltla)
#'
"covid_variants_ltla"
