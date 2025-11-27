packages = c(
  "here",
  "tidyverse",
  "fs",
  "rappdirs",
  "rlang",
  "stringr",
  "utils"
)

options("cache.path" = rappdirs::user_cache_dir("ukc19"))

for (pkg in packages) {
  if (!requireNamespace(pkg, quietly = TRUE)) install.packages(pkg)
}

here::i_am("data-raw/common-data.R")
source(here::here("data-raw/import-standalone-cache.R"))
library(tidyverse)


geography = dplyr::bind_rows(
  readr::read_csv(
    here::here(
      "data-raw/ref/Regions_(Dec_2020)_Names_and_Codes_in_England.csv"
    ),
    show_col_types = FALSE
  ) %>%
    transmute(name = RGN20NM, code = RGN20CD, codeType = "RGN20"),
  readr::read_csv(
    here::here(
      "data-raw/ref/Countries_(Dec_2020)_Names_and_Codes_in_the_United_Kingdom.csv"
    ),
    show_col_types = FALSE
  ) %>%
    transmute(name = CTRY20NM, code = CTRY20CD, codeType = "CTRY20"),
  readr::read_csv(
    here::here(
      "data-raw/ref/LAD_(Dec_2019)_Names_and_Codes_in_the_United_Kingdom.csv"
    ),
    show_col_types = FALSE
  ) %>%
    transmute(name = LAD19NM, code = LAD19CD, codeType = "LAD19"),
  readr::read_csv(
    here::here(
      "data-raw/ref/LAD_(Dec_2020)_Names_and_Codes_in_the_United_Kingdom.csv"
    ),
    show_col_types = FALSE
  ) %>%
    transmute(name = LAD20NM, code = LAD20CD, codeType = "LAD20"),
  readr::read_csv(
    here::here(
      "data-raw/ref/Local_Authority_Districts_(December_2022)_Names_and_Codes_in_the_United_Kingdom.csv"
    ),
    show_col_types = FALSE
  ) %>%
    transmute(name = LAD22NM, code = LAD22CD, codeType = "LAD22"),
  readr::read_csv(
    here::here(
      "data-raw/ref/Local_Authority_Districts_(April_2023)_Names_and_Codes_in_the_United_Kingdom.csv"
    ),
    show_col_types = FALSE
  ) %>%
    transmute(name = LAD23NM, code = LAD23CD, codeType = "LAD23")
)

try(usethis::use_data(geography), silent = TRUE)
