#가설검정
1.두집단 차이검정
1.1.각 집단 표본 수 = 3
1.1.1.파일 불러오기
setwd("C:/RProject/Rproject/Part 4/Data")
rawN3 <- read.csv(file="./dataset/hypothesis/htest01.csv", header = TRUE)
head(rawN3)

1.1.2.그룹 이름 확인
unique(rawN3$group)

1.1.3그룹 나누기
groupA <- rawN3[rawN3$group=='A',1:2]
groupB <- rawN3[rawN3$group=='B',1:2]

1.1.4.그룹 별 평균 구하기
mean(groupA[,2])

mean(groupB[,2])

1.1.5.정규성 테스트
shapiro.test(groupA[,2])

qqnorm(groupA[,2])
qqline(groupA[,2])

shapiro.test(groupB[,2])

qqnorm(groupB[,2])
qqline(groupB[,2])

1.1.6.분산 동질성 검정
var.test(groupA[,2], groupB[,2])

1.1.7.t-검정
t.test(groupA[,2], groupB[,2], var.equal = TRUE, alternative="less")


