# Week_4 Quiz
# 문제 바로 아래에 답안을 작성하여, <<r script 형태>>로 저장 후 제출해주시면 됩니다. (.R 파일업로드 / Rproj파일은 업로드하지 않으셔도 됩니다.)
# 답안인 코드만 작성하시면 됩니다. 코드 실행 결과 포함 X
# [R Script Encoding Error] : File > Reopen with Encoding > 'UTF-8' > OK

# 아래 다섯 줄의 코드를 실행 후 문제를 풀어주세요.
# BCW 는 과제와 함께 배포해드린 데이터입니다.
# 출처 : https://archive.ics.uci.edu/ml/datasets/Breast+Cancer+Wisconsin+%28Diagnostic%29
# 데이터 설명 : 세포 핵의 특성을 분석하여 유방의 종양이 양성인지 분류(Predict whether the cancer is benign or malignant)
library(caret)
library(tree)
set.seed(2020)
bcw <- read.csv("C:/RProject/Rproject/homework/4/BCW.csv")  # 경로는 본인의 컴퓨터 환경에 맞게 작성하세요.
bcw <- bcw[, -1]    # id 변수 제거

# (5점) 1- (1) bcw의 diagnosis 변수를 factor형 변수로 바꿔주세요.
View(bcw)
bcw$diagnosis <- as.factor(bcw$diagnosis)
str(bcw)

[답]
bcw$diagnosis <- as.factor(bcw$diagnosis)

# (5점) 1-(2) train 데이터와 test 데이터를 7:3의 비율로 나누어서 지정해주세요. 
bcw2 <- bcw
set.seed(2020)
d_total <- sort(sample(nrow(bcw2), nrow(bcw2)*.7))
train <- bcw[d_total,]
test <- bcw[-d_total,]

str(train)

train_x <- train[,1:13]
train_y <- train[,14]

test_x <- test[,1:13]
test_y <- test[,14]

[피드백]
1-(2)에서 train_x 와 train_y로 나눌 때에는 변수를 보고 종속변수를 y로, 독립변수를 x로 해야 합니다. bcw같은 경우 id변수를 제거하면 첫 번째 변수가 y변수입니다.
[답]
flag <- sort(sample(nrow(bcw), nrow(bcw)*.7))
train <- bcw[flag,]
test <- bcw[-flag,]

# (5점) 1-(3) target 변수는 diagnosis 입니다. tree함수를 이용하여 train데이터를 결정나무에 적합시키세요.
treeOrigin <- tree(diagnosis~.  , data=train)
plot(treeOrigin)
text(treeOrigin)

[답]
treeRaw <- tree(diagnosis ~., data = train)
적합된 나무 형태를 보려면 아래 코드를 실행하시면 됩니다.
plot(treeRaw)
text(treeRaw)


# cv.tree 함수를 이용해 그래프로 나타내보니, size = 7에서 가지치기를 하는 것이 좋은 것으로 나타났습니다. 
# (5점) 1-(4) size = 7로 가지치기 한 결정나무를 적합하세요.
treeCv <- cv.tree(treeOrigin, FUN=prune.misclass)
plot(treeCv)

treePrune <- prune.misclass(treeOrigin, best=7)
plot(treePrune)
text(treePrune, pretty=0)

[답]
prune_tree <- prune.misclass(treeRaw, best=7)

# 아래 코드를 실행 후 2번 문제풀이를 진행하세요.
ctrl <- trainControl(method="repeatedcv",repeats = 5)

# (5점) 2-(1). trControl로 위에서 작성한 ctrl을 이용하는 선형 svm을 적합하세요. 이 때 target변수는 diagnosis입니다.
# hint. train 함수를 이용. method로 적합방법 지정
goFit <- train(diagnosis ~ ., 
               data = train, 
               method = "rf", 
               trControl = ctrl, 
               preProcess = c("center","scale"),
               metric="Accuracy")
goFit

[답]
2-(1)에서 선형 svm은 method에 svmLinear를 지정해줘야 합니다. 5점 감점

svm_linear_fit <- train(diagnosis ~ .,
                        data = train,
                        method = "svmLinear",
                        trControl = ctrl,
                        preProcess = c("center","scale"),
                        metric="Accuracy")
svm_linear_fit


# (5점) 2-(2). 2- (1)에서 적합한 모형으로 test 데이터의 diagnosis값을 예측한 후, 혼동행렬을 만드는 코드를 작성하세요.
preTest <- predict(goFit, newdata=test)
confusionMatrix(preTest, test$diagnosis)

[답]
pred_test <- predict(svm_linear_fit, newdata=test)
confusionMatrix(pred_test, test$diagnosis)

