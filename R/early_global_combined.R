## documentation block for `early_global_combined` ----

#' John Hopkins data from the early outbreak
#'
#' Mined out the commit history of COVID-19 Data Repository by the Center for
#' Systems Science and Engineering (CSSE) at Johns Hopkins University this
#' dataset has early outbreak trajectories (21st Jan 2020 up to March 8th 2020)
#' for a wide range of geographies, for confirmed cases, deaths and recovered
#' cases. These trajectories are based on reported date, but are occasionally
#' revised which will vary from region to region and maybe between different
#' statistics, which show up as infrequent changes in published estimates over
#' time.
#'
#' This data set is originally licensed under the Creative Commons Attribution
#' 4.0 International (CC BY 4.0) by the Johns Hopkins University on behalf of
#' its Center for Systems Science in Engineering. Copyright Johns Hopkins
#' University 2020.
#'
#' \describe{
#'     \item{ `country` (chr) }{
#'         The country
#'       }
#'     \item{ `province` (chr) }{
#'         subnational division
#'       }
#'     \item{ `lat` (dbl) }{
#'         Latitude
#'       }
#'     \item{ `long` (dbl) }{
#'         Longitude
#'       }
#'     \item{ `reported_date` (date) }{
#'         Date of the observation based on reports of cases on this date.
#'       }
#'     \item{ `total_cases` (dbl) }{
#'         Cumulative cases as
#'       }
#'     \item{ `published_date` (date) }{
#'         Date the observation was published on the JHU github.
#'       }
#'     \item{ `total_deaths` (dbl) }{
#'         Cumulative deaths
#'       }
#'     \item{ `total_recovered` (dbl) }{
#'         Cumulative recovered
#'       }
#'  }
#'
#'
#' @usage data("early_global_combined")
#'
#' @docType data
#' @keywords datasets
#' @concept datasets
#' @source <https://github.com/CSSEGISandData/COVID-19>
#' @examples
#' dplyr::glimpse(early_global_combined)
"early_global_combined"

## end of documentation block for `early_global_combined`
