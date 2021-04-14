library(dplyr)
mpg <- as.data.frame(ggplot2::mpg)
library(ggplot2)
mpg
mpg_a <-mpg %>% filter(displ <= 4)
mpg_b <-mpg %>% filter(displ >= 5)
mean(mpg_a$hwy)
mean(mpg_b$hwy)
View(mpg)
##
mpg_c <-mpg %>% filter(manufacturer == "audi")
mpg_d <-mpg %>% filter(manufacturer == "toyota")
mean(mpg_c$cty)
mean(mpg_d$cty)
##
    #mpg_1 <-mpg %>% filter(manufacturer == "chevrolet")
    #mpg_2 <-mpg %>% filter(manufacturer == "ford")
    #mpg_3 <-mpg %>% filter(manufacturer == "honda")
    #mean(mpg_1$hwy + mpg_2$hwy + mpg_3$hwy)

mpg_new <- mpg %>% filter(manufacturer %in% c("chevrolet", "ford", "honda"))
mean(mpg_new$hwy)
