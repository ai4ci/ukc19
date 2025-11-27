#' ONS COVID-19 infection survery
#'
#' The COVID-19 ONS infection survey took a random sample of the population
#' and provides an estimate of the prevalence of COVID-19 that is theoretically
#' free from ascertainment bias.
#'
#' \describe{
#'    \item{ `code` (chr) }{
#'      The ONS geographical region code
#'    }
#'    \item{ `codeType` (chr) }{
#'      The type of ONS geographical code
#'    }
#'    \item{ `name` (chr) }{
#'      The ONS geographical region name
#'    }
#'    \item{ `date` (date) }{
#'      A date
#'    }
#'    \item{ `prevalence.0.5` (dbl) }{
#'      the median proportion of people in the region testing positive for
#'      COVID-19
#'    }
#'    \item{ `prevalence.0.025` (dbl) }{
#'      the lower CI of the proportion of people in the region testing
#'      positive for COVID-19
#'    }
#'    \item{ `prevalence.0.975` (dbl) }{
#'      the upper CI of the proportion of people in the region testing positive
#'      for COVID-19
#'    }
#'    \item{ `denom` (int) }{
#'      the sample size on which this estimate was made (daily rate inferred
#'      from weekly sample sizes.)
#'    }
#'  }
#'
#' @source
#' \url{https://www.ons.gov.uk/peoplepopulationandcommunity/healthandsocialcare/conditionsanddiseases/datasets/coronaviruscovid19infectionsurveydata}
#'
#' Originally licensed under the [Open Government Licence v3.0](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/)
#'
#' @usage data("ons_infection_survey")
#'
#' @docType data
#' @keywords datasets
#' @concept datasets
"ons_infection_survey"
