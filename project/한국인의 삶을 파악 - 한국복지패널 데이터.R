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

##변수 값 변경
# 항목 이름 부여
welfare$sex <- ifelse(welfare$sex == 1, "male", "female")
table(welfare$sex)

qplot(welfare$sex)

#2-1.변수 검토, 수정
class(welfare$income)
## [1] "numeric"
summary(welfare$income)

qplot(welfare$income)
qplot(welfare$income) + xlim(0, 10000) # x 축 설정

#2-2.정제 - 이상치 확인 및 결측처리
#• 소득 이상치 : 모름/무응답 없음
table(is.na(welfare$income))
##
## FALSE
## 7048

#3.성별 소득 평균 분석
#성별 소득 평균표 생성
sex_income <- welfare %>%
  group_by(sex) %>%
  summarise(mean_income = mean(income))

sex_income

#그래프 생성
ggplot(data = sex_income, aes(x = sex, y = mean_income)) + geom_col()

#1-1.태어난 연도 변수 검토
class(welfare$birth)
## [1] "numeric"

summary(welfare$birth)
qplot(welfare$birth)

#1-2.정제 - 이상치 확인 및 결측처리
#• 태어난 연도 이상치 : 모름/무응답=9999
# 이상치 확인
summary(welfare$birth)

# 이상치 결측처리
welfare$birth <- ifelse(welfare$birth == 9999, NA, welfare$birth)

# 결측치 확인
table(is.na(welfare$birth))
## FALSE
## 7048

#1-2.정제 - 이상치 확인 및 결측처리
#• 태어난 연도 이상치 : 모름/무응답=9999
# 이상치 확인
summary(welfare$birth)

# 이상치 결측처리
welfare$birth <- ifelse(welfare$birth == 9999, NA, welfare$birth)

# 결측치 확인
table(is.na(welfare$birth))
## FALSE
## 7048

#1-3.나이 변수 생성
welfare$age <- 2014-welfare$birth+1
summary(welfare$age)

qplot(welfare$age)

#나이별 소득 평균 분석
age_income <- welfare %>%
  group_by(age) %>%
  summarise(mean_income = mean(income))
age_income

#그래프 생성 - 산점도
ggplot(data = age_income, aes(x = age, y = mean_income)) + geom_point()

#1-1.연령대 변수 생성
welfare <- welfare %>%
  mutate(ageg = ifelse(age < 30, "young",
                       ifelse(age <= 59, "middle", "old")))
table(welfare$ageg)

qplot(welfare$ageg)

#연령대별 소득 평균표 생성
#• 초년 빈도 적으므로 제외
welfare_income <- welfare %>%
  filter(ageg != "young") %>%
  group_by(ageg) %>%
  summarise(mean_income = mean(income))

welfare_income

#그래프 만들기
ggplot(data = welfare_income, aes(x = ageg, y = mean_income)) + geom_col()

#1.연령대 및 성별 소득 평균표 생성
sex_income <- welfare %>%
filter(ageg != "young") %>%
  group_by(ageg, sex) %>%
  summarise(mean_income = mean(income))
sex_income

#2.그래프 만들기
ggplot(data = sex_income, aes(x = ageg, y = mean_income, fill = sex)) +
  geom_col()