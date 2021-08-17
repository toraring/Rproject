#[연료와 가격의 관계]
#데이터프레임
fuel <- data.frame(fl = c("c", "d", "e", "p", "r"),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors = F)
fuel # 출력
#Q1. mpg 데이터에는 연료 종류를 나타낸 fl 변수는 있지만 연료 가격을 나타낸 변수는 없습니다. 위에서 만든 fuel 데이터를 이용해서 mpg 데이터에 price_fl(연료 가격) 변수를 추가하세요.
mpg <- as.data.frame(ggplot2::mpg) # mpg 데이터 불러오기
mpg <- left_join(mpg, fuel, by = "fl") # mpg 에 연료 가격 변수 추가