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