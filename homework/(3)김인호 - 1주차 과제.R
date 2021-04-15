# Week_1 Quiz
# Date : 2021-02-25
# Description
# 문제 바로 아래에 답안을 작성하여, r script 형태로 저장 후 제출해주시면 됩니다.
# 과제 제출 기한은 일요일(2/28) 저녁 10까지입니다.

library(dplyr)
library(ggplot2)


# 1. head함수를 활용하여 "mpg" 데이터의 상위 10개 자료를 출력해주세요. (5점)
head(mpg, 10)


# 2. seq함수를 활용하여 1~50까지 숫자 중 5의 배수를 출력해주세요. (10점)
seq_5 <- seq(5, 50, by=5)
seq_5

# 3. 다음과 같은 데이터가 존재합니다. 
# paste 함수를 활용하여 "2021-05-06"이라는 문자열을 출력해주세요. (10점)
year <- "2021"
month <- "05"
day <- "06"

date <- c(year, month, day)
paste(date, collapse = "-")

# 4. 1~50까지의 숫자가 있을 때, 각 숫자에 3을 곱한 결과를 출력해주세요. (10점)
# (예시 : 3, 6, 9, 12, ..., 150)
seq_a <- seq(1, 50)*3
seq_a

# R에는 기본으로 제공하는 내장 데이터와 각 패키지별로 제공하는 데이터셋이 존재합니다.
# 참고 링크 : https://vincentarelbundock.github.io/Rdatasets/datasets.html
# 
# ggplot2 패키지에서는 mpg 외, "diamonds"라는 데이터도 제공합니다.
# 해당 데이터에 대해 "데이터의 크기(행,열)", "변수들의 속성", "요약 통계량"을 확인할 수 있는 함수를 작성해주세요.


# 5. 데이터의 크기 (5점)
mpg <- as.data.frame(ggplot2::mpg)
dim(mpg)

diamonds <- as.data.frame(ggplot2::diamonds)
dim(diamonds)


# 6. 변수들의 속성 (5점)
str(mpg)
str(diamonds)


# 7. 요약통계량 (5점)
summary(mpg)
summary(diamonds)


# 8. 외부 데이터 불러오기 : 과제와 함께 전달드린 kc_house_data를 불러와주세요. (10점)
install.packages("readxl")
library(readxl)

df_data <- read_excel("kc_house_data.xlsx", sheet = 1, col_names = T)
df_data
# 9. 여러 변수 추출하기 : 8번에서 불러온 데이터에서 변수 id, date,	price, bedrooms를 추출하는 script를 작성해주세요. (10점)
# 만약 8번 데이터을 풀지 못하셨다면 변수 df에 데이터를 불러왔다고 가정하고 4개 변수를 추출하는 script를 작성해주세요.

df_data %>% select(id, date, price, bedrooms)


