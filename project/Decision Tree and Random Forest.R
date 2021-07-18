#[Decision Tree and Random Forest]

#install.packages("caret", dependencies=TRUE)
library(caret)

#Data Load
rawdata <- read.csv(file="C:/Users/Cheolwon/Documents/dataset/ml/wine.csv", header = TRUE)
rawdata$Class <- as.factor(rawdata$Class)
str(rawdata)

#training data dviding
analdata <- rawdata
set.seed(2020)
datatotal <- sort(sample(nrow(analdata), nrow(analdata)*.7))
train <- rawdata[datatotal,]
test <- rawdata[-datatotal,]
str(train)

#Decision Tree 학습
#install.packages("tree")
library(tree)
treeRaw <- tree(Class~. , data=train)
plot(treeRaw)
text(treeRaw)