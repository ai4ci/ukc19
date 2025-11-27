## Serial interval data

# Ganyani
taijin = readr::read_csv(
  "https://raw.githubusercontent.com/cecilekremer/COVID19/refs/heads/master/Tianjin%20cluster%20cases%20(updated%20Feb%2029).csv",
  col_types = cols(
    caseID = col_character(),
    CaseID = col_double(),
    ClusterID = col_double(),
    clusterID = col_character(),
    Source = col_character(),
    Source2 = col_character(),
    source = col_character(),
    ...8 = col_logical(),
    symptom_onset = col_date("%d/%m/%Y"),
    relationship = col_character(),
    secondary = col_double(),
    not_secondary = col_double(),
    gender = col_double(),
    age = col_double(),
    notes = col_character()
  )
)

taijin2 = taijin %>%
  transmute(
    id = CaseID,
    contacts = purrr::map2(Source, Source2, \(s1, s2) {
      tmp = str_split_1(paste0(c(s1, s2), collapse = ","), "\\s*,\\s*")
      as.numeric(unique(tmp[tmp != "0"]))
    }),
    cluster_id = ClusterID,
    symptom_onset = symptom_onset,
    known_primary_case = isTRUE(not_secondary != 0),
    source = "tianjin"
  ) %>%
  glimpse()


tmp = .cache_download(
  "https://github.com/cecilekremer/COVID19/raw/refs/heads/master/singapore_data_paper.xlsx"
)
singapore = readxl::read_xlsx(tmp, col_names = TRUE)
singapore2 = singapore %>%
  transmute(
    id = CASE,
    contacts = purrr::map(`KNOWN CONTACTS`, \(s1) {
      if (is.na(s1)) {
        return(numeric())
      }
      tmp = str_split_1(s1, "\\s*,\\s*")
      as.numeric(unique(tmp[tmp != "0"]))
    }),
    cluster_id = CLUSTER,
    symptom_onset = as.Date(`SYMPTOM ONSET`),
    known_primary_case = str_detect(Notes, "Wuhan"),
    source = "singapore"
  )

ganyani_clusters = dplyr::bind_rows(taijin2, singapore2)

usethis::use_data(ganyani_clusters)

## Serial interval data from meta-analysis paper.
#
# si_sample_data = read.table("https://raw.githubusercontent.com/terminological/serial-interval/main/resampled-truncated-empirical-si-sample.txt")
#
# covid_ip = si_sample_data %>%
#   dplyr::mutate(tau = dplyr::row_number()-1) %>%
#   tidyr::pivot_longer(cols = -(tau), names_to = "boot", names_prefix = "V", values_to = "probability") %>%
#   dplyr::filter(tau>=0) %>%
#   dplyr::group_by(boot) %>%
#   dplyr::mutate(
#     probability = probability/sum(probability),
#     boot = as.numeric(boot),
#     a0 = c(0,seq(0.5,length.out = dplyr::n()-1)),
#     a1 = seq(0.5,length.out = dplyr::n()),
#   ) %>%
#   dplyr::arrange(boot,tau)
#
# if(interactive()) {
#   #usethis::use_data(covid_ip, overwrite = TRUE)
#   interfacer::use_dataframe(covid_ip)
# }
#
#
# withr::with_seed(101, {
#
# ganyani_ip =
#   ggoutbreak::make_gamma_ip(5.2, 3.78, 6.78, 1.72, 0.91, 3.93, epiestim_compat=TRUE)
#
# if(interactive()) {
#   #usethis::use_data(ganyani_ip, overwrite = TRUE)
#   interfacer::use_dataframe(ganyani_ip)
# }
#
# ganyani_ip_2 =
#   ggoutbreak::make_gamma_ip(5.2, 3.78, 6.78, 1.72, 0.91, 3.93, epiestim_compat=FALSE)
#
# if(interactive()) {
#   #usethis::use_data(ganyani_ip_2, overwrite = TRUE)
#   interfacer::use_dataframe(ganyani_ip_2)
# }
#
# })

# Du et al. data
# https://github.com/MeyersLabUTexas/COVID-19/raw/refs/heads/master/Table%20S5.xlsx
# [1] Z. Du, X. Xu, Y. Wu, L. Wang, B. J. Cowling, and L. A. Meyers, ‘Serial Interval of COVID-19 among Publicly Reported Confirmed Cases’, Emerg Infect Dis, vol. 26, no. 6, pp. 1341–1343, Jun. 2020, doi: 10.3201/eid2606.200357.

tmp = .cache_download(
  "https://github.com/MeyersLabUTexas/COVID-19/raw/refs/heads/master/Table%20S5.xlsx"
)
du_data = readxl::read_excel(tmp, skip = 1)

du_serial_interval = dplyr::bind_rows(
  du_data %>%
    transmute(id = `Index ID`, symptom_onset = `Index - symptom onset date`),
  du_data %>%
    transmute(
      id = `Secondary ID`,
      symptom_onset = `Seconday - symptom onset date`
    )
) %>%
  distinct() %>%
  left_join(
    du_data %>% select(id = `Secondary ID`, infector_id = `Index ID`),
    by = "id"
  ) %>%
  glimpse()

usethis::use_data(du_serial_interval)

# Diamond Princess:
# https://id-info.jihs.go.jp/niid/en/2019-ncov-e/9417-covid-dp-fe-02.html
# https://pmc.ncbi.nlm.nih.gov/articles/PMC7078829/#app1
# https://stacks.cdc.gov/view/cdc/96906
