source(here::here("data-raw/common-data.R"))
# Deprecated in favour of 2019 mid year estimates
# tmp = .cache_download(
#   "https://www.ons.gov.uk/file?uri=/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/populationandhouseholdestimatesenglandandwalescensus2021/census2021/census2021firstresultsenglandwales1.xlsx"
# )
# UK_pop = readxl::read_xlsx(tmp, range = "A8:V383", sheet = "P02")
#
# UK_pop = UK_pop %>%
#   tidyr::pivot_longer(cols = dplyr::starts_with("Aged"), names_to = "Age") %>%
#   dplyr::rename(code = `Area code [note 2]`, name = `Area name`)
#
# regional_population = UK_pop %>%
#   # England only
#   # dplyr::filter(`Area code [note 2]` == "E92000001") %>%
#   dplyr::mutate(
#     Age = Age %>% stringr::str_remove(stringr::fixed("\r\n[note 12]"))
#   ) %>%
#   dplyr::transmute(
#     code,
#     name,
#     class = dplyr::case_when(
#       Age == "Aged 4 years and under" ~ "00_04",
#       Age == "Aged 90 years and over" ~ "90+",
#       Age == "Aged 5 to 9 years" ~ "05_09",
#       TRUE ~
#         stringr::str_replace_all(
#           Age,
#           "^Aged ([0-9]+) to ([0-9]+) years$",
#           "\\1_\\2"
#         )
#     ),
#     population = value
#   ) %>%
#   inner_join(
#     geography %>% filter(codeType %in% c("RGN20", "CTRY20")),
#     by = c("code", "name")
#   ) %>%
#   group_by(
#     name,
#     code,
#     codeType
#   ) %>%
#   dplyr::mutate(
#     baseline_proportion = population / sum(population),
#   ) %>%
#   dplyr::group_by(class)
#
# # Trust LTLA probabilistic mappings
# # https://epiforecasts.io/covid19.nhs.data/reference/load_mapping.html
#
# if (interactive()) {
#   usethis::use_data(regional_population)
# }

## LTLA population ----

tmp2 = .cache_download(
  "https://www.ons.gov.uk/file?uri=/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/populationestimatesforukenglandandwalesscotlandandnorthernireland/mid2019april2019localauthoritydistrictcodes/ukmidyearestimates20192019ladcodes.xls"
)
#
pop_2 = readxl::read_xls(tmp2, range = "A5:CQ435", sheet = "MYE2 - Persons")
uk_population_2019 = pop_2 %>%
  select(code = Code, population = `All ages`) %>%
  inner_join(
    geography %>% filter(codeType %in% c("CTRY20", "RGN20", "LAD19")),
    by = "code"
  ) %>%
  glimpse()

usethis::use_data(uk_population_2019, overwrite = TRUE)

## LTLA population by 5 year ----

pop_3 = pop_2 %>%
  select(-(2:4)) %>%
  tidyr::pivot_longer(cols = -Code, names_to = "age", values_to = "population")
uk_population_2019_by_5yr_age = pop_3 %>%
  transmute(
    code = Code,
    population,
    age = suppressWarnings(case_when(
      !is.na(as.numeric(age)) ~
        sprintf(
          "%02d_%02d",
          as.numeric(age) %/% 5 * 5,
          as.numeric(age) %/% 5 * 5 + 4
        ),
      TRUE ~ age
    ))
  ) %>%
  group_by(code, class = age) %>%
  summarise(population = sum(population)) %>%
  inner_join(
    geography %>% filter(codeType %in% c("CTRY20", "RGN20", "LAD19"))
  ) %>%
  group_by(
    name,
    code,
    codeType
  ) %>%
  dplyr::mutate(
    baseline_proportion = population / sum(population),
  ) %>%
  glimpse()

usethis::use_data(uk_population_2019_by_5yr_age, overwrite = TRUE)


## LTLA population by 10 year ----

uk_population_2019_by_10yr_age = pop_3 %>%
  transmute(
    code = Code,
    population,
    age = suppressWarnings(case_when(
      !is.na(as.numeric(age)) ~
        sprintf(
          "%02d_%02d",
          as.numeric(age) %/% 10 * 10,
          as.numeric(age) %/% 10 * 10 + 9
        ),
      TRUE ~ age
    ))
  ) %>%
  group_by(code, class = age) %>%
  summarise(population = sum(population)) %>%
  inner_join(
    geography %>% filter(codeType %in% c("CTRY20", "RGN20", "LAD19"))
  ) %>%
  group_by(
    name,
    code,
    codeType
  ) %>%
  dplyr::mutate(
    baseline_proportion = population / sum(population),
  ) %>%
  glimpse()

usethis::use_data(uk_population_2019_by_10yr_age, overwrite = TRUE)
