source(here::here("data-raw/common-data.R"))

if (!interactive()) {
  stop("requires manual download")
} else {
  message("Save to data-raw")
}
browseURL(
  "https://pmc.ncbi.nlm.nih.gov/articles/instance/9796165/bin/jiac317_supplementary_data.zip"
)

# tmp = .cache_download(
#   "https://pmc.ncbi.nlm.nih.gov/articles/instance/9796165/bin/jiac317_supplementary_data.zip",
# )

tmp = here::here("data-raw/jiac317_supplementary_data.zip")
dir = tempdir()
unzip(tmp, "Supplementary_Data_sensitivity_summary.xlsx", exdir = dir)

modelled = readxl::read_excel(
  fs::path(dir, "Supplementary_Data_sensitivity_summary.xlsx"),
  sheet = "All tests"
)


tmp = modelled %>%
  mutate(time = floor(days_since_infection + 0.5)) %>%
  select(-days_since_infection) %>%
  nest(data = -time) %>%
  dplyr::glimpse()

tmp = tmp %>%
  mutate(
    data2 = purrr::map(
      data,
      ~ dplyr::tibble(
        x = c(0, mean(.x$lower_95), mean(.x$median), mean(.x$upper_95), 1),
        y = c(0, 0.025, 0.5, 0.975, 1)
      )
    )
  ) %>%
  mutate(
    qfun = purrr::map(
      data2,
      ~ splinefun(x = .x$y, y = .x$x, method = "monoH.FC")
    )
  ) %>%
  mutate(
    samples = purrr::map(
      qfun,
      ~ dplyr::tibble(
        probability = .x(runif(100, min = 0.01, max = 0.99)),
        boot = 1:100
      )
    )
  )

resampled = tmp %>%
  select(tau = time, samples) %>%
  unnest(samples) %>%
  group_by(boot)

pcr_test_sensitivity = list(modelled = modelled, resampled = resampled)

if (interactive()) {
  usethis::use_data(pcr_test_sensitivity)
}


.logit = function(x) {
  log(x / (1 - x))
}

.expit = function(x) {
  return(1 / (1 + exp(-x)))
}

# https://www.nature.com/articles/s41467-020-20568-4
# Von Kampen et al
# This is from symptom onset not infection

tmp2 = .cache_download(
  "https://static-content.springer.com/esm/art%3A10.1038%2Fs41467-020-20568-4/MediaObjects/41467_2020_20568_MOESM4_ESM.xlsx"
)
original = readxl::read_excel(tmp2, "Sheet1")

raw = original %>%
  mutate(
    tau = `duration of symptoms in days`,
    positive = `virus culture result` == "POS"
  )

model = glm(positive ~ splines::bs(tau), data = raw, family = "binomial")
tmp = predict(model, newdata = dplyr::tibble(tau = 0:50), se.fit = TRUE)

df = dplyr::tibble(
  tau = 0:50,
  mu = tmp$fit,
  sigma = tmp$se.fit
)

resampled = df %>%
  dplyr::filter(mu > .logit(0.001)) %>%
  mutate(
    samples = purrr::map2(
      mu,
      sigma,
      ~ dplyr::tibble(
        probability = .expit(rnorm(100, mean = .x, sd = .y)),
        boot = 1:100
      )
    )
  ) %>%
  select(-mu, -sigma) %>%
  unnest(samples) %>%
  group_by(boot) %>%
  dplyr::glimpse()

viral_shedding = list(
  original = original,
  resampled = resampled
)

if (interactive()) {
  usethis::use_data(viral_shedding)
}

# plot_ip(covid_viral_shedding, alpha = 0.1)

# Human challenge study data:
https://media.springernature.com/full/springer-static/esm/art%3A10.1038%2Fs41591-022-01780-9/MediaObjects/41591_2022_1780_Fig10_ESM.jpg?as=webp