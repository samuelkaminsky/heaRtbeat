find_votes <- function(data, ..., threshold = 1) {
  assertthat::assert_that(is.data.frame(data))
  likert.cols <- dplyr::select(data, {{ likert.items }})
  output <-
    data %>%
    dplyr::mutate(
      individual.sd =
        sqrt(
          rowSums((likert.cols - rowMeans(likert.cols, na.rm = TRUE))^2,
            na.rm = TRUE
          ) / (rowSums(!is.na(likert.cols)) - 1)
        ),
      individual.mean = rowMeans(likert.cols, na.rm = TRUE),
      dplyr::across(tidyselect::all_of(likert.items), ~
      threshold < dplyr::if_else(
        .data$individual.sd == 0, 0,
        (.x - .data$individual.mean) / .data$individual.sd
      ))
    )
  return(output)
}
