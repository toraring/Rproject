#[logistic regression]

#data load & install
#install.packages("caret", dependencies=TRUE)
library(caret)
rawdata <- read.csv(file="C:/Users/파일 경로/heart.csv", header = TRUE)
str(rawdata)

#타겟 종속변수 범주화
rawdata$target <- as.factor(rawdata$target)
unique(rawdata$target)