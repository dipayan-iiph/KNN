player_stat<-read.csv("./Premier_League_22_23.csv")

#"Forward"    "Midfielder" "Defender"   "Goalkeeper"

Forward<-player_stat[player_stat$Position=="Forward",c(2,3,4,5,7,10,12,13,15,17,21,22,23)]
library(class)
Forward$class<-ifelse(Forward$Team=="Manchester City"|
                  Forward$Team=="Tottenham Hotspur" |
                    Forward$Team=="Liverpool" |
                    Forward$Team=="Arsenal" |
                    Forward$Team=="Manchester United" |
                    Forward$Team=="Chelsea","High","Other" )

set.seed(12345)
split<- sample(c(rep(0, 0.7 * nrow(Forward)), rep(1, 0.3 * nrow(Forward))))
train<-Forward[split==0,]
train<-train[complete.cases(train),]
test<-Forward[split==1,]
test<-test[complete.cases(test),]
pred<-knn(train[,-c(1,2,5,14)],test[,-c(1,2,5,14)],cl=train$class,k=4)
table(test$class,pred)
