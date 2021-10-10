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

#• 2.포드 연비 높은순 정렬
mpg %>%
  filter(manufacturer=="ford") %>%
  group_by(model) %>%
  arrange(desc(hwy))

#• 3.배기량이 연비에 미치는 영향 회귀분석
lm.mpg <- lm(data=mpg, hwy ~ displ) # 회귀분석 
summary(lm.mpg) # 결과 출력
#• 배기량과 연비 관계 그래프 
qplot(data = mpg, x = displ, y = hwy)

#• 배기량과 연비 관계 그래프 
qplot(data = mpg, x = displ, y = hwy)