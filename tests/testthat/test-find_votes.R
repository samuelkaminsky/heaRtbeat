testthat::test_that("Correct columns", {
  testthat::expect_length(
    find_votes(big_survey, c("item_1", "item_2")), ncol(big_survey) + 2L
    )
  testthat::expect_length(
    find_votes(big_survey, c(item_1, item_2)), ncol(big_survey) + 2L
  )
  testthat::expect_length(
    find_votes(big_survey, starts_with("item")), ncol(big_survey) + 2L
  )
})
