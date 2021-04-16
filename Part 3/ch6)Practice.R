##part 6-1

#mpg 데이터와 midwest 데이터를 이용해서 분석 문제를 해결해 보세요.
#• Q1. mpg 데이터의 cty(도시 연비)와 hwy(고속도로 연비) 간에 어떤 관계가 있는지 알아보려고 합니다. x 축은 cty, y 축은 hwy 로 된 산점도를 만들어 보세요.
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
ggplot(data = mpg, aes(x = cty, y = hwy)) + geom_point( )

#답
#위와 동일

#• Q2. 미국 지역별 인구통계 정보를 담은 ggplot2 패키지의 midwest 데이터를 이용해서 전체 인구와 아시아인 인구 간에 어떤 관계가 있는지 알아보려고 합니다. x 축은 poptotal(전체 인구), y 축은 popasian(아시아인 인구)으로 된 산점도를 만들어 보세요. 전체 인구는 50 만 명 이하, 아시아인 인구는 1 만 명 이하인 지역만 산점도에 표시되게 설정하세요.
ggplot(data = midwest, aes(x = poptotal, y = popasian)) + geom_point() + xlim(0, 500000)+ ylim(0, 10000)

#답
#위와동일

#ggplot은 하이픈 %>% 대신 + 로 연결
#xlim, ylim은 범위를 지정해주는것.. 범위지정안하면 x, y축 범위가 너무 커진다

###
##part 6-2
#• Q1. 어떤 회사에서 생산한 "suv" 차종의 도시 연비가 높은지 알아보려고 합니다. "suv" 차종을 대상으로 평균 cty(도시 연비)가 가장 높은 회사 다섯 곳을 막대 그래프로 표현해 보세요. 막대는 연비 가 높은 순으로 정렬하세요.
library(ggplot2)
library(dplyr)
mpg <- as.data.frame(ggplot2::mpg)

df_mpg <- mpg %>% 
  filter(class = "suv")
  group_by(cty) %>% 
  summarise(mean_cty = mean(cty))
View(mpg)

ggplot(data = mpg, aes((x = reorder("suv", -mean_cty), y = mean_cty) + geom_col

#답
# 평균 표 생성
df <- mpg %>%
  filter(class == "suv") %>%
  group_by(manufacturer) %>%
  summarise(mean_cty = mean(cty)) %>%
  arrange(desc(mean_cty)) %>%
  head(5)
# 그래프 생성
ggplot(data = df, aes(x = reorder(manufacturer, -mean_cty), y = mean_cty)) + geom_col()

                      
#• Q2. 자동차 중에서 어떤 class (자동차 종류)가 가장 많은지 알아보려고 합니다. 자동차 종류별 빈도를 표현한 막대 그래프를 만들어 보세요.
df_mpg <- mpg %>% 
  group_by(class) %>% 
  summarise(mean_hty = mean(cty))
View(mpg)

ggplot(data = mpg, aes(x = cty)) + geom_bar

#답
ggplot(data = mpg, aes(x = class)) + geom_bar()
