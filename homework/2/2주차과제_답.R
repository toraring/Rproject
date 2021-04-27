# Week_2 Quiz
# Description
# 문제 바로 아래에 답안을 작성하여, <<r script 형태>>로 저장 후 제출해주시면 됩니다.
library(dplyr)

  # (5점) 1-(1). 2주차 과제 외부데이터에 배포된 kc_house_data.csv를 다운받고 불러오세요.
  # 데이터 출처 : https://www.kaggle.com/harlfoxem/housesalesprediction
  정답 :
    kc_house <- read.csv(file = '경로', header= TRUE)
    > 본인 컴퓨터에 kc_house_data.csv가 지정된 경로를 file= 인자에 입력해주세요. 열 이름이 있는 데이터이므로 header=TRUE로 지정합니다.
  
  
  # (5점) 1-(2). 데이터를 검토할 수 있는 함수를 1개 이상 작성하세요.
  # Hint. Part3 > 07. Ch 08. 프로젝트를 통해 R 프로그래밍에 익숙해지기 - 01. 한국복지패널 데이터를 활용한 한국인의 삶 분석 참고
  정답 : 데이터를 파악하는 함수로는 여러 가지가 있습니다.
  dim(kc_house)
  str(kc_house)
  head(kc_house)
  summary(kc_house)
  외 데이터를 파악하는 함수를 사용하면 모두 정답입니다.
  
  
  # (10점) 2. kc_house 데이터에는 층 수를 나타내는 floors 변수가 있습니다. floors 변수의 각 층별 빈도를 구하세요.
  정답 :
    table(kc_house$floors)
  > table()은 범주형 변수의 빈도를 구해주는 함수입니다. 앞선 1-(2)처럼 데이터 전체의 구조를 파악하는 과정 뿐 아니라 변수의 분포나 형태를
  지속적으로 확인하는 과정을 거치면서 분석을 진행해야합니다.
  
  
  # (10점) 3. floors 변수가 1이면 'low', 1보다 크면 'high'로 구분하는 변수 'floor_level'을 만드세요.
  # Hint : ifelse 함수와 $를 이용하여 해결해보세요.
  정답 :
    kc_house$floor_level <- ifelse(kc_house$floors==1, 'low','high')
  -ifelse 함수의 첫 번째 인자는 논리식을 사용하여야 하므로, =이 아닌 ==를 사용하셔야합니다.
  ifelse(논리식, 논리식이 TRUE일 때의 값, FALSE일 때의 값) 으로 사용할 수 있습니다.
  # (10점) 4. 3 에서 생성한 floor_level에 따른 평균 집 값을 출력하는 함수를 작성하세요. 집 값에 관한 변수는 price입니다.
  # Hint : %>%와 dplyr에서 제공하는 함수를 이용하여 해결해보세요.
  정답 :
    kc_house %>% group_by(floor_level) %>%
    summarise(mean_price = mean(price))
  > floor_level 그룹에 따른 평균 가격을 산출하기 위해 group_by와 summarise함수를 사용합니다.
  > group_by를 쓰지 않아도 코드가 비교적 짧게 완성되지만, 범주가 매우 많은 경우 group_by를 쓰지 않으면
  범주별로 평균 집값을 출력하는 코드를 작성하는 것이 매우 비효율적입니다.
  따라서 어떤 범주 별로 요약통계량을 구할 때는 group_by와 summarise를 자주 사용해주시기 바랍니다:)


# (10점) 5. grade가 4인 집과 13인 집의 평균 집 값을 비교하고 싶습니다.
# grade가 4인 집은 group1, 13인 집은 group2라는 새로운 이름의 데이터 프레임을 생성하세요. 이 때, 변수는 grade와 price만 추출하세요.
# Hint. Data slicing과 관련된 과제입니다. dplyr을 이용하거나 데이터에 직접 접근하여 해결해보세요.
정답 1 :
  group1 <- kc_house %>% filter(grade == 4) %>% select(grade, price)
  group2 <- kc_house %>% filter(grade == 13) %>% select(grade, price)
  정답 2 :
    group1 <- kc_house[kc_house$grade==4, c('grade', 'price')]
  group2 <- kc_house[kc_house$grade==13, c('grade', 'price')]
  외 결과가 동일한 접근법은 모두 만점 처리 하였습니다.
 
  
   # (5점) 6-(1). 5에서 생성한 데이터프레임으로 grade가 4인 집과 13인 집에 대한 아래의 가설을 검정하려고 합니다.
  # 귀무가설 : grade가 4인 집과 13인 집의 가격은 동일하다.
  # 대립가설 : grade가 4인 집과 13인 집의 가격은 다르다.
  # T검정을 이용하여 가설검정을 진행하세요. (단, 정규성과 등분산성을 만족한다고 가정합니다.)
  
  정답 :
    t.test(group1[,2], group2[,2], alternative= 'two.sided',var.equal = TRUE)
  > 정규성 가정과 등분산 가정도 만족한다고 문제에서 주어졌기 때문에 var.equal=TRUE
  > 문제에서 대립가설을 '다르다' 라고 주었기 떄문에 alternative = 'two.sided'가 아닌 다른 것으로 작성하시면 오답처리 됩니다.
  > var.equal 의 디폴트 값은 FALSE이므로 TRUE로 지정하지 않으시면 오답처리 됩니다.
  
  
  # (5점) 6-(2). 위 결과를 해석하세요.
  정답 :
    p-value가 9.395e-13으로 유의수준 0.05보다 작으므로 귀무가설을 기각한다.
  > 9.395e-13은 지수 표현식으로, e-13은 10^(-13) 과 동일한 뜻입니다.
  > Tip. options(scipen = 999) 를 실행하면 지수표현식 대신 기존의 표기대로 표시됩니다. 지수표기법으로 복귀는 options(scipen=0)
  # r에서는 문자열의 위치에 따라 추출할 수 있는 substr함수가 있습니다. 아래 코드를 실행하여 month 라는 변수를 만들고 아래 7번 문제를 해결하세요.
  # (참고: substr함수의 수행 결과는 character형태임)
  # 주의 : kc_house는 1-(1)에서 지정한 데이터프레임 이름으로,다를 경우 수정하여 코드를 실행하세요.
  kc_house$month <- substr(kc_house$date, 5,6)
 
  
   # (5점) 7-(1). 월 별로 평균 집값에 차이가 있는지 알고 싶습니다.
  # 귀무가설 : 월 별로 평균 집 값에 차이가 없다.
  # 대립가설 : 월 별로 평균 집 값에 차이가 있다.
  # ANOVA 검정을 시행하세요. (단, 정규성과 등분산성을 만족한다고 가정합니다.)
  aov_house <- aov(price~month, data=kc_house)
  > 종속변수와 독립변수의 위치가 바뀌면 결과가 다르게 나오므로 오답입니다.
  > 각 범주에 따라 데이터를 따로 지정해주지 않아도 aov함수 내에서 범주별 평균 가격을 계산하여줍니다.
  
  
  # (5점) 7-(2). 7-(1) 결과를 해석하세요.
  # 주의 : summary 함수를 사용해야 p-value를 확인할 수 있습니다.
  summary(aov_house)
  해석 : p-value가 0.000287으로 유의수준 0.05보다 작으므로 귀무가설을 기각한다.
  