#[그래프 그리기]
#> 산점도 만들기

#- 산점도(Scater Plot) : 데이터를 x축과 y축에 점으로 표현한 그래프
#- 나이와 소득처럼, 연속 값으로 된 두 변수의 관계를 표현할 때 사용
#ggplot2 로드
library(ggplot2)

1. 배경 설정하기
# x 축 displ, y 축 hwy 로 지정해 배경 생성
ggplot(data = mpg, aes(x = displ, y = hwy))

2. 그래프 추가하기
# 배경에 산점도 추가
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()

3. 축 범위를 조정하는 설정 추가하기
# x 축 범위 3~6 으로 지정
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + xlim(3, 6)

3. 축 범위를 조정하는 설정 추가하기
# x 축 범위 3~6, y 축 범위 10~30 으로 지정
ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  xlim(3, 6) +
  ylim(10, 30)

#ggplot
ggplot2 코드 가독성 높이기
• 한 줄로 작성
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + xlim(3, 6) + ylim(10, 30)

• + 뒤에서 줄 바꾸기
ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  xlim(3, 6) +
  ylim(10, 30)

#ggplot() vs qplot()
#• qplot() : 전처리 단계 데이터 확인용 문법 간단, 기능 단순
#• ggplot() : 최종 보고용. 색, 크기, 폰트 등 세부 조작 가능


#[## 막대 그래프 - 집단 간 차이 표현하기]
#- 막대 그래프(Bar Chart) : 데이터의 크기를 막대의 길이로 표현한 그래프
#- 성별 소득 차이처럼 집단 간 차이를 표현할 때 주로 사용
1. 집단별 평균표 만들기
library(dplyr)

df_mpg <- mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy))

df_mpg