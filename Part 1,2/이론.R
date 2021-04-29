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


###
#조건에 맞는 데이터만 추출하기
#dplyr 패키지 로드 & 데이터 준비
library(dplyr)
exam <- read.csv("csv_exam.csv")
exam
# exam 에서 class 가 1 인 경우만 추출하여 출력
exam %>% filter(class == 1)
# 2반인 경우만 추출 
exam %>% filter(class == 2)

# 수학 점수가 50점을 초과한 경우 
exam %>% filter(math > 50)
# 영어점수가 80 점 이하인 경우
exam %>% filter(english <= 80)

#여러조건 충족하는 행 추출
# 1 반 이면서 수학 점수가 50 점 이상인 경우
exam %>% filter(class == 1 & math >= 50)
# 2반 이면서 영어점수가 80점 이상인 경우 
exam %>% filter(class == 2 & english >= 80)

#여러 조건 중 하나 이상 충족하는 행 추출하기
# 수학 점수가 90 점 이상이거나 영어점수가 90 점 이상인 경우
exam %>% filter(math >= 90 | english >= 90)

# 영어점수가 90점 미만이거나 과학점수가 50점 미만인 경우
exam %>% filter(english < 90 | science < 50)

목록에 해당되는 행 추출하기
exam %>% filter(class == 1 | class == 3 | class == 5) # 1, 3, 5 반에 해당되면 추출
%in% 기호 이용하기 
exam %>% filter(class %in% c(1,3,5)) # 1, 3, 5 반에 해당하면 추출

추출한 행으로 데이터 만들기
class1 <- exam %>% filter(class == 1) # class 가 1 인 행 추출, class1 에 할당
class2 <- exam %>% filter(class == 2) # class 가 2 인 행 추출, class2 에 할당
mean(class1$math) # 1 반 수학 점수 평균 구하기
mean(class2$math) # 2 반 수학 점수 평균 구하기

2. 필요한 변수만 추출하기
exam %>% select(math) # math 추출
exam %>% select(english) # english 추출
여러 변수 추출하기 
exam %>% select(class, math, english) # class, math, english 변수 추출
변수 제외하기 
exam %>% select(-math) # math 제외
exam %>% select(-math, -english) # math, english 제외

dplyr 함수 조합하기 
# class가 1인 행만 추출한 다음 english 추출 
exam %>% filter(class == 1) %>% select(english)
#가독성 있게 줄 바꾸기
exam %>%
  filter(class == 1) %>% # class 가 1 인 행 추출
  select(english) # english 추출
일부만 출력하기 
exam %>% select(id, math) %>% # id, math 추출 head # 앞부분 6행까지 추출
  
  일부만 출력하기
exam %>%
  select(id, math) %>% # id, math 추출
  head(10) # 앞부분 10 행까지 추출

오름차순으로 정렬하기 
exam %>% arrange(math) # math 오름차순 정렬
내림차순으로 정렬하기 
exam %>% arrange(desc(math)) # math 내림차순 정렬
정렬 기준 변수 여러개 지정
exam %>% arrange(class, math) # class 및 math 오름차순 정렬

