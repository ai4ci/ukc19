#' NHS digital contact tracing activity
#'
#' Summary data collected as part of the NHS digital contact tracing app
#' monitoring. This describes the number of alerts issued, and venue "check-ins".
#'
#' \describe{
#'     \item{ `date` (date) }{
#'         The date
#'       }
#'     \item{ `alerts` (int) }{
#'         Number of alerts
#'       }
#'     \item{ `visits` (int) }{
#'         Number of check-ins
#'       }
#'  }
#'
#' @usage data("nhs_app")
#'
#' @docType data
#' @keywords datasets
#' @concept datasets
#' @source <https://www.gov.uk/government/publications/nhs-covid-19-app-statistics>
#'
#' Originally licensed under the [Open Government Licence v3.0](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/)
#'
#' @examples
#' dplyr::glimpse(nhs_app)
"nhs_app"
