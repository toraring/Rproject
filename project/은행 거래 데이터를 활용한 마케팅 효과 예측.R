#[은행 거래 데이터를 활용한 마케팅 효과 예측]

#install.packages("caret", dependencies=TRUE)
library(caret)

#data load
rawdata1 <- read.csv("C:/Users/Cheolwon/Documents/dataset/project/bankmarket/bank.csv", header=TRUE)
str(rawdata1)