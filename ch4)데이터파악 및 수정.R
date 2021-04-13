#데이터준비
exam <- read.csv("csv_exam.csv")

#데이터 앞부분 확인
head(exam)
#앞에서 10행까지
head(exam,10)

#데이터 뒷부분 확인
tail(exam)
#뒤에서 10행까지
tail(exam,10)

#뷰어창에서 데이터 확인
View(exam)#대문자로 꼭하기

#행렬 갯수 확인
dim(exam)

#속성 파악
str(exam)

#요약통계량 산출
summary(exam)

#mpg데이터 파악하기
  #데이터 프레임으로 변환요청함. 
  #더블클론::은 특정폴더명을 선택할때
mpg <- as.data.frame(ggplot2::mpg)
mpg 

head(mpg)#앞부분 데이터확인
tail(mpg)#뒷부분 데이터확인
View(mpg)#view형태로
dim(mpg)#행렬 갯수확인
str(mpg)#속성확인인

#####
#dplyr 패키지 설치 & 로드
install.packages("dplyr")
library(dplyr)

#데이터 프레임 생성
df_raw <- data.frame(var1 = c(1,2,1), var2 = c(2,3,2))
df_raw

#데이터 복사본
  #중간에 수정하기 위함함
  #원본은 raw 복사본은 new로 
df_new <- df_raw
df_new

#변수명 바꾸기
  #var2를 v2로 수정
  #rename()은 새변수명 = 기존변수명 순으로 적을 것
df_new <- rename(df_new, v2 = var2)
df_new



##실습
#ggplot2 패키지의 mpg데이터를 사용할 수 있도록 불러와서 복사본 만들기
mpg <- as.data.frame(ggplot2::mpg)
mpg_new <- mpg
mpg_new

#복사본 데이터 이용하여 cty는 city로, hwy는 highway로 변수명 수정
library(dplyr)
mpg_new <- rename(mpg_new, city = cty, highway = hwy)

#수정된 것 출력
head(mpg_new)
