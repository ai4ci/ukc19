source(here::here("data-raw/common-data.R"))

tmp = .cache_download(
  "https://assets.publishing.service.gov.uk/media/63a46e3ed3bf7f375c7d833d/221221_R_and_growth_rate_time_series_for_publication_v1.0.ods"
)

consensus_rt = readODS::read_ods(
  tmp,
  range = "B10:F122",
  sheet = "Table1_-_R",
  col_names = FALSE
)
spim_consensus_rt = consensus_rt %>%
  dplyr::transmute(
    date = as.Date(...1, "%d-%b-%y"),
    rt.low = ...4,
    rt.high = ...5
  )


consensus_growth_rate = readODS::read_ods(
  tmp,
  range = "B10:F122",
  sheet = "Table2_-_Growth_rate",
  col_names = FALSE
)
spim_consensus_growth_rate = consensus_growth_rate %>%
  dplyr::transmute(
    date = as.Date(...1, "%d-%b-%y"),
    growth.low = ...4 / 100,
    growth.high = ...5 / 100
  )


spim_consensus = dplyr::left_join(
  spim_consensus_rt,
  spim_consensus_growth_rate,
  by = "date"
)

if (interactive()) {
  usethis::use_data(spim_consensus, overwrite = TRUE)
}
