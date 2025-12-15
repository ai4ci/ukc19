#' Timeline of events
#'
#' Major events in the UK COVID-19 pandemic, limited to lock-downs, vaccination
#' roll-out and first identification of major variants.
#'
#' \describe{
#'     \item{ `label` (chr) }{ The event }
#'     \item{ `start` (date) }{ The start date }
#'     \item{ `end` (date) }{ The end date if a period }
#'  }
#'
#' @source <https://en.wikipedia.org/wiki/Timeline_of_the_COVID-19_pandemic_in_the_United_Kingdom>
#'
#' @usage data("timeline")
#'
#' @docType data
#' @keywords datasets
#' @concept datasets
#'
#' @examples
#' dplyr::glimpse(timeline)
"timeline"
