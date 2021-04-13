#데이터준비
exam <- read.csv("csv_exam.csv")

#데이터 앞부분 확인
head(exam)
#앞에서 10행까지
head(exam,10)

#데이터 뒷부분 확인
tail(exam)
#뒤에서 10행까지
tail(exam,10)

#뷰어창에서 데이터 확인
View(exam)#대문자로 꼭하기

#행렬 갯수 확인
dim(exam)

#속성 파악
str(exam)

#요약통계량 산출
summary(exam)

#mpg데이터 파악하기
  #데이터 프레임으로 변환요청함. 
  #더블클론::은 특정폴더명을 선택할때
mpg <- as.data.frame(ggplot2::mpg)
mpg 

head(mpg)#앞부분 데이터확인
tail(mpg)#뒷부분 데이터확인
View(mpg)#view형태로
dim(mpg)#행렬 갯수확인
str(mpg)#속성확인인

#####
#dplyr 패키지 설치 & 로드
install.packages("dplyr")
library(dplyr)

#데이터 프레임 생성
df_raw <- data.frame(var1 = c(1,2,1), var2 = c(2,3,2))
df_raw

#데이터 복사본
  #중간에 수정하기 위함함
  #원본은 raw 복사본은 new로 
df_new <- df_raw
df_new

#변수명 바꾸기
  #var2를 v2로 수정
  #rename()은 새변수명 = 기존변수명 순으로 적을 것
df_new <- rename(df_new, v2 = var2)
df_new



##실습
#ggplot2 패키지의 mpg데이터를 사용할 수 있도록 불러와서 복사본 만들기
mpg <- as.data.frame(ggplot2::mpg)
mpg_new <- mpg
mpg_new

#복사본 데이터 이용하여 cty는 city로, hwy는 highway로 변수명 수정
library(dplyr)#로드하는 부분 없어도 잘되긴함함
mpg_new <- rename(mpg_new, city = cty, highway = hwy)

#수정된 것 출력
head(mpg_new)

#파생변수 만들기#
#데이터 프레임 생성
df <- data.frame(var1 = c(4,3,8), var2 = c(2,6,1))
df
#파생변수 생성
df$var_sum <- df$var1 + df$var2
  #var_sum파생변수 생성성
df
df$var_mean <- (df$var1 + df$var2)/2 #var_mean파생변수 생성
df

#mpg통합연비 변수만들기
mpg$total <- (mpg$cty + mpg$hwy)/2
head(mpg)
mean(mpg$total)

##조건문 활용해 파생변수 만들기
#기준값 정하기
summary(mpg$total)
  #요약 통계량 산출
hist(mpg$total)
  #히스토그램 생성

#조건문으로 합격판정 변수 만들기
mpg$test <- ifelse(mpg$total >= 20, "pass", "fail") 
  #20개 이상이면 pass 아니면 fail
head(mpg, 20) 
  #데이터 확인

#빈도표로 합격판정 자동차 수 확인
table(mpg$test) 
  #연비 합격 빈도표 생성

#그래프로
library(ggplot2)
  #ggplot2 로드
qplot(mpg$test)
  #연비합격 빈도 막대 그래프 생성

#total을 기준으로 A,B,C등급 부여
mpg$grade <- ifelse(mpg$total >=30, "A", ifelse(mpg$total >=20, "B","C"))
head(mpg, 20)
  #데이터 확인

#빈도표, 막대그래프로 연비 등급 확인
table(mpg$grade)
  #등급 빈도표 생성
qplot(mpg$grade)
  #등급 빈도 막대 그래프 생성성

##원하는 만큼 범주 만들기
#A,B,C,D 등급부여
mpg$grade2 <- ifelse(mpg$total >=30, "A", ifelse(mpg$total >=25, "B", ifelse(mpg$total >=20, "C","D")))
head(mpg, 20)                 

###정리#
#1. 데이터 준비, 패키지 준비
mpg <- as.data.frame(ggplot2::mpg)
  #데이터 불러오기
library(dplyr)
  #dplyr 로드
library(ggplot2)
  #ggplot2 로드

#2. 데이터 파악
head(mpg) 
  #Raw 데이터 앞부분
tail(mpg) 
  #Raw 데이터 뒷부분
View(mpg)
  #Raw데이터 뷰어창에서 확인
dim(mpg)
  #차원
str(mpg)
  #속성
summary(mpg)
  #요약 통계량


#3. 변수명 수정(새변수명 = 기존변수명)
mpg <- rename(mpg, company = manufacturer)

#4. 파생변수 생성
mpg$total <- (mpg$cty + mpg$hwy)/2
  #변수 조합
mpg$test <- ifelse(mpg$total >=20, "pass", "fail")
  #조건문 활용

#5. 빈도확인
table(mpg$test)
  #빈도표 출력
qplot(mpg$test)
  #막대 그래프 생성


##실습##
#ggplot2 패키지에는 미국 동북중부 437개 지역의 인구통계 정보를 담은 midwest라는 데이터가 포함되어있습니다. midwest 데이터를 사용해 데이터 분석 문제를 해결해보세요.

#문제 1. ggplot2 의 midwest 데이터를 데이터 프레임 형태로 불러와서 데이터의 특성을 파악하세요.
mpg <- as.data.frame(ggplot2::midwest)
    #library(dplyr)
    #library(ggplot2)
  head(midwest)
  tail(midwest)
  View(midwest)
  dim(midwest)
  str(midwest)
  summary(midwest)
#문제 2. poptotal(전체 인구)을 total 로, popasian(아시아 인구)을 asian 으로 변수명을 수정하세요.
  library(dplyr)
  library(ggplot2)
midwest <- rename(midwest, total = poptotal, asian = popasian)

#문제 3. total, asian 변수를 이용해 '전체 인구 대비 아시아 인구 백분율' 파생변수를 만들고, 히스토그램을만들어 도시들이 어떻게 분포하는지 살펴보세요.
midwest$percent <-midwest$asian / midwest$total*100
  hist(midwest$percent)


#문제 4. 아시아 인구 백분율 전체 평균을 구하고, 평균을 초과하면 "large", 그 외에는 "small"을 부여하는 파생변수를 만들어 보세요.
    #asianP <- mean(midwest$percent)
  asianP <- mean(midwest$percent)
midwest$count <-ifelse(midwest$percent >= asianP, "large", "small") 

#문제 5. "large"와 "small"에 해당하는 지역이 얼마나 되는지, 빈도표와 빈도 막대 그래프를 만들어 확인해보세요.
table(midwest$count)
qplot(midwest$count)
