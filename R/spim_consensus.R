## documentation block for `spim_consensus_rt` ----

#' SPI-M-O consensus reproduction number and growth rate estimates
#'
#' A set of consensus estimates for the reproduction number and growth rate
#' of the COVID-19 epidemic in England, produced by the SPI-M-O subgroup of SAGE
#'
#' ## `spim_consensus_rt` dataframe with 113 rows and 5 columns
#'
#' \describe{
#'     \item{ `date` (date) }{
#'         the date
#'       }
#'     \item{ `rt.low` (dbl) }{
#'         the lower estimate of the reproduction number
#'       }
#'     \item{ `rt.high` (dbl) }{
#'         the upper estimate of the reproduction number
#'       }
#'    \item{ `growth.low` (dbl) }{
#'         the lower estimate of the exponential growth rate
#'       }
#'    \item{ `growth.high` (dbl) }{
#'         the higher estimate of the exponential growth rate
#'       }
#'  }
#'
#' @usage data("spim_consensus")
#'
#' @docType data
#' @keywords datasets
#' @concept datasets
#' @source
#' <https://www.gov.uk/guidance/the-r-value-and-growth-rate>
#'
#' Originally licensed under the [Open Government Licence v3.0](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/)
#'
#' @examples
#' dplyr::glimpse(spim_consensus)
"spim_consensus"

## end of documentation block for `spim_consensus_growth_rate`
