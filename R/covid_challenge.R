## documentation block for `covid_challenge` ----

#' COVID-19 viral load following challenge
#'
#' Viral load from nasal swabs of subset of positive participants from COVID-19
#' human challenge study, as detected by Quantitative PCR. Values were mined from
#' the vector files of the figures. The Y-axis values are approximate as had
#' to be manually read from the scale.
#'
#' Data extracted from figure 2 Viral shedding after a short incubation period
#' peaks rapidly after human SARS-CoV-2 challenge. Panel A (middle left
#' sub panel).
#'
#' Killingley, B., Mann, A.J., Kalinova, M. et al. Safety, tolerability and
#' viral kinetics during SARS-CoV-2 human challenge in young adults. Nat Med 28,
#' 1031–1041 (2022). https://doi.org/10.1038/s41591-022-01780-9
#'
#' For datasets compiled from existing literature, Scientific Data’s policy is
#' that compilers (creators of the secondary compilation dataset and authors of
#' the associated Data Descriptor) are not required by the journal to ask
#' permission from the original authors to extract small amounts of numerical
#' information or other fields. Expected practice is to attribute the original
#' work via citation.
#'
#' \describe{
#'     \item{ `id` (chr) }{
#'         id a unique ID for participant
#'       }
#'     \item{ `log10_viral_load` (dbl) }{
#'         log 10 viral load in copies per millilitre detected
#'       }
#'     \item{ `time` (dbl) }{
#'         time of the sample in days from exposure.
#'       }
#'  }
#'
#' @usage data("covid_challenge")
#'
#' @docType data
#' @keywords datasets
#' @concept datasets
#' @source <https://www.nature.com/articles/s41591-022-01780-9/figures/2>
#' @examples
#' dplyr::glimpse(covid_challenge)
"covid_challenge"

## end of documentation block for `covid_challenge`
