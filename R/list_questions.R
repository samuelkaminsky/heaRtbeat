# test <- data.frame(Questions = colnames(engsat.wide),
#                    Min.Value = apply(engsat.wide, 2,
#                                      FUN = function(x)
#                                        {min(x, na.rm = TRUE)}),
#                    Max.Value = apply(engsat.wide, 2,
#                                      FUN = function(x)
#                                      {max(x, na.rm = TRUE)}),
#                    Missingness = apply(engsat.wide, 2,
#                                      FUN = function(x)
#                                      {mean(is.na(x))}))
#                                      
# likert.items <- test[which(test$Min.Value > 0 &
#                             test$Max.Value < 6 &
#                             test$Max.Value > test$Min.Value), ]$Questions
