#[logistic regression]

#data load & install
#install.packages("caret", dependencies=TRUE)
library(caret)
rawdata <- read.csv(file="C:/Users/파일 경로/heart.csv", header = TRUE)
str(rawdata)

