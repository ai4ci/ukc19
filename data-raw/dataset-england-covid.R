source(here::here("data-raw/common-data.R"))
if (!exists("uk_population_2019_by_5yr_age")) {
  source(here::here("data-raw/dataset-regional-population.R"))
}

withr::with_options(list(timeout = 30000), {
  cases_zip = .cache_download(
    "https://archive.ukhsa-dashboard.data.gov.uk/coronavirus-dashboard/cases.zip"
  )
})
# zip::zip_list(cases_zip) %>% View()

## England cases ----

unzip(
  cases_zip,
  files = "Cases/nation_newCasesBySpecimenDateAgeDemographics_areas_letter_E.csv",
  exdir = tempdir()
)
england_cases = readr::read_csv(fs::path(
  tempdir(),
  "Cases/nation_newCasesBySpecimenDateAgeDemographics_areas_letter_E.csv"
))

poplvls = unique(uk_population_2019_by_5yr_age$class)

england_cases_by_5yr_age = england_cases %>%
  filter(value == max(value), .by = c(date, area_code, age)) %>%
  dplyr::filter(age %in% poplvls) %>%
  dplyr::transmute(
    code = area_code,
    date = date,
    class = age,
    count = value
  ) %>% # dplyr::inner_join(england_demographics, by="class") %>%
  dplyr::group_by(date) %>%
  dplyr::mutate(
    denom = sum(count)
  ) %>%
  dplyr::ungroup() %>%
  inner_join(
    uk_population_2019_by_5yr_age %>% select(-baseline_proportion),
    by = join_by(code, class)
  )


if (interactive()) {
  usethis::use_data(england_cases_by_5yr_age, overwrite = TRUE)
}

## LTLA cases ----

unzip(
  cases_zip,
  files = "Cases/ltla_newCasesBySpecimenDate.csv",
  exdir = tempdir()
)
ltla_cases = readr::read_csv(fs::path(
  tempdir(),
  "Cases/ltla_newCasesBySpecimenDate.csv"
))

ltla_cases = ltla_cases %>%
  filter(value == max(value), .by = c(date, area_code)) %>%
  dplyr::transmute(
    code = area_code,
    date = as.Date(date, format = "%d/%m/%Y"),
    count = value
  ) %>%
  inner_join(
    uk_population_2019,
    by = join_by(code)
  )

if (interactive()) {
  usethis::use_data(ltla_cases, overwrite = TRUE)
}

# england_covid_poisson_age_stratified = england_covid %>%
#   ggoutbreak::poisson_locfit_model(window = 14)
#
# if (interactive()) {
#   interfacer::use_dataframe(england_covid_poisson_age_stratified)
# }
#
# england_covid_poisson = england_covid %>%
#   time_aggregate() %>%
#   ggoutbreak::poisson_locfit_model(window = 14)
#
# if (interactive()) {
#   interfacer::use_dataframe(england_covid_poisson)
# }
#
# england_covid_proportion_age_stratified = england_covid %>%
#   ggoutbreak::proportion_locfit_model(window = 14)
#
# if (interactive()) {
#   interfacer::use_dataframe(england_covid_proportion_age_stratified)
# }

## England testing effort ----

withr::with_options(list(timeout = 30000), {
  tests_zip = .cache_download(
    "https://archive.ukhsa-dashboard.data.gov.uk/coronavirus-dashboard/testing.zip"
  )
})


zip::zip_list(cases_zip) %>% View()
unzip(
  cases_zip,
  files = "Cases/nation_newCasesPCROnlyBySpecimenDate.csv",
  exdir = tempdir()
)
england_pcr = readr::read_csv(fs::path(
  tempdir(),
  "Cases/nation_newCasesPCROnlyBySpecimenDate.csv"
))

zip::zip_list(tests_zip) %>% View()
unzip(
  tests_zip,
  files = "Testing/nation_newPCRTestsBySpecimenDate.csv",
  exdir = tempdir()
)
england_tests = readr::read_csv(fs::path(
  tempdir(),
  "Testing/nation_newPCRTestsBySpecimenDate.csv"
))

england_covid_positivity =
  england_pcr %>%
  filter(value == max(value), .by = c(date, area_code)) %>%
  rename(count = value) %>%
  select(-metric, -metric_name, -area_type) %>%
  inner_join(
    england_tests %>%
      filter(value == max(value), .by = c(date, area_code)) %>%
      rename(denom = value) %>%
      select(-metric, -metric_name, -area_type),
    by = c("date", "area_name", "area_code")
  ) %>%
  dplyr::rename(name = area_name, code = area_code) %>%
  mutate(codeType = "CTRY20") %>%
  dplyr::filter(!is.na(count) & !is.na(denom) & name == "England")

if (interactive()) {
  usethis::use_data(england_covid_positivity, overwrite = TRUE)
}


