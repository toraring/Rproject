#[미국 인구 통계]
#문제1. popadults는 해당 지역의 성인 인구, poptotal은 전체 인구를 나타냅니다. midwest 데이터에 '전체 인구 대비 미성년 인구 백분율' 변수를 추가하세요.
# midwest 불러오기
midwest <- as.data.frame(ggplot2::midwest)

# midwest 에 백분율 변수 추가
midwest <- midwest %>%
  mutate(ratio_child = (poptotal-popadults)/poptotal*100)

#문제2. 미성년 인구 백분율이 가장 높은 상위 5개 county(지역)의 미성년 인구 백분율을 출력하세요.
midwest %>%
  arrange(desc(ratio_child)) %>% # ratio_child 내림차순 정렬
  select(county, ratio_child) %>% # county, ratio_child 추출
  head(5) # 상위 5 행 출력

#문제3. 분류표의 기준에 따라 미성년 비율 등급 변수를 추가하고, 각 등급에 몇 개의 지역이 있는지 알아보세요.
# midwest 에 grade 변수 추가
midwest <- midwest %>%
  mutate(grade = ifelse(ratio_child >= 40, "large",
                        ifelse(ratio_child >= 30, "middle", "small")))

# 미성년 비율 등급 빈도표
table(midwest$grade)
## large middle small
## 32 396 9