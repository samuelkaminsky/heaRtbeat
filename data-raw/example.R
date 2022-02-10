rows <- 5000
big_survey <- tibble::tibble(
  id = runif(rows, 10000, 20000),
  group = runif(rows, 1, 3),
  item_1 = runif(rows, 1, 5),
  item_2 = runif(rows, 1, 5),
  item_3 = runif(rows, 1, 5),
  item_4 = runif(rows, 1, 5),
  item_5 = runif(rows, 1, 5),
  item_6 = runif(rows, 1, 5),
  item_7 = runif(rows, 1, 5),
  item_8 = runif(rows, 1, 5),
  item_9 = runif(rows, 1, 5),
  item_10 = runif(rows, 1, 5),
  item_11 = runif(rows, 1, 5)
)

usethis::use_data(big_survey, internal = TRUE, overwrite = TRUE)
