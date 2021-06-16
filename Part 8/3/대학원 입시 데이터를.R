대학원 입시 데이터를 활용한 합격률 예측
[데이터 살펴보기]

### 파일 불러오기 
rawdata1 <- read.csv("C:/RProject/Rproject/Part 8/3/university.csv", head=TRUE)

### 데이터 형태 확인
str(rawdata1)

# 결측치 확인
is.na(rawdata1$GRE.Score) 

sum(is.na(rawdata1$GRE.Score)) 

sum(is.na(rawdata1$GRE.Score)) 
sum(is.na(rawdata1$TOEFL.Score)) 
sum(is.na(rawdata1$University.Rating)) 
sum(is.na(rawdata1$SOP)) 
sum(is.na(rawdata1$LOR)) 
sum(is.na(rawdata1$Research)) 
sum(is.na(rawdata1$Chance.of.Admit)) 

#변수 별 유니크값 확인
unique(rawdata1$GRE.Score)
unique(rawdata1$TOEFL.Score)
unique(rawdata1$University.Rating)
u_rating_table <- table(rawdata1$University.Rating)
unique(rawdata1$SOP)
unique(rawdata1$LOR)


