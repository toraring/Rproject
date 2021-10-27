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