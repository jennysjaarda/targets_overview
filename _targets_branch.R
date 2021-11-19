library(targets)
list(
  tar_target(w, c(1, 2)),
  tar_target(x, c(10, 20)),
  tar_target(y, w + x, pattern = map(w, x)),
  tar_target(z, sum(y)),
  tar_target(z2, length(y), pattern = map(y))
)
