#' @export
find_votes <- function(data, ..., threshold = 1) {
  assertthat::assert_that(is.data.frame(data))
  assertthat::assert_that(threshold > 0,
    msg = "Please a positive number of standard deviations above the mean to define an upvote.")
  likert.cols <- dplyr::select(data, {{ ... }})
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
      dplyr::across(tidyselect::all_of(...), ~
        case_when(
          threshold <
          dplyr::if_else(
            .data$individual.sd == 0, 0,
            (.x - .data$individual.mean) / .data$individual.sd
          ) ~ 1,
          -1*threshold >
          dplyr::if_else(
            .data$individual.sd == 0, 0,
            (.x - .data$individual.mean) / .data$individual.sd
          ) ~ -1,
          TRUE ~ 0
        )
      )
    )
  return(output)
}
