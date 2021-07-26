#[은행 거래 데이터를 활용한 마케팅 효과 예측]

#install.packages("caret", dependencies=TRUE)
library(caret)

#data load
rawdata1 <- read.csv("C:/Users/Cheolwon/Documents/dataset/project/bankmarket/bank.csv", header=TRUE)
str(rawdata1)

#check features
#나이
unique(rawdata1$age)
#직업
unique(rawdata1$job)
#결혼여부
unique(rawdata1$marital)
#교육 수준
unique(rawdata1$education)
#파산 수준
unique(rawdata1$default)
#주택 대출 여부
unique(rawdata1$housing)
#융자
unique(rawdata1$loan)
#연락수단
unique(rawdata1$contact)
#마지막 연락 달
unique(rawdata1$month)
#마지막 연락 요일
unique(rawdata1$day_of_week)
#마지막 연락 경과
unique(rawdata1$duration)
#마케팅 홍보 횟수
unique(rawdata1$campaign)
#이전 마케팅 횟수
unique(rawdata1$previous)
#이전 마케팅 성공 여부
unique(rawdata1$poutcome)
#고용 변동성
unique(rawdata1$emp.var.rate)
#소비자 물가 지수
unique(rawdata1$cons.price.idx)
#소비자 신뢰 지수
unique(rawdata1$cons.conf.idx)
#유리보 세달
unique(rawdata1$euribor3m)
#고용 지수
unique(rawdata1$nr.employed)
#타겟 – 마케팅 성공 여부
unique(rawdata1$target)

### 트레이닝 테스트 나누기(7:3)
set.seed(2020)
newdata <- rawdata1
datatotal <- sort(sample(nrow(newdata), nrow(newdata)*0.7))
train <- newdata[datatotal,]
test <- newdata[-datatotal,]