#part5-1#

#Q1. 자동차 배기량에 따라 고속도로 연비가 다른지 알아보려고 합니다. displ(배기량)이 4 이하인 자동차와 5 이상인 자동차 중 어떤 자동차의 hwy(고속도로 연비)가 평균적으로 더 높은지 알아보세요.

#library(dplyr)
mpg <- as.data.frame(ggplot2::mpg)
#library(ggplot2)
mpg
mpg_a <-mpg %>% filter(displ <= 4)
mpg_b <-mpg %>% filter(displ >= 5)
mean(mpg_a$hwy)
mean(mpg_b$hwy)
View(mpg)
##

#Q2. 자동차 제조 회사에 따라 도시 연비가 다른지 알아보려고 합니다. "audi"와 "toyota" 중 어느manufacturer(자동차 제조 회사)의 cty(도시 연비)가 평균적으로 더 높은지 알아보세요.
mpg_c <-mpg %>% filter(manufacturer == "audi")
mpg_d <-mpg %>% filter(manufacturer == "toyota")
mean(mpg_c$cty)
mean(mpg_d$cty)
##

#Q3. "chevrolet", "ford", "honda" 자동차의 고속도로 연비 평균을 알아보려고 합니다. 이 회사들의 자동차를 추출한 뒤 hwy 전체 평균을 구해보세요.
    #mpg_1 <-mpg %>% filter(manufacturer == "chevrolet")
    #mpg_2 <-mpg %>% filter(manufacturer == "ford")
    #mpg_3 <-mpg %>% filter(manufacturer == "honda")
    #mean(mpg_1$hwy + mpg_2$hwy + mpg_3$hwy)

mpg_new <- mpg %>% filter(manufacturer %in% c("chevrolet", "ford", "honda"))#3개중 하나를 쓸거면 %in%
mean(mpg_new$hwy)
