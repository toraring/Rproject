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