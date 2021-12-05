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