
library(targets)
source("R/functions.R")
options(tidyverse.quiet = TRUE)
suppressWarnings(library(tidyverse))
options(crayon.enabled = FALSE)

tar_option_set(packages = c("biglm"))
list(
  tar_target(
    raw_data_file,
    "data/raw_data.csv",
    format = "file",
    deployment = "main"
  ),
  tar_target(
    raw_data,
    read_csv(raw_data_file, col_types = cols()),
    deployment = "main"
  ),
  tar_target(
    data,
    raw_data %>%
      filter(!is.na(Ozone))
  ),
  tar_target(hist, create_plot(data)),
  tar_target(fit, biglm(Ozone ~ Wind + Temp, data))
)
