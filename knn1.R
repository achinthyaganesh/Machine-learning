setwd("D:\\ADm_ca")
unemp<-read.csv("ADMnew.csv",stringsAsFactors = FALSE)
str(unemp)
unemp<-unemp[-5]
unemp<-unemp[c(4,1,2,3,5)]
sapply(unemp,function(x) sum(is.na(x)))
unemp$HDI[is.na(unemp$HDI)]<-'0'
unemp$HDI<-as.numeric(unemp$HDI)
str(unemp)
normalize<-function(x){ return ((x-min(x))/ (max(x)-min(x)))}
unemp_n<-as.data.frame(lapply(unemp[c(3,4,5)],normalize))
summary(unemp_n$robots.produced)
train=unemp[1:140,]
test=unemp[141:185,]
train_n=unemp_n[1:140,]
test_n=unemp_n[141:185,]
install.packages("class")
library("class")
unemp_test_pred <- knn(train = train_n, test = test_n,cl = train$Unemployment.rate, k=13)