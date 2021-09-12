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