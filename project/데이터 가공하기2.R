#[데이터 가공하기2]
exam %>% arrange(math) # math 오름차순 정렬
exam %>% arrange(desc(math)) # math 내림차순 정렬

#정렬 기준 변수 여러개 지정
exam %>% arrange(class, math) # class 및 math 오름차순 정렬

#파생변수
exam %>% 
  mutate(total = math + english + science) %>% # 총합 변수 추가 
  head # 일부 추출

#여러 파생변수 한 번에 추가하기 
exam %>% 
  mutate(total = math + english + science, # 총합 변수 추가 
         mean = (math + english + science)/3) %>% # 총평균 변수 추가 
  head # 일부 추출

#mutate()에 ifelse() 적용하기
exam %>%
  mutate(test = ifelse(science >= 60, "pass", "fail")) %>%
  head

#추가한 변수를 dplyr 코드에 바로 활용하기
exam %>%
  mutate(total = math + english + science) %>% # 총합 변수 추가
  arrange(total) %>% # 총합 변수 기준 정렬
  head # 일부 추출

#mutate()에 ifelse() 적용하기
exam %>%
  mutate(test = ifelse(science >= 60, "pass", "fail")) %>%
  head

#요약하기
exam %>% 
  summarise(mean_math = mean(math)) # math 평균 산출
## mean_math
## 1 57.45

#집단별로 요약하기
exam %>%
  group_by(class) %>% # class 별로 분리
  summarise(mean_math = mean(math)) # math 평균 산출

#여러 요약통계량 한 번에 산출하기
exam %>%
  group_by(class) %>% # class 별로 분리
  summarise(mean_math = mean(math), # math 평균
            sum_math = sum(math), # math 합계
            median_math = median(math), # math 중앙값
            n = n()) # 학생 수

#각 집단별로 다시 집단 나누기 
mpg %>%
  group_by(manufacturer, drv) %>% # 회사별, 구방방식별 분리
  summarise(mean_cty = mean(cty)) %>% # cty 평균 산출
  head(10) # 일부 출력

#데이터 생성
# 중간고사 데이터 생성
test1 <- data.frame(id = c(1, 2, 3, 4, 5),
                    midterm = c(60, 80, 70, 90, 85))

# 기말고사 데이터 생성
test2 <- data.frame(id = c(1, 2, 3, 4, 5),
                    final = c(70, 83, 65, 95, 80))

test1 # test1 출력
test2 # test2 출력

#id 기준으로 합치기
total <- left_join(test1, test2, by = "id") # id 기준으로 합쳐 total 에 할당
total # total 출력

#반별 담임교사 명단 생성
name <- data.frame(class = c(1, 2, 3, 4, 5),
                   teacher = c("kim", "lee", "park", "choi", "jung"))
name

#class 기준 합치기
exam_new <- left_join(exam, name, by = "class")
exam_new

#데이터 생성
# 학생 1~5 번 시험 데이터 생성
group_a <- data.frame(id = c(1, 2, 3, 4, 5),
                      test = c(60, 80, 70, 90, 85))

# 학생 6~10 번 시험 데이터 생성
group_b <- data.frame(id = c(6, 7, 8, 9, 10),
                      test = c(70, 83, 65, 95, 80))

group_a # group_a 출력
group_b # group_b 출력

#세로로 합치기
group_all <- bind_rows(group_a, group_b) # 데이터 합쳐서 group_all 에 할당
group_all # group_all 출력