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
#filter는 행을 select는 열을 추출?


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

#가독성을 위해 파이프 %>% 이후 엔터
df_suv <- df %>%
  filter(class == "suv") 
  # class 가 suv 인 행 추출
df_compact <- df %>% 
  filter(class == "compact") 
  # class 가 compact 인 행 추출
mean(df_suv$cty) 
  # suv 의 cty 평균
mean(df_compact$cty) 
  # compact 의 cty 평균

#내가쓴거#
mpg_suv <- mpg_e %>%
  select(class == "suv")
mpg_com <- mpg_e %>% 
  select(class == "compact")

#####
##part 5-3##
#"audi"에서 생산한 자동차 중에 어떤 자동차 모델의 hwy(고속도로 연비)가 높은지 알아보려고 합니다. 
#"audi"에서 생산한 자동차 중 hwy가 1~5위에 해당하는 자동차의 데이터를 출력하세요.
mpg <- as.data.frame(ggplot2::mpg) 
  # mpg 데이터 불러오기
mpg %>% filter(manufacturer == "audi") %>% 
    # audi 추출
  arrange(desc(hwy)) %>% 
    # hwy 내림차순 정렬
  head(5)
    # 5행까지 출력

#내가 푼것#
mpg <- as.data.frame(ggplot2::mpg)
mpg_audi <- mpg %>% 
  filter(manufacturer == "audi") %>% 
  arrange(desc(mpg_audi$hwy)) %>% 
    #mpg_audi는 중복된다
  head(5)
mpg_audi

###
##part 5-4##
#mpg 데이터는 연비를 나타내는 변수가 hwy(고속도로 연비), cty(도시 연비) 두 종류로 분리되어 있습니다. 두변수를 각각 활용하는 대신 하나의 통합 연비 변수를 만들어 분석하려고 합니다.
#• Q1. mpg 데이터 복사본을 만들고, cty 와 hwy 를 더한 '합산 연비 변수'를 추가하세요.
mpg <- as.data.frame(ggplot2::mpg) # mpg 데이터 불러오기
mpg_new <- mpg # 복사본 만들기
mpg_new <- mpg_new %>% mutate(total = cty + hwy) # 합산 변수 만들기

#• Q2. 앞에서 만든 '합산 연비 변수'를 2 로 나눠 '평균 연비 변수'를 추가세요.
mpg_new <- mpg_new %>% mutate(mean = total/2) # 평균 변수 만들기

#• Q3. '평균 연비 변수'가 가장 높은 자동차 3 종의 데이터를 출력하세요.
mpg_new %>%
  arrange(desc(mean)) %>% # 내림차순 정렬
  head(3) # 상위 3 행 출력

#• Q4. 1~3 번 문제를 해결할 수 있는 하나로 연결된 dplyr 구문을 만들어 출력하세요. 데이터는 복사본 대신 mpg 원본을 이용하세요.
mpg %>%
  mutate(total = cty + hwy, # 합산 변수 만들기
         mean = total/2) %>% # 평균 변수 만들기
  arrange(desc(mean)) %>% # 내림차순 정렬
  head(3) # 상위 3 행 출력

#Q1-3은 파생변수를 이후에도 계속 사용할때 쓰임
#Q4는 이번 한번만 변수쓸때 사용

#내가 푼것
mpg_new <- as.data.frame(ggplot2::mpg) 
mpg_new %>% 
  mutate(mpg_ch = cty + hwy, 
         mpg_ch2 = mpg_ch/2) %>%
  arrange(desc(mpg_ch2)) %>% 
  head(3)

library(dplyr)
mpg_raw <- mpg_new  
mpg_raw

###part5-5###
#• Q1. mpg 데이터의 class 는 "suv", "compact" 등 자동차를 특징에 따라 일곱 종류로 분류한 변수입니다. 어떤 차종의 연비가 높은지 비교해보려고 합니다. class 별 cty 평균을 구해보세요.
mpg_new2 <- as.data.frame(ggplot2::mpg)
mpg_summary <- mpg_new2 %>% 
  group_by(class, cty) %>% 
  summarise(mean_cty = mean(cty))
View(mpg_new2)

#답
mpg <- as.data.frame(ggplot2::mpg) # mpg 데이터 불러오기
mpg %>%
  group_by(class) %>% # class 별 분리
  summarise(mean_cty = mean(cty)) # cty 평균 구하기
##

#• Q2. 앞 문제의 출력 결과는 class 값 알파벳 순으로 정렬되어 있습니다. 어떤 차종의 도시 연비가 높은지쉽게 알아볼 수 있도록 cty 평균이 높은 순으로 정렬해 출력하세요.
mpg_summary %>% 
  arrange(desc(mean_cty))#파생변수 있어야함

#답
mpg %>%
  group_by(class) %>% # class 별 분리
  summarise(mean_cty = mean(cty)) %>% # cty 평균 구하기
  arrange(desc(mean_cty)) # 내림차순 정렬하기
##

#• Q3. 어떤 회사 자동차의 hwy(고속도로 연비)가 가장 높은지 알아보려고 합니다. hwy 평균이 가장 높은 회사 세 곳을 출력하세요.
mpg_new2 %>%   
  group_by(manufacturer, hwy) %>% 
  summarise(mean_hwy = mean(hwy)%>%
  head(3)
  
#답
mpg %>%
  group_by(manufacturer) %>% # manufacturer 별 분리
  summarise(mean_hwy = mean(hwy)) %>% # hwy 평균 구하기
  arrange(desc(mean_hwy)) %>% # 내림차순 정렬하기
  head(3) # 상위 3 행 출력
  
#• Q4. 어떤 회사에서 "compact"(경차) 차종을 가장 많이 생산하는지 알아보려고 합니다. 각 회사별 "compact" 차종 수를 내림차순으로 정렬해 출력하세요.
mpg_new2 %>% 
  group_by(manufacturer, class) %>% 
  head(3)

#답
mpg %>%
  filter(class == "compact") %>% # compact 추출
  group_by(manufacturer) %>% # manufacturer 별 분리
  summarise(count = n()) %>% # 빈도 구하기
  arrange(desc(count)) # 내림차순 정렬