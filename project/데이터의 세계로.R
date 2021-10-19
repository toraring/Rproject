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

#[주의] Working directory에 불러올 파일이 있어야 함
mean(df_finalexam$math) 
## [1] 57.45 
mean(df_finalexam$history) 
## [1] 84.9 
mean(df_finalexam$english) 
## [1] 59.45

#col_names 파라미터 
# 첫번째 행 변수명으로 로드 
read_excel("finalexam.xlsx", sheet = 1, col_names = T)

# 첫번째 행 변수명으로 로드 X 
read_excel("finalexam.xlsx", sheet = 1, col_names = F)

#csv 파일 불러오기
#- 범용 데이터 형식
#- 값 사이를 쉼표(,)로 구분
#- 용량 작음, 다양한 소프트웨어에서 사용
read.csv("csv_exam.csv", header = T)

#csv로 저장 
write.csv(df_finalexam, file = "output_newdata.csv")