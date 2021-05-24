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
###

1.2.각 집단 표본 수 = 10
1.2.1.데이터 불러오기
setwd("C:/RProject/Rproject/Part 4/Data")
rawN10 <- read.csv(file="./dataset/hypothesis/htest02.csv", header = TRUE)
head(rawN10)

1.2.2.그룹 이름 확인
unique(rawN10$group)

1.2.3.그룹 나누기
groupA2 <- rawN10[rawN10$group=='A',1:2]
groupB2 <- rawN10[rawN10$group=='B',1:2]

1.2.4.그룹 별 평균 구하기
mean(groupA2[,2])

mean(groupB2[,2])

1.2.5.정규성 검정
shapiro.test(groupA2[,2])

qqnorm(groupA2[,2])
qqline(groupA2[,2])

shapiro.test(groupB2[,2])

qqnorm(groupB2[,2])
qqline(groupB2[,2])

1.2.6.분산 동질성 검정
var.test(groupA2[,2], groupB2[,2])

1.2.7.t-검정
t.test(groupA2[,2], groupB2[,2], var.equal = FALSE, , alternative="less")

1.3.대응표본 t 검정
1.3.1.데이터 불러오기
setwd("C:/RProject/Rproject/Part 4/Data")
raw_d <- read.csv(file="./dataset/hypothesis/htest02.csv", header = TRUE)
head(raw_d)

1.3.2.그룹 나누기
groupAd <- raw_d[,1]
groupBd <- raw_d[,2]

1.3.3.그룹 별 평균
mean(groupAd)

mean(groupBd)

1.3.4.정규성 검정
d = groupAd - groupBd
d

shapiro.test(d)

qqnorm(d)
qqline(d)

1.3.5.대응표본 t-검정
t.test(groupAd, groupBd, alternative="less", paired=TRUE)

1.4.각 집단 표본 수 = 30
1.4.1.z.test 함수
z.test <- function(x1, x2){
  n_x1 = length(x1)
  n_x2 = length(x2)
  mean_x1 = mean(x1)
  mean_x2 = mean(x2)
  cat("\n")
  cat("\tTwo Sample z-test\n")
  cat("\n")
  cat("mean of x1:", mean_x1, "\n")
  cat("mean of x2:", mean_x2, "\n")
  var_x1 = var(x1)
  var_x2 = var(x2)
  z = (mean_x1 - mean_x2)/sqrt((var_x1/n_x1)+(var_x2/n_x2))
  abs_z = abs(z)
  cat("z =", abs_z, "\n")
  p_value = 1-pnorm(abs_z)
  cat("p-value =", p_value)
}


1.4.2.데이터 불러오기
setwd("C:/RProject/Rproject/Part 4/Data")
rawN10 <- read.csv(file="./dataset/hypothesis/htest02.csv", header = TRUE)
head(rawN30)

1.4.3.그룹 이름 확인
unique(rawN30$group)

1.4.4.그룹 별 데이터 나누기
groupA3 <- rawN30[rawN30$group=='A',1:2]
groupB3 <- rawN30[rawN30$group=='B',1:2]

1.4.5.그룹 별 평균
mean(groupA3[,2])S
mean(groupB3[,2])

1.4.6.분산 동질성 검정
var.test(groupA3[,2], groupB3[,2])

1.4.7.t-검정
t.test(groupA3[,2], groupB3[,2], var.equal = TRUE, alternative="less", conf.level=0.95)

1.4.8.z-검정
z.test(groupA3[,2], groupB3[,2])

1.5.여러집단 평균 차이 검정
1.5.1.lawstat 패키지 설치
#install.packages("lawstat")
library(lawstat)

1.5.2.데이터 불러오기
setwd("C:/RProject/Rproject/Part 4/Data")
raw_anova <- read.csv(file="./dataset/hypothesis/htest02.csv", header = TRUE)
head(raw_anova)

1.5.3.그룹 이름 확인
unique(raw_anova$group)

1.5.4.그룹 별 데이터 나누기
groupA4 <- raw_anova[raw_anova$group=='A',1:2]
groupB4 <- raw_anova[raw_anova$group=='B',1:2]
groupC4 <- raw_anova[raw_anova$group=='C',1:2]


1.5.5.그룹 별 평균 구하기
mean(groupA4[,2])
mean(groupB4[,2])
mean(groupC4[,2])

1.5.6.정규성 검정
shapiro.test(groupA4[,2])

qqnorm(groupA4[,2])
qqline(groupA4[,2])
shapiro.test(groupB4[,2])
qqnorm(groupB4[,2])
qqline(groupB4[,2])
shapiro.test(groupC4[,2])
qqnorm(groupC4[,2])
qqline(groupC4[,2])

1.5.7.등분산성 검정
levene.test(raw_anova$height, raw_anova$group)





