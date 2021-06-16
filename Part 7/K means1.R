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

8. 이상치 제거 후 박스플롯 확인
par(mfrow = c(1,2))
boxplot(df[,3:ncol(df)])
boxplot(df.rm.outlier[,3:ncol(df)])

dev.off()

분석, 결과치 확인 및 해석
1. k 군집 개수 설정 (Elbow method)
library(factoextra)
set.seed(1234)  
fviz_nbclust(df.rm.outlier[,3:ncol(df.rm.outlier)], kmeans, method = "wss", k.max = 1
             5) +
  theme_minimal() +
  ggtitle("Elbow Method")

2. k 군집 개수 설정 (Silhouette method)
fviz_nbclust(df.rm.outlier[,3:ncol(df.rm.outlier)], kmeans, method = "silhouette", k.
             max = 15) +
  theme_minimal() +
  ggtitle("Silhouette Plot")

3. k means 모델 생성
df.kmeans <- kmeans(df.rm.outlier[,3:ncol(df.rm.outlier)], centers = 5, iter.max =100
                    0 )
df.kmeans

4. 군집별 평균치 시각화
barplot(t(df.kmeans$centers), beside=TRUE, col = 1:6)
legend("topleft", colnames(df[,3:8]), fill = 1:6, cex = 0.5)


