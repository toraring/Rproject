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
