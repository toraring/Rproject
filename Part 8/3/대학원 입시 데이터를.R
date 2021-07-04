##대학원 입시 데이터를 활용한 합격률 예측
##[데이터 살펴보기]

### 파일 불러오기 
rawdata1 <- read.csv("C:/RProject/Rproject/Part 8/3/university.csv", head=TRUE)

### 데이터 형태 확인
str(rawdata1)
unique(rawdata1)

# 결측치 확인
is.na(rawdata1$GRE.Score) 

sum(is.na(rawdata1$GRE.Score)) 

sum(is.na(rawdata1$GRE.Score)) 
sum(is.na(rawdata1$TOEFL.Score)) 
sum(is.na(rawdata1$University.Rating)) 
sum(is.na(rawdata1$SOP)) 
sum(is.na(rawdata1$LOR)) 
sum(is.na(rawdata1$Research)) 
sum(is.na(rawdata1$Chance.of.Admit)) 

#변수 별 유니크값 확인
unique(rawdata1$GRE.Score)
unique(rawdata1$TOEFL.Score)
unique(rawdata1$University.Rating)
u_rating_table <- table(rawdata1$University.Rating)
unique(rawdata1$SOP)
unique(rawdata1$LOR) 
unique(rawdata1$Research)
research_table <- table(rawdata1$Research)
unique(rawdata1$Chance.of.Admit)
max(rawdata1$Chance.of.Admit)
min(rawdata1$Chance.of.Admit)

#히스토그램
par(mfrow=c(3,2), mar=c(5.1, 4.1, 4.1, 2.1))
hist(rawdata1$GRE.Score, main="GRE 점수 히스토그램", xlab="GRE 점수",col="orange")
hist(rawdata1$TOEFL.Score, main="토플 점수 히스토그램", xlab="토플 점수",col="green")
hist(rawdata1$SOP, main="자기소개서 점수 히스토그램", xlab="자기소개서 점수",col="blue")
hist(rawdata1$CGPA, main="학부 학점 점수 히스토그램", xlab="학부 학점 점수",col="darkmagenta")
hist(rawdata1$LOR, main="추천서 점수 히스토그램", xlab="추천서 점수", col="yellow")
hist(rawdata1$Chance.of.Admit, main="대학원 합격 확률 히스토그램", xlab="추천서 점수", col="red")

#변수 산점도
plot(rawdata1)

####################################
#[회귀(regression) 문제로 대학원 합격률 예측하기]
#트레이닝 테스트 데이터 나누기
## 트레이닝 테스트 나누기(7:3)
set.seed(2020)
newdata <- rawdata1
train_ratio <- 0.7
datatotal <- sort(sample(nrow(newdata), nrow(newdata)*train_ratio))
train <- newdata[datatotal,]
test <- newdata[-datatotal,]

#패키지 불러오기
#install.packages("caret", dependencies=TRUE)
library(caret)

#로지스틱 회귀분석
ctrl <- trainControl(method="repeatedcv",repeats = 5)  
logistic_fit <- train(Chance.of.Admit ~ ., 
                      data = train, 
                      method = "glm", 
                      trControl = ctrl,
                      preProcess = c("center","scale"),
                      metric="RMSE")
logistic_fit
#그에 대한 예측 및 결과
logistic_pred <- predict(logistic_fit, newdata=test)

##RMSE구하기
postResample(pred = logistic_pred, obs = test$Chance.of.Admit)
RMSE(logistic_pred, test$Chance.of.Admit)
sqrt(mean((logistic_pred - test$Chance.of.Admit)^2))

##Rsquared 
postResample(pred = logistic_pred, obs = test$Chance.of.Admit)
# R 제곱값 구하기
y_bar = mean(test$Chance.of.Admit)
1 - (sum((logistic_pred - test$Chance.of.Admit)^2) / sum((test$Chance.of.Admit-y_bar)^2))

#MAE
postResample(pred = logistic_pred, obs = test$Chance.of.Admit)
MAE(logistic_pred, test$Chance.of.Admit)
mean(abs(logistic_pred - test$Chance.of.Admit))

#엘라스틱넷(Elasticnet) 회귀분석
ctrl <- trainControl(method="repeatedcv",repeats = 5)  
logit_penal_fit <- train(Chance.of.Admit ~ ., 
                         data = train, 
                         method = "glmnet", 
                         trControl = ctrl,
                         preProcess = c("center","scale"),
                         metric="RMSE")
logit_penal_fit 
##예측 및 결과
logit_penal_pred <- predict(logit_penal_fit, newdata=test)
postResample(pred = logit_penal_pred, obs = test$Chance.of.Admit)

