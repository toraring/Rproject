#프로젝트를 통해 R 프로그래밍에 익숙해지기 
##실전 분석 미션 "한국인의 삶을 파악하라!" - 한국복지패널 데이터

#분석 목표
#• 분석1: 성별에 따른 소득
#• 분석2: 나이와 소득의 관계
#• 분석3: 연령대에 따른 소득
#• 분석4: 연령대 및 성별에 따른 소득

#foreign 패키지 설치
install.packages("foreign")

#패키지 로드
library(foreign)
library(dplyr)
library(ggplot2)

#데이터 불러오기
# 복지패널데이터 로드
raw_welfare <- read.spss("data_spss_Koweps2014.sav", to.data.frame = T)

# 데이터 copy
welfare <- raw_welfare

#데이터 검토
dim(welfare)
str(welfare)
head(welfare)
summary(welfare)
View(welfare)
#변수명
welfare <- rename(welfare,
                  sex = h0901_4, # 성별
                  birth = h0901_5, # 태어난 연도
                  income = h09_din) # 소득

#1-1.변수 검토, 수정
class(welfare$sex)
## [1] "numeric"
summary(welfare$sex)

table(welfare$sex)

#1-2.정제 - 이상치 확인 및 결측처리
#• 성별 이상치 : 모름/무응답=9
# 이상치 확인
table(welfare$sex)

# 이상치 결측 처리
welfare$sex <- ifelse(welfare$sex == 9, NA, welfare$sex)

# 결측치 확인
table(is.na(welfare$sex))