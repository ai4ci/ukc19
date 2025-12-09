source(here::here("data-raw/common-data.R"))


# April 1st 2020
# cases
"https://raw.githubusercontent.com/CSSEGISandData/COVID-19/42ded9fd324391e65dfdf56fbfb2aff45a2514a6/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv"


"https://raw.githubusercontent.com/CSSEGISandData/COVID-19/f26f02fee4738679b18526a939162a7e74e829ca/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Confirmed.csv"
"https://raw.githubusercontent.com/CSSEGISandData/COVID-19/f26f02fee4738679b18526a939162a7e74e829ca/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Deaths.csv"
"https://raw.githubusercontent.com/CSSEGISandData/COVID-19/f26f02fee4738679b18526a939162a7e74e829ca/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Recovered.csv"

# Mar 8 th~
shas = c(
  "f26f02fee4738679b18526a939162a7e74e829ca",
  "de0e377ab73fcda815bb6cd2f9986bebf15d7104",
  "abcfb889b38c0747e11a10ce01bd1aeb2c42f71f",
  "478bc1a79d105d678ddc5b6aa7ebe36e9377599c",
  "252d52091b9dc7cdec7f90157f3d86d222845e86",
  "10fdd95b61abf5bb1f090c36d5698ee28c7b2656",
  "794bb7f3691a2c386041d7bfab2e1ff3733ec5ab",
  "9f6eb4c3432b72053800a2315da20eac2e97b422",
  "29167273908c796eaca1b728fc6118d290f3ed90",
  "def2e040728dde4384af589a51b93a7bc7b9b488",
  "7e1b98a9cd2761c26759c53fb3e73c3be024b093",
  "04e59288d15a6ca00f60e74918135f7d9f237658",
  "540081eeb4326f2cfd6cc60aeb014e2164c98e37",
  "9df163991026e76b828277ed9ab200d042dfac8a",
  "6a21c2430275d211c587614229c5ea53f45b8c29",
  "3d98800f850578f38639c25c49d3d0d49cd410f3",
  "3897131e2ee457265c45a60acc1e61d5245d99cd",
  "a561fe5f46086b3edea1d8bc681efcb7a52163a8",
  "e220b917fe7f97fa52c6ed28c7d7886c90381c6d",
  "b4c4d1082c88bfd03101f04af940f052b3fe86f9",
  "e54aa6fb96adc0b507caed20ba689af3d9b9da8e",
  "229a0e429c44975e784419a4d0d1dca32d525ccf",
  "8425ea49edb7c17f6ae2264e3922fed63065cd48",
  "079a7069f01666ddb19c813ec7f22368f2dee3a6",
  "3d045fb83311f782775aa78501bfcf2ec53ee59f",
  "1799e7afb762787c2485100a55e3c7a1adfeec52",
  "749741c6b0e4fec13d3799427685016e91b49722",
  "b83f6852d1b0243eef28d52d9259f98cbab06724",
  "cf2d3fff55cb077509a7e403dcc36b25a09d5141"
)


get_data = function(type) {
  bind_rows(lapply(seq_along(shas), function(i) {
    sha = shas[[i]]
    # sha = "079a7069f01666ddb19c813ec7f22368f2dee3a6"
    url = sprintf(
      "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/%s/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-%s.csv",
      sha,
      type
    )
    tmp = tryCatch(
      .cache_download(url),
      error = function(e) {
        url2 = sprintf(
          "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/%s/time_series/time_series_2019-ncov-%s.csv",
          sha,
          type
        )
        .cache_download(url2)
      }
    )

    tmp2 = readr::read_csv(tmp)
    tmp2 %>%
      tidyr::pivot_longer(-(1:4), names_to = "date", values_to = "total") %>%
      dplyr::transmute(
        country = `Country/Region`,
        province = `Province/State`,
        lat = Lat,
        long = Long,
        date = as.Date(date, "%m/%d/%y"),
        total_cases = total,
        reported = as.Date("2020-03-08") - i
      )
  }))
}

confirmed = get_data("Confirmed")
deaths = get_data("Deaths")
recovered = get_data("Recovered")


confirmed2 = confirmed %>%
  arrange(desc(date)) %>%
  dplyr::mutate(date = floor_date(date, unit = "1 day")) %>%
  group_by(country, province, reported, date) %>%
  filter(row_number() == 1) %>%
  ungroup()

deaths2 = deaths %>%
  arrange(desc(date)) %>%
  dplyr::mutate(date = floor_date(date, unit = "1 day")) %>%
  group_by(country, province, reported, date) %>%
  filter(row_number() == 1) %>%
  ungroup() %>%
  rename(total_deaths = total_cases)

recovered2 = recovered %>%
  arrange(desc(date)) %>%
  dplyr::mutate(date = floor_date(date, unit = "1 day")) %>%
  group_by(country, province, reported, date) %>%
  filter(row_number() == 1) %>%
  ungroup() %>%
  rename(total_recovered = total_cases)

early_global_combined = confirmed2 %>%
  dplyr::left_join(
    deaths2,
    by = c("country", "province", "lat", "long", "date", "reported"),
    na_matches = "na"
  ) %>%
  dplyr::left_join(
    recovered2,
    by = c("country", "province", "lat", "long", "date", "reported"),
    na_matches = "na"
  ) %>%
  rename(reported_date = date, published_date = reported)

usethis::use_data(early_global_combined, overwrite = TRUE)

# these ones are different format:
# "9e87a19e40ea87d75a0dc5b817c0f98d29a1df9a"
# "83cf3be7cafc0e7fc9c30ed600f6cd492424aaf3"
# "007a4dccd24a3af8e22e3fe84969f636a963dee6"
#
# "f6638542bd24b0f543431099b7d52a298467bdb8"