# (10점) 3-(1) bcw의 데이터 형태를 보고 "적절한 변수"에만 차원축소를 진행하세요.
# 이 때, 변수의 표준화를 반드시 실행하세요. 
View(bcw)
bcw.pca <- prcomp(bcw[2:31], center = T, scale. = T)
summary(bcw.pca)
bcw.pca$rotation
head(bcw.pca$x, 10)
plot(bcw.pca, type = 'l', main = 'Scree Plot')
head(bcw.pca$x[,1:2], 10)

[답]
str(bcw)
등을 통해 변수 형태를 확인하고, 범주형 변수는 제외한 나머지 변수에만 차원 축소를 진행해야 합니다.
bcw.pca <- prcomp(bcw[2:ncol(bcw)], center = T, scale. = T)

# (5점) 3-(2) 분산의 90% 이상을 설명하기 위해 몇 개의 주성분 변수를 사용해야 하나요? 코드를 작성하고 정답을 작성하세요.
install.packages("ggfortify")
library(ggfortify)
autoplot(bcw.pca, data = bcw, colour = 'black')

bcw <- scale(bcw) %>% as.data.frame()
# 정답 : 8개

[답]3-(2)에서 summary를 이용하면 분산의 몇 %를 설명하는지 알 수 있습니다. 정답은 7개로 5점 감점입니다.
summary(bcw.pca)


#(10점) 4-(1). 연속형 변수에만 k-means clustering을 실시하려고 합니다. 
# 이 때 Elbow plot을 그리고 k의 적절한 개수와 그 이유를 작성해주세요.
# 코드와 정답을 모두 작성하세요.
library(dplyr)
bcw3 <- bcw 
head(bcw3)
colSums(is.na(bcw3))
summary(bcw3)
boxplot(bcw3[,3:ncol(bcw3)])
options(scipen = 100)
boxplot(bcw3[,3:ncol(bcw3)])
temp <- NULL
for (i in 3:ncol(bcw3)) {
  temp <- rbind(temp, bcw3[order(bcw3[,i], decreasing = T),] %>% slice(1:5))
}
temp <- distinct(temp)
bcw3.rm.outlier <- anti_join(bcw3,temp)
dev.off()
par(mfrow = c(1,2))
boxplot(bcw3[,3:ncol(bcw3)])


install.packages("factoextra") 
library(factoextra)
fviz_nbclust(bcw3.rm.outlier[,3:ncol(bcw3.rm.outlier)], kmeans, method = "wss", k.max = 1
             5) +
  theme_minimal() +
  ggtitle("Elbow Method")



bcw3.rm.outlier <- bcw %>% rownames_to_column('rname') %>%
  arrange(desc(`Rape`)) %>%
  slice(-1:-2) %>%
  column_to_rownames('rname')
# 정답 : 93

[답]
4-(1)에서 데이터 분석을 할 때 변수를 선택한 경우 적절한 이유가 있어야합니다. 또한 그래프를 그려보면 k는 15까지만 살펴보았기 때문에 정답이 틀렸으므로 10점 감점입니다.
library(dplyr)
library(factoextra)
fviz_nbclust(bcw[,2:ncol(bcw)], kmeans, method = "wss", k.max = 15) + # ncol=31
  theme_minimal() +
  ggtitle("Elbow plot")

# bcw 데이터의 2번째 열부터 31번째 열을 이용하여 계층적 군집분석을 실시하려고 합니다.
# (5점) 5-(1) 유클리드 거리를 기반으로 하는 유사도행렬을 생성하세요.
bcw.dist <- dist(bcw3.rm.outlier, method = "euclidean")

# (5점) 5-(1) bcw.dist를 이용해 ward's method로 계층적 군집분석을 실시하세요.

bcw.hclust.sing <- hclust(bcw.dist, method = "single" )
bcw.hclust.cplt <- hclust(bcw.dist, method = "complete" )
bcw.hclust.avg <- hclust(bcw.dist, method = "average" )
bcw.hclust.cent <- hclust(bcw.dist, method = "centroid" )
bcw.hclust.ward <- hclust(bcw.dist, method = "ward.D2" )

par("mar")
par(mar=c(1,1,1,1))
plot(bcw.hclust.sing, cex = 0.6, hang = -1)
rect.hclust(bcw.hclust.sing, k = 5, border = 2:31)

[답]
5-(1) (두번째) 에서 method를 지정해주었기 때문에 하나만 작성해주셔야 합니다. 5점 감점
# 5-(1)에서 만든 군집 분석 결과물을 확인하였더니 5개의 군집으로 구성하는 것이 적당해보입니다.
# (5점) 5-(2) 원래의 데이터 bcw에 군집분석한 결과물을 이용해 cluster라는 새로운 변수를 생성하세요.
bcw.clusters <- cutree(bcw.hclust.ward, k = 5)
table(bcw.clusters)
bcw3.rm.outlier$cluster <- bcw.clusters
head(bcw3.rm.outlier)