## By age testing effort:
tmp = .cache_download(
  "https://assets.publishing.service.gov.uk/media/62b459ab8fa8f5356d206d7b/demographic-data-tables-23-june-2022.ods"
)
# tmp_by_age = readODS::read_ods(
#   tmp,
#   range = "A3:DF1653",
#   sheet = "Table_8",
#   col_names = TRUE
# )
# denom_by_age = tmp_by_age %>%
#   pivot_longer(
#     cols = -(1:5),
#     names_to = "date_range",
#     values_to = "count",
#     values_transform = as.character
#   ) %>%
#   dplyr::mutate(
#     date = as.Date(stringr::str_replace(
#       date_range,
#       "^.*([0-9]{2})[^0-9]([0-9]{2})[^0-9]([0-9]{2})$",
#       "20\\3-\\2-\\1"
#     )),
#     denom = suppressWarnings(as.numeric(count)),
#     class = case_when(
#       `Age group` == "0-9" ~ "00_09",
#       `Age group` == "Not Stated" ~ NA,
#       `Age group` == "Not Stated" ~ "90+",
#       TRUE ~ stringr::str_replace(`Age group`, "-", "_")
#     )
#   ) %>%
#   # glimpse()
#   dplyr::group_by(class, date) %>%
#   dplyr::summarise(denom = sum(denom, na.rm = TRUE))
# denom_by_age %>% dplyr::glimpse()
#
#
# .date_band = function(t) {
#   r = unique(denom_by_age$date)
#   as.Date(sapply(t, function(x) {
#     if (x < min(r) || x >= max(r + 7)) {
#       return(NA)
#     }
#     return(r[r <= x & lead(r, default = max(r + 7)) > x])
#   }))
# }
#
# ## rebanded population
# tmp_pop = ggoutbreak::england_demographics %>%
#   dplyr::mutate(
#     class = case_when(
#       class %in% c("00_04", "05_09") ~ "00_09",
#       class %in% c("10_14", "15_19") ~ "10_19",
#       class %in% c("20_24", "25_29") ~ "20_29",
#       class %in% c("30_34", "35_39") ~ "30_39",
#       class %in% c("40_44", "45_49") ~ "40_49",
#       class %in% c("50_54", "55_59") ~ "50_59",
#       class %in% c("60_64", "65_69") ~ "60_69",
#       class %in% c("70_74", "75_79") ~ "70_79",
#       class %in% c("80_84", "85_89") ~ "80_89",
#       class %in% c("90+") ~ "90+",
#     )
#   ) %>%
#   group_by(class) %>%
#   summarise(population = sum(population, na.rm = TRUE))
#
# ## rebanded by age positive cases
# england_covid_test_positives = ggoutbreak::england_covid %>%
#   dplyr::mutate(
#     class = case_when(
#       class %in% c("00_04", "05_09") ~ "00_09",
#       class %in% c("10_14", "15_19") ~ "10_19",
#       class %in% c("20_24", "25_29") ~ "20_29",
#       class %in% c("30_34", "35_39") ~ "30_39",
#       class %in% c("40_44", "45_49") ~ "40_49",
#       class %in% c("50_54", "55_59") ~ "50_59",
#       class %in% c("60_64", "65_69") ~ "60_69",
#       class %in% c("70_74", "75_79") ~ "70_79",
#       class %in% c("80_84", "85_89") ~ "80_89",
#       class %in% c("90+") ~ "90+",
#     ),
#     date = .date_band(date)
#   ) %>%
#   dplyr::filter(!is.na(date)) %>%
#   dplyr::group_by(class, date) %>%
#   dplyr::summarise(count = sum(count, na.rm = TRUE)) %>%
#   dplyr::inner_join(denom_by_age, by = c("class", "date")) %>%
#   dplyr::inner_join(tmp_pop, by = "class") %>%
#   dplyr::mutate(time = ggoutbreak::as.time_period(date, "1 week")) %>%
#   dplyr::glimpse()
#
#
# if (interactive()) {
#   interfacer::use_dataframe(england_covid_test_positives)
# }

# test and trace counts suppressed
# tmp_by_age = readODS::read_ods(tmp,range = "A3:DF1653",sheet = "Table_9", col_names = TRUE)
# count_by_age = tmp_by_age %>% pivot_longer(cols=dplyr::starts_with("X"), names_to = "date_range", values_to = "count",values_transform = as.character) %>%
#     dplyr::mutate(
#       date = as.Date(stringr::str_replace(date_range, "^.*([0-9]{2})\\.([0-9]{2})\\.([0-9]{2})$","20\\3-\\2-\\1")),
#       count = suppressWarnings(as.numeric(count)),
#       class = case_when(
#         Age.group == "0-9" ~ "00_09",
#         Age.group == "Not Stated" ~ NA,
#         Age.group == "Not Stated" ~ "90+",
#         TRUE ~ stringr::str_replace(Age.group,"-","_")
#       )
#     ) %>%
#     dplyr::group_by(class,date) %>%
#     dplyr::summarise(count = sum(count,na.rm = TRUE))
# count_by_age %>% dplyr::glimpse()
