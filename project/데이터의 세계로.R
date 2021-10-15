#[데이터의 세계로]
history <- c(90, 80, 60, 70) # 역사점수 생성
history 
## [1] 90 80 60 70 

math <- c(50, 60, 100, 20) # 수학점수 생성
math 
## [1] 50 60 100 20

# 변수 합해서 데이터프레임 만들기 
df_midterm <- data.frame(history, math) 
df_midterm

# 반 추가하기 class <- c(1, 1, 2, 2) 
class 
## [1] 1 1 2 2 

df_midterm <- data.frame(history, math, class) 
df_midterm 

mean(dfmidterm$history) 
## [1] 75 
mean(df_midterm$math) 
## [1] 57.5

#엑셀 데이터 불러오기
# readxl 패키지 설치
install.packages("readxl")

# readxl 패키지 로드 
library(readxl)

# 엑셀 파일 불러오기 
df_finalexam <- read_excel("finalexam.xlsx", sheet = 1, col_names = T)

df_finalexam