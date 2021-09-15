#[데이터 정제]
#결측치(Missing Value)
#• 누락된 값, 비어있는 값
#• 함수 적용 불가, 분석 결과 왜곡
#• 제거 후 분석 실시
#결측치 만들기
• 결측치 표기 - 대문자 NA

df <- data.frame(sex = c("M", "F", NA, "M", "F"),
                 score = c(5, 4, 3, 4, NA))
df
#결측치 확인하기
is.na(df) # 결측치 확인

table(is.na(df)) # 결측치 빈도 출력

#변수별로 결측치 확인하기
table(is.na(df$sex)) # sex 결측치 빈도 출력
##
## FALSE TRUE
## 4 1

table(is.na(df$score)) # score 결측치 빈도 출력
##
## FALSE TRUE
## 4 1

#결측치 포함된 상태로 분석
mean(df$score) # 평균 산출
## [1] NA

sum(df$score) # 합계 산출
## [1] NA

#결측치 제거
library(dplyr) # dplyr 패키지 로드
df %>% filter(is.na(score)) # score 가 NA 인 데이터만 출력
## sex score
## 1 F NA

df %>% filter(!is.na(score)) # score 결측치 제거

#결측치 제외한 데이터로 분석하기
df_nomiss <- df %>% filter(!is.na(score)) # score 결측치 제거
mean(df_nomiss$score) # score 평균 산출
## [1] 4

sum(df_nomiss$score) # score 합계 산출
## [1] 16

#여러 변수 동시에 결측치 없는 데이터 추출하기
# score, sex 결측치 제외
df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))
#결측치가 하나라도 있으면 제거하기
df_nomiss2 <- na.omit(df) # 모든 변수에 결측치 없는 데이터 추출
df_nomiss2 # 출력
df_nomiss
#- 분석에 필요한 데이터까지 손실 될 가능성 유의
#- ex) 성별-소득 관계 분석하는데 지역 결측치까지 제거

#[함수의 결측치 제외 기능 이용하기 - na.rm = T]
mean(df$score, na.rm = T) # 결측치 제외하고 평균 산출
## [1] 4
sum(df$score, na.rm = T) # 결측치 제외하고 합계 산출
## [1] 16
#summarise()에서 na.rm = T사용하기
#• 결측치 생성
exam <- read.csv("csv_exam.csv") # 데이터 불러오기
exam[c(3, 8, 15), "math"] <- NA # 3, 8, 15 행의 math 에 NA 할당

#• 평균 구하기
exam %>% summarise(mean_math = mean(math)) # 평균 산출
## mean_math
## 1 NA

exam %>% summarise(mean_math = mean(math, na.rm = T)) # 결측치 제외하고 평균 산출
## mean_math
## 1 55.23529

#다른 함수들에 적용
exam %>% summarise(mean_math = mean(math, na.rm = T), # 평균 산출
                   sum_math = sum(math, na.rm = T), # 합계 산출
                   

                   median_math = median(math, na.rm = T)) # 중앙값 산출

##평균값으로 결측치 대체하기
#평균 구하기
mean(exam$math, na.rm = T) # 결측치 제외하고 math 평균 산출
## [1] 55.23529

#평균으로 대체하기
exam$math <- ifelse(is.na(exam$math), 55, exam$math) # math 가 NA 면 55 로 대체
table(is.na(exam$math)) # 결측치 빈도표 생성
##
## FALSE
## 20

exam # 출력
mean(exam$math) # math 평균 산출
## [1] 55.2

#[이창치 제거]
#논리적으로 존재할 수 없으므로 바로 결측 처리 후 분석시 제외
#이상치 포함된 데이터 생성 - sex 3, score 6
outlier <- data.frame(sex = c(1, 2, 1, 3, 2, 1),
                      score = c(5, 4, 3, 4, 2, 6))

outlier