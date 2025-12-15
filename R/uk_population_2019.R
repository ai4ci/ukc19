## documentation block for `uk_population_2019` ----

#' Country, regional, and sub-national total population estimates
#'
#' ONS National and sub-national mid-year population estimates for the UK and its
#' constituent countries by administrative area, age and sex (including
#' components of population change, median age and population density).
#'
#' Mid-2019: April 2019 local authority district codes edition of this dataset.
#' This is UK wide and covers country, regions and LTLA (2019 boundaries)
#'
#' ## `uk_population_2019` dataframe with 398 rows and 4 columns
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
#'     \item{ `population` (dbl) }{
#'         the count of the population in that age group
#'       }
#'  }
#'
#'
#' @usage data("uk_population_2019")
#'
#' @docType data
#' @keywords datasets
#' @concept datasets
#' @source <https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates>
#'
#' Originally licensed under the [Open Government Licence v3.0](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/)
#'
#' @examples
#' dplyr::glimpse(uk_population_2019)
"uk_population_2019"

## end of documentation block for `uk_population_2019`

## documentation block for `uk_population_2019_by_5yr_age` ----

#' Country, regional, and sub-national population estimates by 5 year age groups
#'
#' ONS National and sub-national mid-year population estimates for the UK and its
#' constituent countries by administrative area, age and sex (including
#' components of population change, median age and population density).
#'
#' Mid-2019: April 2019 local authority district codes edition of this dataset,
#' this is UK wide and covers country, regions and LTLA (2019 boundaries)
#'
#' Stratified by 5 year age groups
#'
#' ## `uk_population_2019_by_5yr_age` dataframe with 7562 rows and 6 columns
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
#'     \item{ `class` (chr) }{
#'         The age group in 5 year age bands
#'       }
#'     \item{ `population` (dbl) }{
#'         the count of the population in that age group
#'       }
#'     \item{ `baseline_proportion` (dbl) }{
#'         the proportion of the total regional population that is in an age group
#'       }
#'  }
#'
#'
#' @usage data("uk_population_2019_by_5yr_age")
#'
#' @docType data
#' @keywords datasets
#' @concept datasets
#' @source <https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates>
#'
#' Originally licensed under the [Open Government Licence v3.0](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/)
#'
#' @examples
#' dplyr::glimpse(uk_population_2019_by_5yr_age)
"uk_population_2019_by_5yr_age"

## end of documentation block for `uk_population_2019_by_5yr_age`

## documentation block for `uk_population_2019_by_10yr_age` ----

#' Country, regional, and sub-national population estimates by 10 year age groups
#'
#' ONS National and sub-national mid-year population estimates for the UK and its
#' constituent countries by administrative area, age and sex (including
#' components of population change, median age and population density).
#'
#' Mid-2019: April 2019 local authority district codes edition of this dataset,
#' this is UK wide and covers country, regions and LTLA (2019 boundaries)
#'
#' Stratified by 10 year age groups
#'
#' ## `uk_population_2019_by_10yr_age` dataframe with 3980 rows and 6 columns
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
#'     \item{ `class` (chr) }{
#'         The age group in 10 year age bands
#'       }
#'     \item{ `population` (dbl) }{
#'         the count of the population in that age group
#'       }
#'     \item{ `baseline_proportion` (dbl) }{
#'         the proportion of the total regional population that is in an age group
#'       }
#'  }
#'
#'
#' @usage data("uk_population_2019_by_10yr_age")
#'
#' @docType data
#' @keywords datasets
#' @concept datasets
#' @source <https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates>
#'
#' Originally licensed under the [Open Government Licence v3.0](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/)
#'
#' @examples
#' dplyr::glimpse(uk_population_2019_by_10yr_age)
"uk_population_2019_by_10yr_age"

## end of documentation block for `uk_population_2019_by_10yr_age`
