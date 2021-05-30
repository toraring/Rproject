K means 실습 1

1. 데이터 다운로드
# https://archive.ics.uci.edu/ml/datasets/Wholesale+customers

2. 데이터 read
df <- read.csv('Wholesale customers data.csv', stringsAsFactors = F, header = T)

3. 데이터 확인
library(dplyr)
head(df)

4. 결측치 확인
colSums(is.na(df))

5. 변수별 기술통계 및 분포 확인
summary(df)
boxplot(df[,3:ncol(df)])

6. 지수표기법 변경
options(scipen = 100)
boxplot(df[,3:ncol(df)])

7. 이상치 제거
temp <- NULL
for (i in 3:ncol(df)) {
  temp <- rbind(temp, df[order(df[,i], decreasing = T),] %>% slice(1:5))
}
temp %>% arrange(Fresh) %>% head() # 중복이 있음

temp <- distinct(temp) # 중복 제거
df.rm.outlier <- anti_join(df,temp) # df에서 temp 제거


