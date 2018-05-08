setwd("D:\\ADm_ca")
my_data<-read.csv("ADMnew.csv",stringsAsFactors = FALSE)
str(my_data)
sapply(my_data,function(x) sum(is.na(x)))
ImputedHDI<-my_data$HDI
ImputedHDI[is.na(ImputedHDI)]<-'0'
my_data$HDI<-ImputedHDI
sapply(my_data,function(x) sum(is.na(x)))
str(my_data)

