## documentation block for `pcr_test_sensitivity` ----

#' COVID PCR test sensitivity over time
#'
#' Rachelle N Binny, Patricia Priest, Nigel P French, Matthew Parry, Audrey
#' Lustig, Shaun C Hendy, Oliver J Maclaren, Kannan M Ridings, Nicholas Steyn,
#' Giorgia Vattiato, Michael J Plank, Sensitivity of Reverse Transcription
#' Polymerase Chain Reaction Tests for Severe Acute Respiratory Syndrome
#' Coronavirus 2 Through Time, The Journal of Infectious Diseases, Volume 227,
#' Issue 1, 1 January 2023, Pages 9–17, https://doi.org/10.1093/infdis/jiac317
#'
#' ## `pcr_test_sensitivity` named list with 2 items
#'
#' \describe{
#'     \item{ `modelled` (df modelled*) }{
#'         Original data from supplementary
#'       }
#'     \item{ `resampled` (df resampled*) }{
#'         resampled description
#'       }
#'  }
#'
#'
#' ## `df modelled` dataframe with 501 rows and 4 columns
#'
#' Model output
#'
#' \describe{
#'     \item{ `days_since_infection` (dbl) }{
#'         days since infection
#'       }
#'     \item{ `median` (dbl) }{
#'         median sensitivity
#'       }
#'     \item{ `lower_95` (dbl) }{
#'         lower 95% CI of sensitivity
#'       }
#'     \item{ `upper_95` (dbl) }{
#'         upper 95% CI of sensitivity
#'       }
#'  }
#'
#' ## `df resampled` dataframe with 5100 rows and 3 columns
#'
#' \describe{
#'     \item{ `tau` (dbl) }{
#'         days since infection
#'       }
#'     \item{ `probability` (dbl) }{
#'         the sensitivity as a probability of detection
#'       }
#'     \item{ `boot` (int) }{
#'         a bootstrap identifier
#'       }
#'  }
#'
#'
#' @usage data("pcr_test_sensitivity")
#'
#' @docType data
#' @keywords datasets
#' @concept datasets
#' @source <https://pmc.ncbi.nlm.nih.gov/articles/instance/9796165/bin/jiac317_supplementary_data.zip>
"pcr_test_sensitivity"

## end of documentation block for `pcr_test_sensitivity`

## documentation block for `viral_shedding` ----

#' COVID-19 Viral shedding data
#'
#' van Kampen, J.J.A., van de Vijver, D.A.M.C., Fraaij, P.L.A. et al. Duration
#' and key determinants of infectious virus shedding in hospitalized patients
#' with coronavirus disease-2019 (COVID-19). Nat Commun 12, 267 (2021).
#' https://doi.org/10.1038/s41467-020-20568-4
#'
#' ## `viral_shedding` named list with 2 items
#'
#' \describe{
#'     \item{ `original` (df original*) }{
#'         original description
#'       }
#'     \item{ `resampled` (df resampled*) }{
#'         resampled description
#'       }
#'  }
#'
#'
#' ## `df original` dataframe with 690 rows and 4 columns
#'
#' \describe{
#'     \item{ `duration of symptoms in days` (dbl) }{
#'         duration of symptoms in days
#'       }
#'     \item{ `RNA copies per mL` (chr) }{
#'         RNA copies per mL
#'       }
#'     \item{ `PRNT titer` (chr) }{
#'         PRNT titer
#'       }
#'     \item{ `virus culture result` (chr) }{
#'         virus culture result
#'       }
#'  }
#'
#'
#' ## `df resampled` dataframe with 2600 rows and 3 columns
#'
#' \describe{
#'     \item{ `tau` (int) }{
#'         time from syptom onset to measurement
#'       }
#'     \item{ `probability` (dbl) }{
#'         probability of detected viral excretion
#'       }
#'     \item{ `boot` (int) }{
#'         a bootstrap identifier
#'       }
#'  }
#'
#'
#' @usage data("viral_shedding")
#'
#' @docType data
#' @keywords datasets
#' @concept datasets
#' @source <https://static-content.springer.com/esm/art%3A10.1038%2Fs41467-020-20568-4/MediaObjects/41467_2020_20568_MOESM4_ESM.xlsx>
"viral_shedding"

## end of documentation block for `viral_shedding`
