#dplyr 패키지 로드 & 데이터 준비
library(dplyr)
exam <- read.csv("csv_exam.csv")
exam

# exam 에서 class 가 1 인 경우만 추출하여 출력
exam %>% filter(class == 1)

# 2반인 경우만 추출 
exam %>% filter(class == 2)

# 1반이 아닌 경우 
exam %>% filter(class != 1)

# 3 반이 아닌 경우
exam %>% filter(class != 3)

# 수학 점수가 50점을 초과한 경우 
exam %>% filter(math > 50)

# 수학 점수가 50 점 미만인 경우
exam %>% filter(math < 50)

# 영어점수가 80점 이상인 경우 
ㅁexam %>% filter(english >= 80)

# 영어점수가 80 점 이하인 경우
exam %>% filter(english <= 80)

#여러 조건을 충족하는 행 추출하기
# 1 반 이면서 수학 점수가 50 점 이상인 경우
exam %>% filter(class == 1 & math >= 50)

# 2반 이면서 영어점수가 80점 이상인 경우 
exam %>% filter(class == 2 & english >= 80)

# 수학 점수가 90 점 이상이거나 영어점수가 90 점 이상인 경우
exam %>% filter(math >= 90 | english >= 90)

# 영어점수가 90점 미만이거나 과학점수가 50점 미만인 경우
exam %>% filter(english < 90 | science < 50)

exam %>% filter(class == 1 | class == 3 | class == 5) 
# 1, 3, 5 반에 해당되면 추출

#%in% 기호 이용하기 
exam %>% filter(class %in% c(1,3,5)) 

class1 <- exam %>% filter(class == 1) # class 가 1 인 행 추출, class1 에 할당
class2 <- exam %>% filter(class == 2) # class 가 2 인 행 추출, class2 에 할당

mean(class1$math) # 1 반 수학 점수 평균 구하기
## [1] 46.25

mean(class2$math) # 2 반 수학 점수 평균 구하기
## [1] 61.25
# 1, 3, 5 반에 해당하면 추출

#추출한 행으로 데이터 만들기
class1 <- exam %>% filter(class == 1) # class 가 1 인 행 추출, class1 에 할당
class2 <- exam %>% filter(class == 2) # class 가 2 인 행 추출, class2 에 할당

mean(class1$math) # 1 반 수학 점수 평균 구하기
## [1] 46.25

mean(class2$math) # 2 반 수학 점수 평균 구하기
## [1] 61.25

exam %>% select(math) # math 추출
exam %>% select(english) # english 추출

#여러 변수 추출하기 
exam %>% select(class, math, english) # class, math, english 변수 추출

# class가 1인 행만 추출한 다음 english 추출 
exam %>% filter(class == 1) %>% select(english)

#가독성 있게 줄 바꾸기
exam %>%
  filter(class == 1) %>% # class 가 1 인 행 추출
  select(english) # english 추출

#여러 변수 추출하기 
exam %>% select(class, math, english) # class, math, english 변수 추출

#변수 제외하기 
exam %>% select(-math) # math 제외
exam %>% select(-math, -english) # math, english 제외

# class가 1인 행만 추출한 다음 english 추출 
exam %>% filter(class == 1) %>% select(english)

#가독성 있게 줄 바꾸기
exam %>%
  filter(class == 1) %>% # class 가 1 인 행 추출
  select(english) # english 추출

#일부만 출력하기 
exam %>% 
  select(id, math) %>% # id, math 추출 
  head # 앞부분 6행까지 추출