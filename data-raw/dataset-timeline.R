source(here::here("data-raw/common-data.R"))

timeline = readxl::read_excel(here::here("data-raw/ref/COVID Dates.xlsx"))
timeline = timeline %>%
  dplyr::transmute(
    label = Label,
    start = as.Date(`Start date`),
    end = as.Date(`End date`)
  )

if (interactive()) {
  usethis::use_data(timeline, overwrite = TRUE)
}
