here::i_am("data-raw/dataset-human-challenge.R")

svg = xml2::read_xml(here::here("data-raw/humanchallenge.svg"))

ns = xml2::xml_ns(svg)
containers = xml2::xml_find_all(svg, "//d1:g/*[d1:g/d1:path]", ns = ns)
positions = lapply(containers, function(x) {
  xml2::xml_attr(xml2::xml_find_all(x, "d1:g", ns = ns), "transform")
})
ids = xml2::xml_attr(containers, "id")


# tickymax = xml2::xml_find_all(svg, "//d1:g[@id='ylog10']", ns=ns)
# tickymin = xml2::xml_find_all(svg, "//d1:g[@id='yzero']", ns=ns)
#
# ylog10 = as.numeric(stringr::str_extract(xml2::xml_attr(tickymax,"transform"),",([^,]*)\\)",1))
# yzero = as.numeric(stringr::str_extract(xml2::xml_attr(tickymin,"transform"),",([^,]*)\\)",1))

data = dplyr::tibble(
  ids = ids,
  coords = lapply(positions, function(z) {
    dplyr::tibble(
      x = as.numeric(stringr::str_extract(
        z,
        "translate\\(([^,]+),([^\\)]+)\\)",
        group = 1
      )),
      y = as.numeric(stringr::str_extract(
        z,
        "translate\\(([^,]+),([^\\)]+)\\)",
        group = 2
      ))
    )
  })
)

covid_challenge = data %>%
  dplyr::filter(lapply(coords, nrow) > 2) %>%
  tidyr::unnest(coords) %>%
  dplyr::transmute(
    id = ids,
    log10_viral_load = (y - min(y, na.rm = TRUE)) / (max(y) - min(y)) * 10.2,
    time = round((x - min(x)) / min(diff(unique(x[x < 80])))) / 2 + 1
  ) %>%
  dplyr::mutate(
    time = ifelse(time > 30, 90, time)
  )

usethis::use_data(covid_challenge, overwrite = TRUE)

ggplot2::ggplot(
  covid_challenge,
  ggplot2::aes(x = time, y = log10_viral_load, colour = id)
) +
  ggplot2::geom_line()
