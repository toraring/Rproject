#연장 챙기기
#사용할 패키지 로드
library(ggplot2)

#mpg 데이터의 변수 다뤄보기 
head(mpg)
mean(mpg$hwy)
max(mpg$hwy)
min(mpg$hwy)
hist(mpg$hwy)

#변수 만들기
a <- 1 
a 
## [1] 1 

b <- 2 
b 
## [1] 2 
c <- 3 
c 
## [1] 3 

ab <- 3.5 
ab 
## [1] 3.5
d <- c(1,2,3,4,5) 
d 
## [1] 1 2 3 4 5 

e <- c(1:5) 
e 
## [1] 1 2 3 4 5

f <- seq(1, 5) f 
## [1] 1 2 3 4 5 
g <- seq(1, 10, by=2) 
# 1~10까지 2씩 증가 
g 
## [1] 1 3 5 7 9

#패키지 로드 안하면 함수 사용 불가 
b 
## [1] "a" "a" "b" "c" 

qplot(b) ## Error in qplot(b): could not find function "qplot"

head(mpg)

library(ggplot2) 
qplot(b)
head(mpg)

#함수 파라미터(parameter) 지정하기 
# 'x =' x축 
qplot(data = mpg, x = hwy)
qplot(data = mpg, x = cty)

# 'geom = ' 그래프 형식 
qplot(data = mpg, y = hwy, x = drv, geom = "point")
qplot(data = mpg, y = hwy, x = drv, geom = "boxplot")

# 'colour = ' 색깔 구분 
qplot(data = mpg, y = hwy, x = drv, geom = "boxplot", colour = drv)

#함수 사용법이 궁금할 땐 
help ?qplot