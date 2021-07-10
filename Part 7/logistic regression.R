#[logistic regression]

#data load & install
#install.packages("caret", dependencies=TRUE)
library(caret)
rawdata <- read.csv(file="C:/Users/파일 경로/heart.csv", header = TRUE)
str(rawdata)

#타겟 종속변수 범주화
rawdata$target <- as.factor(rawdata$target)
unique(rawdata$target)

#연속형 독립변수 범주화
rawdata$age <- scale(rawdata$age)
rawdata$trestbps <- scale(rawdata$trestbps)
rawdata$chol <- scale(rawdata$chol)
rawdata$thalach <- scale(rawdata$thalach)
rawdata$oldpeak <- scale(rawdata$oldpeak)
rawdata$slope <- scale(rawdata$slope)

#범주형 독립변수 범주화
newdata <- rawdata
factorVar <- c("sex", "cp", "fbs", "restecg", "exang", "ca", "thal")
newdata[ ,factorVar] = lapply(newdata[ ,factorVar], factor)