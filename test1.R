a <- 1
head(mpg)
9

#변수지정
b <- c("a","a","b","c")

#패키지 불러오기
library(ggplot2)

#그래프 각각생성
qplot(b)
qplot(data = mpg, x = hwy)
qplot(data = mpg, x = hwy)
