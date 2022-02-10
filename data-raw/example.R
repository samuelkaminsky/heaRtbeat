rows <- 5000
big_survey <- data.frame(
  ID = runif(rows, 10000, 20000),
  group = runif(rows, 1, 3),
  Item_1 = runif(rows, 1, 5),
  Item_2 = runif(rows, 1, 5),
  Item_3 = runif(rows, 1, 5),
  Item_4 = runif(rows, 1, 5),
  Item_5 = runif(rows, 1, 5),
  Item_6 = runif(rows, 1, 5),
  Item_7 = runif(rows, 1, 5),
  Item_8 = runif(rows, 1, 5),
  Item_9 = runif(rows, 1, 5),
  Item_10 = runif(rows, 1, 5),
  Item_11 = runif(rows, 1, 5)
)

usethis::use_data(big_survey, internal = TRUE)
