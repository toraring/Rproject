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
