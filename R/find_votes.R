#' Find up-votes and down-votes
#' @param data A data frame, data frame extension (e.g. a tibble).
#' @param cols <[`tidy-select`][dplyr_tidy_select]> One or more unquoted
#'   expressions separated by commas. Variable names can be used as if they
#'   were positions in the data frame, so expressions like `x:y` can
#'   be used to select a range of variables.
#' @param threshold Threshold for heartbeat analysis.

#' @export
find_votes <- function(data, cols, threshold = 1) {
  assertthat::assert_that(threshold > 0,
    msg = "Please a positive number of standard deviations above the mean to define an upvote."
  )
  likert.cols <- dplyr::select(data, {{ cols }})
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
      dplyr::across(tidyselect::all_of(names(likert.cols)), ~
      dplyr::case_when(
        threshold <
          dplyr::if_else(
            .data$individual.sd == 0, 0,
            (.x - .data$individual.mean) / .data$individual.sd
          ) ~ 1,
        -1 * threshold >
          dplyr::if_else(
            .data$individual.sd == 0, 0,
            (.x - .data$individual.mean) / .data$individual.sd
          ) ~ -1,
        TRUE ~ 0
      ))
    )
  return(output)
}
