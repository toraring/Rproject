##[mpg데이터 결측치 확인]
#Q1.drv(구동방식)별로 hwy(고속도로 연비) 평균이 어떻게 다른지 알아보려고 합니다. 분석을 하기 전에 우선 두 변수에 결측치가 있는지 확인해야 합니다. drv 변수와 hwy 변수에 결측치가 몇 개 있는지 알아보세요.
table(is.na(mpg$drv)) # drv 결측치 빈도표 출력
##
## FALSE
## 234

table(is.na(mpg$hwy)) # hwy 결측치 빈도표 출력
##
## FALSE TRUE
## 229 5

#Q2. filter()를 이용해 hwy 변수의 결측치를 제외하고, 어떤 구동방식의 hwy 평균이 높은지 알아보세요. 하나의 dplyr 구문으로 만들어야 합니다.
mpg %>%
  filter(!is.na(hwy)) %>% # 결측치 제외
  group_by(drv) %>% # drv 별 분리
  summarise(mean_hwy = mean(hwy)) # hwy 평균 구하기