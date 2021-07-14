#[Boosted Logistic Regression of stock]

#install
install.packages("caret",dependencies = TRUE)

library(caret)
library(dplyr)
train <- read.csv("C://RProject//Rproject//homework//stock.adj_close.csv")
ctrl <- trainControl(method = "repeatedcv", number = 5, repeats = 2)


#1. train와 데이터의 타겟변수 Symbol를 범주형 데이터로 변경. 
View(train)
train$Symbol <- as.factor(train$Symbol)


#2. train에서 na가 포함된 row는 모두 제거해주세요
# hint. na.omit함수 이용 
sum(is.na(train))
train1 <- na.omit(train)
str(train1)

#3.  k를 1~5까지 정의하여 train2로 변수 지정
set.seed(2020)
newtrain <- train1
train_ratio <- 0.7
traintotal <- sort(sample(nrow(newtrain), nrow(newtrain)*train_ratio))
train2 <- newtrain[traintotal,]
test2 <- newtrain[-traintotal,]

#4. Boosted Logistic Regression 모델을 생성
ctrl <- trainControl(method="repeatedcv",repeats = 5)
logit_boost_fit <- train(Symbol ~ .,
                          data = train2,
                          method = "naive_bayes",
                          trControl = ctrl,
                          metric="Accuracy")
logit_boost_fit

s
#답
#nIter가 21일 때 Accuracy가 79.9%로 가장 높음

