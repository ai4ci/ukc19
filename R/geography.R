#' UK geographic codes an CTRY, RGN and LAD level
#'
#' Geographic codes and names from the ONS for administrative regions of the UK
#' relevant to the UKs covid response. There are multiple entries for lower tier
#' local authority codes as these changed during the course of the pandemic.
#'
#' ## `geography` dataframe with 1512 rows and 3 columns
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
#'  }
#'
#' @usage data("geography")
#'
#' @docType data
#' @keywords datasets
#' @concept datasets
#' @source <https://geoportal.statistics.gov.uk/>
#'
#' Originally licensed under the [Open Government Licence v3.0](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/)
#'
#' @examples
#' dplyr::glimpse(geography)
"geography"

## end of documentation block for `geography`
