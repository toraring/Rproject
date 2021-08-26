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