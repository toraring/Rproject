대학원 입시 데이터를 활용한 합격률 예측

### 파일 불러오기 
rawdata1 <- read.csv("C:/RProject/Rproject/Part 8/3/university.csv", head=TRUE)

### 데이터 형태 확인
str(rawdata1)

# 결측치 확인
is.na(rawdata1$GRE.Score) 


