#[Support Vector Machine]

#install
#install.packages("caret", dependencies=TRUE)
library(caret)

#data load
rawdata <- read.csv(file="C:/Users/내 파일경로/wine.csv", header = TRUE)
rawdata$Class <- as.factor(rawdata$Class)
str(rawdata)
