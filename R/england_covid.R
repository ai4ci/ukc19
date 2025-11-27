## documentation block for `england_cases_by_5yr_age` ----

#' England only COVID-19 case counts stratified by 5-year age bands
#'
#' A dataset of the daily count of COVID-19 cases by age group in England
#' downloaded from the UKHSA coronavirus API, and formatted for
#' use in `ggoutbreak`. A denominator is calculated which is the overall
#' positive count for all age groups. This data set can be used to calculate
#' group-wise incidence and absolute growth rates and group wise proportions and
#' relative growth rates by age group.
#'
#' You may want `england_covid_positivity` instead which includes the
#' test denominator. The denominator here is the total number of positive
#' tests across all age groups and not the number of tests taken or population
#' size.
#'
#'
#' ## `england_cases_by_5yr_age` dataframe with 26790 rows and 8 columns
#'
#' \describe{
#'     \item{ `name` (chr) }{
#'         The region name
#'       }
#'     \item{ `code` (chr) }{
#'         The region code
#'       }
#'     \item{ `codeType` (chr) }{
#'         The ONS geographical region code type (including year)
#'       }
#'     \item{ `date` (date) }{
#'         The date
#'       }
#'     \item{ `class` (chr) }{
#'         the age group in 5 year age bands
#'       }
#'     \item{ `count` (dbl) }{
#'         the test positives for each age group
#'       }
#'     \item{ `denom` (dbl) }{
#'         the test positives across all age groups
#'       }
#'     \item{ `population` (dbl) }{
#'       the population size for this age group
#'     }
#'  }
#'
#' @usage data("england_cases_by_5yr_age")
#'
#' @docType data
#' @keywords datasets
#' @concept datasets
#' @source <https://ukhsa-dashboard.data.gov.uk/covid-19-archive-data-download>
#'
#' Originally licensed under the [Open Government Licence v3.0](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/)
#'
#' @examples
#' dplyr::glimpse(england_cases_by_5yr_age)
"england_cases_by_5yr_age"

## end of documentation block for `england_cases_by_5yr_age`

## documentation block for `ltla_cases` ----

#' UK-wide COVID-19 case counts stratified by Lower tier local authority
#'
#' A dataset of the daily count of COVID-19 cases by Lower tier local authority
#' in the UK downloaded from the UKHSA coronavirus API, and formatted for
#' use in `ggoutbreak`.
#'
#' ## `ltla_cases` dataframe with 512050 rows and 6 columns
#'
#' \describe{
#'     \item{ `name` (chr) }{
#'         The region name
#'       }
#'     \item{ `code` (chr) }{
#'         The region code
#'       }
#'     \item{ `codeType` (chr) }{
#'         The ONS geographical region code type (including year)
#'       }
#'     \item{ `date` (date) }{
#'         The date
#'       }
#'     \item{ `count` (dbl) }{
#'         the test positives for each LTLA
#'       }
#'     \item{ `population` (dbl) }{
#'       the population size for this geography
#'     }
#'  }
#'
#' @usage data("ltla_cases")
#'
#' @docType data
#' @keywords datasets
#' @concept datasets
#' @source <https://ukhsa-dashboard.data.gov.uk/covid-19-archive-data-download>
#'
#' Originally licensed under the [Open Government Licence v3.0](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/)
#'
#' @examples
#' dplyr::glimpse(ltla_cases)
"ltla_cases"

## end of documentation block for `ltla_cases`

## documentation block for `england_covid_positivity` ----

#' England only COVID-19 case counts with total test numbers
#'
#' The daily count of COVID-19 new PCR positive cases in England. The denominator
#' the overall number of PCR tests conducted. This gives us a proportion of
#' positive tests which can be used to correct for testing effort.
#'
#' ## `england_covid_positivity` dataframe with 2048 rows and 6 columns
#' \describe{
#'     \item{ `name` (chr) }{
#'         The region name
#'       }
#'     \item{ `code` (chr) }{
#'         The region code
#'       }
#'     \item{ `codeType` (chr) }{
#'         The ONS geographical region code type (including year)
#'       }
#'     \item{ `date` (date) }{
#'         The date
#'       }
#'     \item{ `count` (dbl) }{
#'         the count of PCR test positives
#'       }
#'     \item{ `denom` (dbl) }{
#'         the total count of PCR tests conducted on that day
#'       }
#'  }
#'
#'
#' @usage data("england_covid_positivity")
#'
#' @docType data
#' @keywords datasets
#' @concept datasets
#' @source <https://ukhsa-dashboard.data.gov.uk/covid-19-archive-data-download>
#'
#' Originally licensed under the [Open Government Licence v3.0](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/)
#'
#' @examples
#' dplyr::glimpse(england_covid_positivity)
"england_covid_positivity"

## end of documentation block for `england_covid_positivity`
