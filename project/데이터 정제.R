#[데이터 정제]
#결측치(Missing Value)
#• 누락된 값, 비어있는 값
#• 함수 적용 불가, 분석 결과 왜곡
#• 제거 후 분석 실시
결측치 만들기
• 결측치 표기 - 대문자 NA

df <- data.frame(sex = c("M", "F", NA, "M", "F"),
                 score = c(5, 4, 3, 4, NA))
df