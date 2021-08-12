#[고속도로 연비 관련 실습]
#Q1. ggplot2 패키지의 mpg 데이터를 사용할 수 있도록 불러온 뒤 복사본을 만드세요.
mpg <- as.data.frame(ggplot2::mpg) # mpg 데이터 불러오기
mpg_new <- mpg # 복사본 만들기

#Q2. 복사본 데이터를 이용해서 cty는 city로, hwy는 highway로 변수명을 수정하세요.
mpg_new <- rename(mpg_new, city = cty) 
# cty 를 city 로 수정
mpg_new <- rename(mpg_new, highway = hwy) 
# hwy 를 highway 로 수정

#Q3. 데이터 일부를 출력해서 변수명이 바뀌었는지 확인해 보세요. 아래와 같은 결과물이 출력되어야 합니다.
head(mpg_new) # 데이터 일부 출력

#[고속도로 연비 관련 실습2]
#Q1. 자동차 배기량에 따라 고속도로 연비가 다른지 알아보려고 합니다. displ(배기량)이 4 이하인 자동차와 5 이상인 자동차 중 어떤 자동차의 hwy(고속도로 연비)가 평균적으로 더 높은지 알아보세요.
mpg <- as.data.frame(ggplot2::mpg) # mpg 데이터 불러오기
mpg_a <- mpg %>% filter(displ <= 4) # displ 4 이하 추출
mpg_b <- mpg %>% filter(displ >= 5) # displ 5 이상 추출
mean(mpg_a$hwy) # displ 4 이하 hwy 평균
## [1] 25.96319
mean(mpg_b$hwy) # displ 5 이상 hwy 평균
## [1] 18.07895

#Q2. 자동차 제조 회사에 따라 도시 연비가 다른지 알아보려고 합니다. "audi"와 "toyota" 중 어느 manufacturer(자동차 제조 회사)의 cty(도시 연비)가 평균적으로 더 높은지 알아보세요.
mpg_audi <- mpg %>% filter(manufacturer == "audi") # audi 추출
mpg_toyota <- mpg %>% filter(manufacturer == "toyota") # toyota 추출
mean(mpg_audi$cty) # audi 의 cty 평균
## [1] 17.61111
mean(mpg_toyota$cty) # toyota 의 cty 평균
## [1] 18.52941

#Q3. "chevrolet", "ford", "honda" 자동차의 고속도로 연비 평균을 알아보려고 합니다. 이 회사들의 자동차를 추출한 뒤 hwy 전체 평균을 구해보세요.
# manufacturer 가 chevrolet, ford, honda 에 해당하면 추출
mpg_new <- mpg %>% filter(manufacturer %in% c("chevrolet", "ford", "honda"))
mean(mpg_new$hwy)
## [1] 22.50943

#[고속도로 연비 관련 실습3]
#Q1. mpg 데이터는 11개 변수로 구성되어 있습니다. 이 중 일부만 추출해서 분석에 활용하려고 합니다. mpg 데이터에서 class(자동차 종류), cty(도시 연비) 변수를 추출해 새로운 데이터를 만드세요. 새로 만든 데이터의 일부를 출력해서 두 변수로만 구성되어 있는지 확인하세요.
mpg <- as.data.frame(ggplot2::mpg) # mpg 데이터 불러오기

df <- mpg %>% select(class, cty) # class, cty 변수 추출
head(df) # df 일부 출력

#Q2. 자동차 종류에 따라 도시 연비가 다른지 알아보려고 합니다. 앞에서 추출한 데이터를 이용해서 class(자동차 종류)가 "suv"인 자동차와  compact"인 자동차 중 어떤 자동차의 cty(도시 연비)가 더 높은지 알아보세요.
df_suv <- df %>% filter(class == "suv") # class 가 suv 인 행 추출
df_compact <- df %>% filter(class == "compact") # class 가 compact 인 행 추출

mean(df_suv$cty) # suv 의 cty 평균
## [1] 13.5

mean(df_compact$cty) # compact 의 cty 평균
## [1] 20.12766

#[고속도로 연비 관련 실습4]
#Q. audi에서 생산한 차 중 1~5위 자동차 데이터 출력하시오
mpg <- as.data.frame(ggplot2::mpg) # mpg 데이터 불러오기 
mpg %>% filter(manufacturer == "audi") %>% # audi 추출
  arrange(desc(hwy)) %>% # hwy 내림차순 정렬
  head(5) # 5행까지 출력


#[고속도로 연비 관련 실습5]
#Q1. mpg 데이터 복사본을 만들고, cty와 hwy를 더한 '합산 연비 변수'를 추가하세요.
mpg <- as.data.frame(ggplot2::mpg) # mpg 데이터 불러오기
mpg_new <- mpg # 복사본 만들기
mpg_new <- mpg_new %>% mutate(total = cty + hwy) # 합산 변수 만들기

#Q2. 앞에서 만든 '합산 연비 변수'를 2로 나눠 '평균 연비 변수'를 추가세요.
mpg_new <- mpg_new %>% mutate(mean = total/2) # 평균 변수 만들기

#Q3. '평균 연비 변수'가 가장 높은 자동차 3종의 데이터를 출력하세요.
mpg_new %>%
  arrange(desc(mean)) %>% # 내림차순 정렬
  head(3) # 상위 3 행 출력

#Q4. 1~3번 문제를 해결할 수 있는 하나로 연결된 dplyr 구문을 만들어 출력하세요. 데이터는 복사본 대신 mpg 원본을 이용하세요.
mpg %>%
  mutate(total = cty + hwy, # 합산 변수 만들기
         mean = total/2) %>% # 평균 변수 만들기
  arrange(desc(mean)) %>% # 내림차순 정렬
  head(3) # 상위 3 행 출력


#[고속도로 연비 관련 실습6]
#Q1. mpg 데이터의 class는 "suv", "compact" 등 자동차를 특징에 따라 일곱 종류로 분류한 변수입니다.어떤 차종의 연비가 높은지 비교해보려고 합니다. class별 cty 평균을 구해보세요.
mpg <- as.data.frame(ggplot2::mpg) # mpg 데이터 불러오기

mpg %>%
  group_by(class) %>% # class 별 분리
  summarise(mean_cty = mean(cty)) # cty 평균 구하기

#Q2. 앞 문제의 출력 결과는 class 값 알파벳 순으로 정렬되어 있습니다. 어떤 차종의 도시 연비가 높은지 쉽게 알아볼 수 있도록 cty 평균이 높은 순으로 정렬해 출력하세요.
mpg %>%
  group_by(class) %>% # class 별 분리
  summarise(mean_cty = mean(cty)) %>% # cty 평균 구하기
  arrange(desc(mean_cty)) # 내림차순 정렬하기

#Q3. 어떤 회사 자동차의 hwy(고속도로 연비)가 가장 높은지 알아보려고 합니다. hwy 평균이 가장 높은 회사 세 곳을 출력하세요.
mpg %>%
  group_by(manufacturer) %>% # manufacturer 별 분리
  summarise(mean_hwy = mean(hwy)) %>% # hwy 평균 구하기
  arrange(desc(mean_hwy)) %>% # 내림차순 정렬하기
  head(3) # 상위 3 행 출력

#Q4. 어떤 회사에서 "compact"(경차) 차종을 가장 많이 생산하는지 알아보려고 합니다. 각 회사별 "compact" 차종 수를 내림차순으로 정렬해 출력하세요.