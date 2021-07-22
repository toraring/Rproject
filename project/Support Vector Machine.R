#[Support Vector Machine]

#install
#install.packages("caret", dependencies=TRUE)
library(caret)

#data load
rawdata <- read.csv(file="C:/Users/내 파일경로/wine.csv", header = TRUE)
rawdata$Class <- as.factor(rawdata$Class)
str(rawdata)

#divided training test
analdata <- rawdata
set.seed(2020)
datatotal <- sort(sample(nrow(analdata), nrow(analdata)*.7))
train <- rawdata[datatotal,]
test <- rawdata[-datatotal,]
train_x <- train[,1:13]
train_y <- train[,14]
test_x <- test[,1:13]
test_y <- test[,14]
str(train)