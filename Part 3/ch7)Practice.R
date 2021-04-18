 ###part 7- 1. 결측치 제거
#mpg 데이터 원본에는 결측치가 없습니다. 우선 mpg 데이터를 불러와 몇 개의 값을 결측치로 만들겠습니다.아래 코드를 실행하면 다섯 행의 hwy 변수에 NA가 할당됩니다.

mpg <- as.data.frame(ggplot2::mpg) # mpg 데이터 불러오기
mpg[c(65, 124, 131, 153, 212), "hwy"] <- NA # NA 할당하기
#답은 위와 동일

#• Q1. drv(구동방식)별로 hwy(고속도로 연비) 평균이 어떻게 다른지 알아보려고 합니다. 분석을 하기 전에 우선 두 변수에 결측치가 있는지 확인해야 합니다. drv 변수와 hwy 변수에 결측치가 몇 개 있는지 알아보세요.
is.na(mpg)
table(is.na(mpg$drv))
table(is.na(mpg$hwy))
#답은 위에 is.na(mpg)제외

#• Q2. filter()를 이용해 hwy 변수의 결측치를 제외하고, 어떤 구동방식의 hwy 평균이 높은지 알아보세요. 하나의 dplyr 구문으로 만들어야 합니다.
library(dplyr)
mpg_nomiss <- mpg %>% filter(!is.na(mpg$hwy))
mean(mpg_nomiss$hwy)

#답
mpg %>%
  filter(!is.na(hwy)) %>% # 결측치 제외
  group_by(drv) %>% # drv 별 분리
  summarise(mean_hwy = mean(hwy)) # hwy 평균 구하기
