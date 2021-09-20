#프로젝트를 통해 R 프로그래밍에 익숙해지기 1
##실전 분석 미션 "한국인의 삶을 파악하라!" - 한국복지패널 데이터

#분석 목표
#• 분석1: 성별에 따른 소득
#• 분석2: 나이와 소득의 관계
#• 분석3: 연령대에 따른 소득
#• 분석4: 연령대 및 성별에 따른 소득

#foreign 패키지 설치
install.packages("foreign")

#패키지 로드
library(foreign)
library(dplyr)
library(ggplot2)

#데이터 불러오기
# 복지패널데이터 로드
raw_welfare <- read.spss("data_spss_Koweps2014.sav", to.data.frame = T)

# 데이터 copy
welfare <- raw_welfare