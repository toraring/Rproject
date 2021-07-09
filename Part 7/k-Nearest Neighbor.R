#k-Nearest Neighbor

#install.packages("caret", dependencies=TRUE)
library (caret)
#data load
awdata <- read.csv ( file= "C:/Users/파일 경로/wine.csv" , header = TRUE )
rawdata $ Class <- as.factor (rawdata $ Class) 
str (rawdata)

#divided test data
analdata <- rawdata
set.seed ( 2020 )
datatotal <- sort ( sample ( nrow (analdata), nrow (analdata) * 0.7 )) 
train <- rawdata[datatotal,] test <- rawdata[ - datatotal,]
str (train)

train_x <- train[, 1 : 13 ] 
train_y <- train[, 14 ]
test_x <- test[, 1 : 13 ] 
test_y <- test[, 14 ]

#edu
ctrl <- trainControl ( method= "repeatedcv" , number= 10 , repeats = 5 ) 
customGrid <- expand.grid ( k= 1 : 10 ) 
knnFit <- train (Class ~ .,
                 data = train,
                 method = "knn" ,
                 trControl = ctrl,
                 preProcess = c ( "center" , "scale" ), tuneGrid= customGrid, metric= "Accuracy" )
knnFit

plot(knnFit)

#prediction
pred_test <- predict (knnFit, newdata= test) 
confusionMatrix (pred_test, test $ Class)

#importance_knn 
importance_knn <- varImp (knnFit, scale= FALSE ) 
plot (importance_knn)
