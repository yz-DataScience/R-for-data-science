install.packages("fastDummies")
library(fastDummies)
##dummy_cols
data1=data.frame(ID=1:5,season=c("spring","spring","winter","fall","summer"),year=c("2021","2022","2021","2021","2022"))
data1
dummy_cols(data1)
data1_dummy=dummy_cols(data1)
dummy_cols(data1,remove_first_dummy = TRUE)
data1_dummy_new=dummy_cols(data1,remove_first_dummy = TRUE)
