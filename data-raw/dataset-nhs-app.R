source(here::here("data-raw/common-data.R"))
## Venue check ins and pings.
tmp = .cache_download(
  "https://assets.publishing.service.gov.uk/media/64662cfde140700013b6e221/covid19_app_country_specific_dataset.csv"
)
tmp = readr::read_csv(tmp, show_col_types = FALSE)

nhs_app = tmp %>%
  dplyr::filter(`Country (Wlad)` == "England / Lloegr") %>%
  dplyr::transmute(
    date = `Week starting (Wythnos yn dechrau)`,
    alerts = as.integer(`Contact tracing alert (Hysbysiadau olrhain cyswllt)`),
    visits = as.integer(`Check-ins (Cofrestriadau)`)
  )

if (interactive()) {
  usethis::use_data(nhs_app, overwrite = TRUE)
}
