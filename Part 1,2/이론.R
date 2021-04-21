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