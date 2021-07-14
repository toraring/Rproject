1. 데이터 확인
head(iris)

2. 결측치 확인
colSums(is.na(iris))

3. 변수별 기술통계 및 분포 확인
summary(iris)
boxplot(iris[,1:4])

분석, 결과치 확인 및 해석
4. pca 함수 적용 및 요약 결과 확인
iris.pca <- prcomp(iris[1:4], center = T, scale. = T) # pca 함수

summary(iris.pca) # pca 요약정보. standard deviation 제곱 = 분산 = eivenvalue

iris.pca$rotation # 각 주성분의 eigenvector

head(iris.pca$x, 10) # 각 주성분의 값

5. scree plot 확인
plot(iris.pca, type = 'l', main = 'Scree Plot') # PC의 분산을 y축으로 scree plot 생성

6. 차원축소
head(iris.pca$x[,1:2], 10) # 2개의 차원으로 축소

7. 2차원 시각화
library(ggfortify)
autoplot(iris.pca, data = iris, colour = 'Species') # 2차원으로 축소된 데이터 시각화



