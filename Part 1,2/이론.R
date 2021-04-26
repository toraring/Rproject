##part1

#패키지 설치 
install.packages("dplyr") install.packages("ggplot2")
#패키지 로드 
library(dplyr) library(ggplot2)
#데이터 검토
head(mpg)

#데이터 분석
mpg %>% 
  group_by(manufacturer) %>% 
  summarise(mean.hwy=mean(hwy)) %>% 
  arrange(desc(mean.hwy))
#3.배기량이 연비에 미치는 영향 회귀분석
lm.mpg <- lm(data=mpg, hwy ~ displ) # 회귀분석 
summary(lm.mpg) # 결과 출력
qplot(data = mpg, x = displ, y = hwy)#그래프

#part1-2. 변수
#사용할 패키지
library(ggplot2)
head(mpg)

#변수만들기
a <- 1
d <- c(1,2,3,4,5)
e <- c(1:5)
f <- seq(1, 5)
g <- seq(1, 10, by=2) # 1~10까지 2씩 증가
c2 <- "Hello world!"
e2 <- c("Hello!", "World", "is", "good!")
paste(e2, collapse = " ") # 빈칸 구분자로 문자 붙이기

#패키지 이용
library(ggplot2) 
qplot(b)
qplot(data = mpg, y = hwy, x = drv, geom = "point")

#데이프레임 만들기
history <- c(90, 80, 60, 70) # 역사점수 생성
math <- c(50, 60, 100, 20) # 수학점수 생성
# 변수 합해서 데이터프레임 만들기
df_midterm <- data.frame(history, math) 
df_midterm

#외부 데이터 불러오기
# readxl 패키지 설치 
install.packages("readxl")
# readxl 패키지 로드
library(readxl)
# 엑셀 파일 불러오기 
df_finalexam <- read_excel("finalexam.xlsx", sheet = 1, col_names = T)
# 첫번째 행 변수명으로 로드
read_excel("finalexam.xlsx", sheet = 1, col_names = T)
#csv로 저장
write.csv(df_finalexam, file = "output_newdata.csv")

#<4> 데이터 파악하기, 다루기 쉽게 수정하기
exam <- read.csv("csv_exam.csv") #데이터 준비
head(exam) # 앞에서부터 6 행까지 출력tail(exam) # 뒤에서부터 6 행까지 출력
View(exam)
dim(exam) # 행, 열 출력
str(exam) # 데이터 속성 확인
summary(exam) # 요약통계량 출력

# ggplo2 의 mpg 데이터를 데이터 프레임 형태로 불러오기
mpg <- as.data.frame(ggplot2::mpg)

#변수명 바꾸기
install.packages("dplyr") # dplyr 설치
library(dplyr) # dplyr 로드
#데이터 프레임 생성
df_raw <- data.frame(var1 = c(1, 2, 1),
                     var2 = c(2, 3, 2))
#복사본 만들기
df_new <- df_raw # 복사본 생성
#변수명 바꾸기
df_new <- rename(df_new, v2 = var2) # var2 를 v2 로 수정


#파생변수
#데이터 프레임 생성
df <- data.frame(var1 = c(4, 3, 8),
                 var2 = c(2, 6, 1))
df$var_sum <- df$var1 + df$var2 # var_sum 파생변수 생성
mpg$total <- (mpg$cty + mpg$hwy)/2 # 통합 연비 변수 생성
summary(mpg$total) # 요약 통계량 산출
hist(mpg$total) # 히스토그램 생성

# 20 이상이면 pass, 그렇지 않으면 fail 부여 
mpg$test <- ifelse(mpg$total >= 20, "pass", "fail")
table(mpg$test) # 연비 합격 빈도표 
library(ggplot2) # ggplot2 로드
qplot(mpg$test) # 연비 합격 빈도 막대 그래프 생성

# total을 기준으로 A, B, C 등급 부여 
mpg$grade <- ifelse(mpg$total >= 30, "A", ifelse(mpg$total >= 20, "B", "C")) head(mpg, 20) 
# 데이터 확인
table(mpg$grade) # 등급 빈도표 생성
qplot(mpg$grade) # 등급 빈도 막대 그래프 생성

# A, B, C, D 등급 부여 
mpg$grade2 <- ifelse(mpg$total >= 30, "A", ifelse(mpg$total >= 25, "B", ifelse(mpg$total >= 20, "C", "D")))

#정리
# 1.데이터 준비, 패키지 준비
mpg <- as.data.frame(ggplot2::mpg) # 데이터 불러오기
library(dplyr) # dplyr 로드
library(ggplot2) # ggplot2 로드

# 2.데이터 파악
head(mpg) # Raw 데이터 앞부분
tail(mpg) # Raw 데이터 뒷부분
View(mpg) # Raw 데이터 뷰어창에서 확인
dim(mpg) # 차원
str(mpg) # 속성
summary(mpg) # 요약 통계량

# 3.변수명 수정
mpg <- rename(mpg, company = manufacturer)
# 4.파생변수 생성 
mpg$total <- (mpg$cty + mpg$hwy)/2 
# 변수 조합 
mpg$test <- ifelse(mpg$total >= 20, "pass", "fail")
# 조건문 활용 
# 5.빈도 확인 
table(mpg$test) # 빈도표 출력 
qplot(mpg$test) # 막대 그래프 생성
