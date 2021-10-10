#연장 챙기기
#사용할 패키지 로드
library(ggplot2)

#mpg 데이터의 변수 다뤄보기 
head(mpg)
mean(mpg$hwy)
max(mpg$hwy)
min(mpg$hwy)
hist(mpg$hwy)