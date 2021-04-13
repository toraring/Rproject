#데이터는 행이 많을수록 고급분석기술이 필요하다. 
#열이 많으면 고급 컴퓨터사양이 필요하다

#데이터프레임 만들기
  #역사점수 생성
history <- c(90,80,60,70)
  #수학점수 생성
math <- c(50,60,100,20)

#변수합해서 데이터프레임 만들기
df_midterm <- data.frame(history, math)
df_midterm

#반 추가하기
class <- c(1,1,2,2)
df_midterm <- data.frame(history, math, class)
df_midterm

#평균치 구해보기
mean(df_midterm$history)
mean(df_midterm$math)
