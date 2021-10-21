#데이터 파악하기, 다루기 쉽게 수정하기
#데이터 준비
exam <- read.csv("csv_exam.csv")
head(exam) # 앞에서부터 6 행까지 출력
head(exam, 10) # 앞에서부터 10 행까지 출력
tail(exam) # 뒤에서부터 6 행까지 출력
tail(exam, 10) # 뒤에서부터 10 행까지 출력

View() #뷰어 창에서 데이터 확인하기
View(exam)
#[유의] View()에서 맨 앞의 V는 대문자