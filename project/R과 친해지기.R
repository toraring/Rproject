#R과 친해지기
#패키지 설치 
install.packages("dplyr") install.packages("ggplot2")

#패키지 로드 
library(dplyr) library(ggplot2)

#데이터 검토
head(mpg)
dim(mpg)
str(mpg)
summary(mpg)

#• 1.회사별 평균 연비 높은순 정렬
mpg %>% 
  group_by(manufacturer) %>%
  summarise(mean.hwy=mean(hwy))