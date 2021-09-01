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