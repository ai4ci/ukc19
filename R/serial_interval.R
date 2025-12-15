## documentation block for `du_serial_interval` ----

#' Serial interval from publicly reported cases
#'
#' Data on which initial serial interval estimates were performed by Du et al,
#' 2020.
#'
#' "This is a publication of the U.S. Government. This publication is in the
#' public domain and is therefore without copyright. All text from this work may
#' be reprinted freely. Use of these materials should be properly cited."
#'
#'
#' ## `du_serial_interval` dataframe with 752 rows and 3 columns
#'
#' \describe{
#'     \item{ `id` (dbl) }{
#'         Unique case id
#'       }
#'     \item{ `symptom_onset` (dbl) }{
#'         Time of symptom onset as an integer
#'       }
#'     \item{ `infector_id` (dbl) }{
#'         Case id of infector where known
#'       }
#'  }
#'
#' @references
#' Z. Du, X. Xu, Y. Wu, L. Wang, B. J. Cowling, and L. A. Meyers,
#' ‘Serial Interval of COVID-19 among Publicly Reported Confirmed Cases’, Emerg
#' Infect Dis, vol. 26, no. 6, pp. 1341–1343, Jun. 2020, doi:
#' 10.3201/eid2606.200357.
#'
#' @usage data("du_serial_interval")
#'
#' @docType data
#' @keywords datasets
#' @concept datasets
#' @source <https://github.com/MeyersLabUTexas/COVID-19>
#'
#' @examples
#' dplyr::glimpse(du_serial_interval)
"du_serial_interval"

## end of documentation block for `du_serial_interval`

## documentation block for `ganyani_clusters` ----

#' COVID-19 cluster outbreaks data from Tianjin and Singapore
#'
#' Data from which serial interval and generation time estimates were performed
#' by Ganyani et al, 2020
#'
#' Original article licensed under
#' [Creative Commons 4.0](https://creativecommons.org/licenses/by/4.0/).
#' Data was cleansed and formatted for R.
#'
#' ## `ganyani_clusters` dataframe with 196 rows and 6 columns
#'
#' \describe{
#'     \item{ `id` (dbl) }{
#'         a unique id for a person (unique within the `source`)
#'       }
#'     \item{ `contacts` (list dbl) }{
#'         list of known contacts in the cluster
#'       }
#'     \item{ `cluster_id` (dbl) }{
#'         id of a cluster  (unique within the `source`)
#'       }
#'     \item{ `symptom_onset` (date) }{
#'         symptom onset date
#'       }
#'     \item{ `known_primary_case` (lgl) }{
#'         flag if this person is know to be the primary case in the cluster
#'       }
#'     \item{ `source` (chr) }{
#'         geographical source of the data
#'       }
#'  }
#'
#' @references
#' Ganyani T, Kremer C, Chen D, Torneri A, Faes C, Wallinga J, Hens N.
#' Estimating the generation interval for coronavirus disease (COVID-19) based
#' on symptom onset data, March 2020. Euro Surveill. 2020 Apr;25(17):2000257.
#' doi: 10.2807/1560-7917.ES.2020.25.17.2000257. PMID: 32372755; PMCID:
#' PMC7201952.
#'
#'
#' @usage data("ganyani_clusters")
#'
#' @docType data
#' @keywords datasets
#' @concept datasets
#' @source <https://github.com/cecilekremer/COVID19>
#'
#' @examples
#' dplyr::glimpse(ganyani_clusters)
"ganyani_clusters"

## end of documentation block for `ganyani_clusters`
