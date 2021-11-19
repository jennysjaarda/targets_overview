options(tidyverse.quiet = TRUE)
suppressWarnings(library(tidyverse))
library(targets)
tar_option_set(error = "workspace", packages = "tidyverse")
f <- function(arg) {
  stopifnot(arg < 4)
  print("Congratulations, your value is less than 4!")
  return(arg)
}
list(
  tar_target(x, seq_len(4)), # 1 2 3 4
  tar_target(
    y,
    f(arg = x),
    pattern = map(x)
  )
)
