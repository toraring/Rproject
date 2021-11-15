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