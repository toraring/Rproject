a <- 1
head(mpg)
9

#변수지정
b <- c("a","a","b","c")

#패키지 불러오기
library(ggplot2)

#그래프 각각생성
qplot(b)

qplot(data = mpg, x = hwy)

qplot(data = mpg, x = cty)

qplot(data = mpg, x = drv, y = hwy, geom = "point")

qplot(data = mpg, x = drv, y = hwy, geom = "boxplot")

qplot(data = mpg, x = drv, y = hwy, geom = "boxplot", colour = drv)

#qplot 구동방법 알아보기
?qplot

qplot(mpg, wt, data = mtcars)
qplot(mpg, wt, data = mtcars, colour = cyl)
qplot(mpg, wt, data = mtcars, size = cyl)
qplot(mpg, wt, data = mtcars, facets = vs ~ am)

#구글에 ggplot2 cheatsheet보기 