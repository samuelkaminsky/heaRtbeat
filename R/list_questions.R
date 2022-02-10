#
# diagnostics <- data.frame(Questions = colnames(mydata),
#                    Min.Value = apply(mydata, 2,
#                                      FUN = function(x)
#                                        {min(x, na.rm = TRUE)}),
#                    Max.Value = apply(mydata, 2,
#                                      FUN = function(x)
#                                      {max(x, na.rm = TRUE)}),
#                    Missingness = apply(mydata, 2,
#                                      FUN = function(x)
#                                      {mean(is.na(x))}))
#
# likert.items <- diagnostics[which(test$Min.Value > 0 &
#                             test$Max.Value < 6 &
#                             test$Max.Value > test$Min.Value), ]$Questions
# return(likert.items)
# }
