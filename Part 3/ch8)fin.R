###part 8. 한국복지패널 데이터를 활용한 한국인의 삶 분석

##준비
install.packages("foreign")
  #패키지 설치
library(foreign)
library(dplyr)
library(ggplot2)
  #패키지 로드
raw_welfare <- read.spss("data_spss_Koweps2014.sav", to.data.frame = T)
  # 복지패널데이터 로드
# 데이터 copy
welfare <- raw_welfare

#데이터 검토
dim(welfare)
str(welfare)
head(welfare)
summary(welfare)
View(welfare)

#변수명 재설정
welfare <- rename(welfare,
                  sex = h0901_4, # 성별
                  birth = h0901_5, # 태어난 연도
                  income = h09_din) # 소득

##1.변수 검토 및 정제- 성별
#1-1.변수 검토, 수정
class(welfare$sex)
summary(welfare$sex)
table(welfare$sex)

#1-2.정제 - 이상치 확인 및 결측처리
# 이상치 확인
table(welfare$sex)
# 이상치 결측 처리
welfare$sex <- ifelse(welfare$sex == 9, NA, welfare$sex)
welfare$sex
# 결측치 확인
table(is.na(welfare$sex))
# 항목 이름 부여
welfare$sex <- ifelse(welfare$sex == 1, "male", "female")
table(welfare$sex)
qplot(welfare$sex)

#2.변수 검토 및 정제- 소득
#2-1.변수 검토, 수정
class(welfare$income)
summary(welfare$income)
qplot(welfare$income)
qplot(welfare$income) + xlim(0, 10000) # x 축 설정
#2-2.정제 - 이상치 확인 및 결측처리
table(is.na(welfare$income))

#3.성별 소득 평균 분석
#성별 소득 평균표 생성
sex_income <- welfare %>%
  group_by(sex) %>%
  summarise(mean_income = mean(income))
#그래프
ggplot(data = sex_income, aes(x = sex, y = mean_income)) + geom_col()

#분석2: 나이와 소득의 관계
#1.변수 검토 및 정제- 나이
class(welfare$birth)
summary(welfare$birth)
qplot(welfare$birth)
#태어난 연도 이상치 : 모름/무응답=9999
# 이상치 확인
summary(welfare$birth)
# 이상치 결측처리
welfare$birth <- ifelse(welfare$birth == 9999, NA, welfare$birth)
# 결측치 확인
table(is.na(welfare$birth))
#1-3.나이 변수 생성
welfare$age <- 2014-welfare$birth+1
summary(welfare$age)
qplot(welfare$age)

#나이별 소득 평균표 생성
age_income <- welfare %>%
  group_by(age) %>%
  summarise(mean_income = mean(income))
#그래프 생성 - 산점도
ggplot(data = age_income, aes(x = age, y = mean_income)) + geom_point()
#연령대 변수 생성
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
#그래프
ggplot(data = welfare_income, aes(x = ageg, y = mean_income)) + geom_col()
#평균표 생성
sex_income <- welfare %>%
  filter(ageg != "young") %>%
  group_by(ageg, sex) %>%
  summarise(mean_income = mean(income))
#그래프
ggplot(data = sex_income, aes(x = ageg, y = mean_income, fill = sex)) +
  geom_col()
# position 변경(기본값 = "stack")
ggplot(data = sex_income, aes(x = ageg, y = mean_income, fill = sex)) +
  geom_col(position = "dodge") 
