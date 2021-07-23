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

#선형 서포트 벡터 머신
ctrl <- trainControl(method="repeatedcv",repeats = 5)
svm_linear_fit <- train(Class ~ .,
                        data = train,
                        method = "svmLinear",
                        trControl = ctrl,
                        preProcess = c("center","scale"),
                        metric="Accuracy")
svm_linear_fit

pred_test <- predict(svm_linear_fit, newdata=test)
confusionMatrix(pred_test, test$Class)
importance_linear <- varImp(svm_linear_fit, scale=FALSE)
plot(importance_linear)

#비선형 서포트 벡터 머신
ctrl <- trainControl(method="repeatedcv",repeats = 5)
svm_ploy_fit <- train(Class ~ .,
                      data = train,
                      method = "svmPoly",
                      trControl = ctrl,
                      preProcess = c("center","scale"),
                      metric="Accuracy")
svm_ploy_fit

plot(svm_ploy_fit)
pred_test <- predict(svm_ploy_fit, newdata=test)
confusionMatrix(pred_test, test$Class)