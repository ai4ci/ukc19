source(here::here("data-raw/common-data.R"))

tmp = .cache_download(
  "https://www.ons.gov.uk/file?uri=/peoplepopulationandcommunity/healthandsocialcare/conditionsanddiseases/datasets/coronaviruscovid19infectionsurveydata/2023/20230310covid19infectionsurveydatasetsengland.xlsx"
)
modelled = readxl::read_excel(tmp, sheet = "1k", skip = 5)

cleaned = modelled %>%
  filter(Date != "Date" & !stringr::str_starts(Date, "Publication")) %>%
  filter(dplyr::row_number() == 1, .by = Date) %>%
  mutate(Date = suppressWarnings(as.integer(Date))) %>%
  filter(!is.na(Date)) %>%
  pivot_longer(
    cols = c(-Date),
    names_sep = "\r\n",
    names_to = c("Geography", "Feature")
  ) %>%
  mutate(Feature = trimws(Feature)) %>%
  pivot_wider(names_from = Feature, values_from = value) %>%
  transmute(
    date = as.Date(Date, origin = "1899-12-30"),
    name = Geography,
    prevalence.0.5 = as.numeric(`Modelled % testing positive for COVID-19`) /
      100,
    prevalence.0.025 = as.numeric(
      `95% Lower credible interval for percentage`
    ) /
      100,
    prevalence.0.975 = as.numeric(
      `95% Upper credible interval for percentage`
    ) /
      100
  )


tested = readxl::read_excel(
  tmp,
  sheet = "1d",
  skip = 5,
  col_types = "text",
  na = "[c]"
)

cleaned_tested = tested %>%
  mutate(
    start = as.Date(
      stringr::str_extract(
        `Non-overlapping 14-day period`,
        "(.*) to ",
        group = 1
      ),
      format = "%e %B %Y"
    ),
    end = as.Date(
      stringr::str_extract(
        `Non-overlapping 14-day period`,
        " to (.*)",
        group = 1
      ),
      format = "%e %B %Y"
    )
  ) %>%
  select(-`Non-overlapping 14-day period`) %>%
  pivot_longer(
    cols = c(-start, -end),
    names_sep = "\r\n",
    names_to = c("name", "Feature")
  ) %>%
  filter(Feature == "Total number of tests in sample") %>%
  mutate(denom = as.numeric(value)) %>%
  select(-Feature, -value)

ons_infection_survey = cleaned %>%
  left_join(
    cleaned_tested,
    by = join_by(between(date, start, end, bounds = "[]"), name)
  ) %>%
  left_join(
    geography,
    by = "name"
  ) %>%
  mutate(
    denom = as.integer(denom / as.integer(end - start))
  ) %>%
  select(-start, -end) %>%
  select(code, codeType, name, date, everything()) %>%
  group_by(code, codeType, name)

usethis::use_data(ons_infection_survey, overwrite = TRUE)
