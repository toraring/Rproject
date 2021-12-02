#[데이터 가공하기2]
exam %>% arrange(math) # math 오름차순 정렬
exam %>% arrange(desc(math)) # math 내림차순 정렬

#정렬 기준 변수 여러개 지정
exam %>% arrange(class, math) # class 및 math 오름차순 정렬

#파생변수
exam %>% 
  mutate(total = math + english + science) %>% # 총합 변수 추가 
  head # 일부 추출