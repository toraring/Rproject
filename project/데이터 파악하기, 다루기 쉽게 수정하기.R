#데이터 파악하기, 다루기 쉽게 수정하기
#데이터 준비
exam <- read.csv("csv_exam.csv")
head(exam) # 앞에서부터 6 행까지 출력
head(exam, 10) # 앞에서부터 10 행까지 출력
tail(exam) # 뒤에서부터 6 행까지 출력
tail(exam, 10) # 뒤에서부터 10 행까지 출력

View() #뷰어 창에서 데이터 확인하기
View(exam)
#[유의] View()에서 맨 앞의 V는 대문자

#dim() - 몇 행 몇 열로 구성되는지 알아보기
dim(exam) # 행, 열 출력
## [1] 20 5

str(exam) # 데이터 속성 확인
summary(exam) # 요약통계량 출력

## ggplo2 의 mpg 데이터를 데이터 프레임 형태로 불러오기
mpg <- as.data.frame(ggplot2::mpg)
head(mpg) # Raw 데이터 앞부분 확인
tail(mpg) # Raw 데이터 뒷부분 확인

View(mpg) # Raw 데이터 뷰어 창 확인
dim(mpg) # 행, 열 출력
## [1] 234 11

str(mpg) # 데이터 속성 확인
summary(mpg) # 요약통계량 출력

#dplyr 패키지 설치 & 로드
install.packages("dplyr") # dplyr 설치
library(dplyr) # dplyr 로드

#데이터 프레임 생성
df_raw <- data.frame(var1 = c(1, 2, 1),
                     var2 = c(2, 3, 2))
df_raw

#1. 데이터 프레임 복사본 만들기
df_new <- df_raw # 복사본 생성
df_new # 출력

#2. 변수명 바꾸기
df_new <- rename(df_new, v2 = var2) # var2 를 v2 로 수정
df_new
#[유의] rename()에 '새 변수명 = 기존 변수명' 순서로 입력

#변수 조합해 파생변수 만들기 
#데이터 프레임 생성
df <- data.frame(var1 = c(4, 3, 8),
                 var2 = c(2, 6, 1)) 

df

#파생변수 생성 
df$var_sum <- df$var1 + df$var2 # var_sum 파생변수 생성 
df

df$var_mean <- (df$var1 + df$var2)/2 # var_mean 파생변수 생성
df

#mpg 통합 연비 변수 만들기
mpg$total <- (mpg$cty + mpg$hwy)/2 # 통합 연비 변수 생성
head(mpg)

mean(mpg$total)

#조건문을 활용해 파생변수 만들기
#1.기준값 정하기
summary(mpg$total) # 요약 통계량 산출

hist(mpg$total) # 히스토그램 생성
## [1] 20.14957

# 20 이상이면 pass, 그렇지 않으면 fail 부여 
mpg$test <- ifelse(mpg$total >= 20, "pass", "fail")
head(mpg, 20) # 데이터 확인

#3. 빈도표로 합격 판정 자동차 수 살펴보기
table(mpg$test) # 연비 합격 빈도표 생성

## fail pass
## 106 128

#4. 막대 빈도 표현하기
library(ggplot2) # ggplot2 로드
qplot(mpg$test) # 연비 합격 빈도 막대 그래프 생성

#중첩 조건문 활용하기 - 연비 등급 변수 만들기
NP # total을 기준으로 A, B, C 등급 부여 
mpg$grade <- ifelse(mpg$total >= 30, "A",
                    ifelse(mpg$total >= 20, "B", "C")) 
head(mpg, 20) # 데이터 확인

#3. 빈도표로 합격 판정 자동차 수 살펴보기
table(mpg$test) # 연비 합격 빈도표 생성

#4. 막대 빈도 표현하기
library(ggplot2) # ggplot2 로드
qplot(mpg$test) # 연비 합격 빈도 막대 그래프 생성

#중첩 조건문 활용
NP # total을 기준으로 A, B, C 등급 부여 
mpg$grade <- ifelse(mpg$total >= 30, "A",
                    ifelse(mpg$total >= 20, "B", "C")) 
head(mpg, 20) # 데이터 확인

## fail pass
## 106 128

#4. 막대 빈도 표현하기
library(ggplot2) # ggplot2 로드
qplot(mpg$test) # 연비 합격 빈도 막대 그래프 생성

#중첩조건문 활용
#NP # total을 기준으로 A, B, C 등급 부여 
mpg$grade <- ifelse(mpg$total >= 30, "A",
                    ifelse(mpg$total >= 20, "B", "C")) 
head(mpg, 20) # 데이터 확인

#빈도표, 막대 그래프로 연비 등급 살펴보기
table(mpg$grade) # 등급 빈도표 생성
## A B C
## 10 118 106

qplot(mpg$grade) # 등급 빈도 막대 그래프 생성

# A, B, C, D 등급 부여 
mpg$grade2 <- ifelse(mpg$total >= 30, "A",
                     ifelse(mpg$total >= 25, "B",
                            ifelse(mpg$total >= 20, "C", "D")))