#랜덤 포레스트
ctrl <- trainControl(method="repeatedcv",repeats = 5)  
rf_fit <- train(Chance.of.Admit ~ ., 
                data = train, 
                method = "rf", 
                trControl = ctrl, 
                preProcess = c("center","scale"),
                metric="RMSE")
rf_fit
plot(rf_fit)

rf_pred <- predict(rf_fit, newdata=test)
postResample(pred = rf_pred, obs = test$Chance.of.Admit)

#선형 서포트 벡터 머신
ctrl <- trainControl(method="repeatedcv",repeats = 5)  
svm_poly_fit <- train(Chance.of.Admit ~ ., 
                      data = train, 
                      method = "svmPoly", 
                      trControl = ctrl, 
                      preProcess = c("center","scale"),
                      metric="RMSE")
svm_poly_fit 
plot(svm_ploy_fit)
##예측 및 결과
svm_linear_pred <- predict(svm_linear_fit, newdata=test)
postResample(pred = svm_linear_pred, obs = test$Chance.of.Admit)

#커널 서포트 벡터 머신
ctrl <- trainControl(method="repeatedcv",repeats = 5)  
svm_poly_fit <- train(Chance.of.Admit ~ ., 
                      data = train, 
                      method = "svmPoly", 
                      trControl = ctrl, 
                      preProcess = c("center","scale"),
                      metric="RMSE")
svm_poly_fit 
plot(svm_ploy_fit)
##예측 및 결과
svm_poly_pred <- predict(svm_poly_fit, newdata=test)
postResample(pred = svm_poly_pred, obs = test$Chance.of.Admit)

##[분류(classification) 문제로 대학원 합격 여부 분류하기]
#변수 별 유니크 값 확인
max(rawdata1$Chance.of.Admit)
min(rawdata1$Chance.of.Admit)

#데이터 불러오기
#install.packages("caret", dependencies=TRUE)
library(caret)

### 파일 불러오기 
rawdata2 <- read.csv("C:/Users/파일 경로/university.csv", head=TRUE)

str(rawdata2)
#타겟 변수 살펴보기
par(mfrow=c(1,2), mar=c(5.1, 4.1, 4.1, 2.1))
hist(rawdata2$Chance.of.Admit, main="대학원 합격 확률 히스토그램", xlab="대학원 합격 확률", col="red")
boxplot(rawdata2$Chance.of.Admit, main="대학원 합격 확률 box-plot", col="red")
summary(rawdata2$Chance.of.Admit)
target_median = median(rawdata2$Chance.of.Admit)

### 타겟 연속형 -> 범주형
rawdata2[(rawdata2$Chance.of.Admit < target_median),"Chance.of.Admit"] = "0"
rawdata2[(rawdata2$Chance.of.Admit >= target_median),"Chance.of.Admit"] = "1"

rawdata2$Chance.of.Admit <- as.factor(rawdata2$Chance.of.Admit)
str(rawdata2)
unique(rawdata2$Chance.of.Admit)
rawdata2

#트레이닝 테스트 나누기
## 트레이닝 테스트 나누기(7:3)
set.seed(2020)
newdata2 <- rawdata2
train_ratio <- 0.7
datatotal2 <- sort(sample(nrow(newdata2), nrow(newdata2)*train_ratio))
train2 <- newdata2[datatotal2,]
test2 <- newdata2[-datatotal2,]

## knn
ctrl <- trainControl(method="repeatedcv",repeats = 5)  
customGrid <- expand.grid(k=1:20)
knn_fit2 <- train(Chance.of.Admit ~ ., 
                  data = train2, 
                  method = "knn", 
                  trControl = ctrl, 
                  preProcess = c("center","scale"),
                  tuneGrid=customGrid,
                  metric="Accuracy")
knn_fit2
plot(knn_fit2)

knn_pred2 <- predict(knn_fit2, newdata=test2)
confusionMatrix(knn_pred2, test2$Chance.of.Admit)

#Logit Boost
ctrl <- trainControl(method="repeatedcv",repeats = 5)  
logit_boost_fit2 <- train(Chance.of.Admit ~ ., 
                          data = train2, 
                          method = "LogitBoost", 
                          trControl = ctrl, 
                          preProcess = c("center","scale"),
                          metric="Accuracy")
logit_boost_fit2
logit_boost_pred <- predict(logit_boost_fit2, newdata=test2)
confusionMatrix(logit_boost_pred, test2$Chance.of.Admit)
plot(logit_boost_fit2)

## penalized 로지스틱 
ctrl <- trainControl(method="repeatedcv",repeats = 5)  
logit_plr_fit2 <- train(Chance.of.Admit ~ ., 
                        data = train2, 
                        method = "plr", 
                        trControl = ctrl, 
                        preProcess = c("center","scale"),
                        metric="Accuracy")
logit_plr_fit2
plot(logit_plr_fit2)