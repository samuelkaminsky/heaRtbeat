likert.items <- c(“Item.A”, “Item.B”)
 
threshold <- 1
#1 < is more than 1 sd above; -1 > is more than 1 sd below
 
mydata.heartbeat <- mydata %>%
  mutate(
    individual.sd = 
 sqrt(rowSums((select(mydata, likert.items) -
          rowMeans(select(mydata, likert.items),na.rm = T))^2, na.rm = T) /
         (rowSums(!is.na(select(mydata, likert.items))) - 1)),
    individual.mean = 
 rowMeans(select(mydata, likert.items),na.rm = T)) %>%
  mutate_at(likert.items, function(x){
threshold < case_when(.$individual.sd == 0 ~ 0,   
 
                   .$individual.sd != 0 ~ 
(x - .$individual.mean) / 
.$individual.sd)})
