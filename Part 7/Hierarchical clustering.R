Hierarchical clustering 실습

데이터 파악

1. 데이터 확인
df <- USArrests
head(df)

2. 결측치 확인
colSums(is.na(df))

3. 변수별 기술통계 및 분포 확인
summary(df)
boxplot(df)

4. 표준화
library(dplyr)
df <- scale(df) %>% as.data.frame()
boxplot(df)

5. 이상치 제거
library(tibble)
df.rm.outlier <- df %>% rownames_to_column('rname') %>%
  arrange(desc(`Rape`)) %>%
  slice(-1:-2) %>%
  column_to_rownames('rname')
boxplot(df.rm.outlier)
