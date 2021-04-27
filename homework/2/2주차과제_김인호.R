# Week_2 Quiz
# Description
# 문제 바로 아래에 답안을 작성하여, <<r script 형태>>로 저장 후 제출해주시면 됩니다. (.R 파일업로드 / Rproj파일은 업로드하지 않으셔도 됩니다.)
# 답안인 코드만 작성하시면 됩니다. 코드 실행 결과 포함 X
# [R Script Encoding Error] : File > Reopen with Encoding > 'UTF-8' > OK
# 과제 제출 기한은 일요일 저녁 10시까지입니다.

library(dplyr)
# 데이터는 배포해드린 kc_house_data를 사용하세요.

# (5점) 1-(1). 2주차 과제에 배포된 kc_house_data.csv를 다운받고 불러오세요.
# 데이터 출처 : https://www.kaggle.com/harlfoxem/housesalesprediction

dat <- read.csv(file="C:/RProject/Rproject/homework/2/kc_house_data.csv",header=T)
head(dat)

# (5점) 1-(2). 데이터를 검토할 수 있는 함수를 3개 이상 작성하세요.
# Hint. Part3 >  07. Ch 08. 프로젝트를 통해 R 프로그래밍에 익숙해지기 - 01. 한국복지패널 데이터를 활용한 한국인의 삶 분석 참고

dim(dat)
str(dat)
head(dat)
summary(dat)
View(dat)


# (10점) 2. kc_house 데이터에는 층 수를 나타내는 floors 변수가 있습니다. floors 변수의 각 층별 빈도를 구하세요.

unique(dat$floors)
table(dat$floors)

# (10점) 3. floors 변수가 1이면 'low', 1보다 크면 'high'로 구분하는 변수 'floor_level'을 만드세요. 
# Hint : ifelse 함수와 $를 이용하여 해결해보세요.

floor_level <- ifelse(dat$floors == 1, "low","high")


# (10점) 4. 3 에서 생성한 floor_level에 따른 평균 집 값을 출력하는 함수를 작성하세요. 집 값에 관한 변수는 price입니다.
# %>%와 dplyr에서 제공하는 함수를 이용하여 해결하세요.
library(dplyr)

dat_low <- dat %>% filter(floors == 1)
dat_high <- dat %>% filter(floors != 1)

mean(dat_low$price)
mean(dat_high$price)

#정답
kc_house %>% group_by(floor_level) %>%
  summarise(mean_price = mean(price))
#> floor_level 그룹에 따른 평균 가격을 산출하기 위해 group_by와 summarise함수를 사용합니다.
#> group_by를 쓰지 않아도 코드가 비교적 짧게 완성되지만, 범주가 매우 많은 경우 group_by를 쓰지 않으면 범주별로 평균 집값을 출력하는 코드를 작성하는 것이 매우 비효율적입니다.
#따라서 어떤 범주 별로 요약통계량을 구할 때는 group_by와 summarise를 자주 사용해주시기 바랍니다:)

# (10점) 5. grade가 4인 집과 13인 집의 평균 집 값을 비교하고 싶습니다. 
# grade가 4인 집은 group1, 13인 집은 group2라는 새로운 이름의 데이터 프레임을 생성하세요. 이 때, 변수는 grade와 price만 추출하세요.
group1 <- dat[dat$grade==4,1:12] %>% select(grade, price)
group2 <- dat[dat$grade==13,1:12] %>% select(grade, price)

# (5점) 6-(1). 5에서 생성한 데이터프레임으로 grade가 4인 집과 13인 집에 대한 아래의 가설을 검정하려고 합니다.
# 귀무가설 : grade가 4인 집과 13인 집의 가격은 동일하다.
# 대립가설 : grade가 4인 집과 13인 집의 가격은 다르다.
# T검정을 이용하여 가설검정을 진행하세요. (단, 정규성과 등분산성을 만족한다고 가정합니다.***따로 검정 하지마세요.)

t.test(group1[,2], group2[,2], var.equal = TRUE, alternative="less")

#정답
t.test(group1[,2], group2[,2], alternative= 'two.sided',var.equal = TRUE)
#> 정규성 가정과 등분산 가정도 만족한다고 문제에서 주어졌기 때문에 var.equal=TRUE
#> 문제에서 대립가설을 '다르다' 라고 주었기 떄문에 alternative = 'two.sided'가 아닌 다른 것으로 작성하시면 오답처리 됩니다.
#> var.equal 의 디폴트 값은 FALSE이므로 TRUE로 지정하지 않으시면 오답처리 됩니다.


# (5점) 6-(2). 위 결과를 해석하세요.
# 해석 :  
p-value는 0.05보다 작다. 
그래서 대립가설을 채택하므로 
grade가 4인 집과 13인 집의 가격은 다르다.
#정답
p-value가 9.395e-13으로 유의수준 0.05보다 작으므로 귀무가설을 기각한다.
> 9.395e-13은 지수 표현식으로, e-13은 10^(-13) 과 동일한 뜻입니다.
> Tip. options(scipen = 999) 를 실행하면 지수표현식 대신 기존의 표기대로 표시됩니다. 지수표기법으로 복귀는 options(scipen=0)


# r에서는 문자열의 위치에 따라 추출할 수 있는 substr함수가 있습니다. 아래 코드를 실행하여 month 라는 변수를 만들고 아래 7번 문제를 해결하세요.
#(참고: substr함수의 수행 결과는 character형태임)
# 주의 : kc_house는 1-(1)에서 지정한 데이터프레임 이름으로,다를 경우 수정하여 코드를 실행하세요.
dat$month <- substr(dat$date, 5,6)
# (5점) 7-(1). 월 별로 평균 집값에 차이가 있는지 알고 싶습니다. 
# 귀무가설 : 월 별로 평균 집 값에 차이가 없다.
# 대립가설 : 월 별로 평균 집 값에 차이가 있다.
# ANOVA 검정을 시행하세요. (단, 정규성과 등분산성을 만족한다고 가정합니다. ***따로 검정하지 마세요.)
shapiro.test(group1[,2])
qqnorm(group1[,2])
qqline(group1[,2])
shapiro.test(group2[,2])
qqnorm(group2[,2])
qqline(group2[,2])

install.packages("lawstat")
library(lawstat)
levene.test(dat$price,dat$month)

#여기서부터 써도됨.
datAnova <- aov(price ~ month, data=dat)
summary(datAnova)
# (5점) 7-(2). 7-(1) 결과를 해석하세요.

# 해석 :
앞서 anova검정시 p-value가 0.05보다 작다.
이는 대립가설을 채택하는 것이며(=귀무가설 기각)
월별 평균 집값차이가 있다.
