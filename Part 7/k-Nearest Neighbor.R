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

