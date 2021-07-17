#Naive Bayes

#install.packages("caret", dependencies=TRUE)
library(caret)

#Load data
rawdata <- read.csv(file="C:/Users/Cheolwon/Documents/dataset/ml/wine.csv", header = TRUE)
rawdata$Class <- as.factor(rawdata$Class)
str(rawdata)

#Divided Traing test data
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

#training
ctrl <- trainControl(method="repeatedcv",repeats = 5)
nbFit <- train(Class ~ .,
               data = train,
               method = "naive_bayes",
               trControl = ctrl,
               preProcess = c("center","scale"),
               metric="Accuracy")
plot(nbFit)

#prediction
pred_test <- predict(nbFit, newdata=test)
confusionMatrix(pred_test, test$Class)

#importance of a variable
importance_nb <- varImp(nbFit, scale=FALSE)
plot(importance_nb)

nbFit