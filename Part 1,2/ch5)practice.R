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
###
#filter는 행을 select는 열을 추출


###part 5-2
#Q1. mpg 데이터는 11 개 변수로 구성되어 있습니다. 이 중 일부만 추출해서 분석에 활용하려고 합니다. mpg데이터에서 class(자동차 종류), cty(도시 연비) 변수를 추출해 새로운 데이터를 만드세요. 새로 만든 데이터의 일부를 출력해서 두 변수로만 구성되어 있는지 확인하세요.
mpg <- as.data.frame(ggplot2::mpg) 
  # mpg 데이터 불러오기
df <- mpg %>% select(class, cty)
  # class, cty 변수 추출
head(df)
  # df 일부 출력
##내가쓴거##
mpg_e <- mpg %>% select(class, cty)
mpg_e

#Q2. 자동차 종류에 따라 도시 연비가 다른지 알아보려고 합니다. 앞에서 추출한 데이터를 이용해서class(자동차 종류)가 "suv"인 자동차와 "compact"인 자동차 중 어떤 자동차의 cty(도시 연비)가 더 높은지 알아보세요.
df_suv <- df %>% filter(class == "suv") 
  # class 가 suv 인 행 추출
df_compact <- df %>% filter(class == "compact") 
  # class 가 compact 인 행 추출
mean(df_suv$cty) 
  # suv 의 cty 평균
mean(df_compact$cty) 
  # compact 의 cty 평균

#내가쓴거#
mpg_suv <- mpg_e %>% select(class == "suv")
mpg_com <- mpg_e %>% select(class == "compact")
