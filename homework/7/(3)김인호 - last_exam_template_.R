# 교안의 방법이 아니더라도 본인의 방법으로 정답을 기입하셔도 문제 방향과 일치하는 풀이이면 정답처리가 될 예정이니 구글링을 활용하셔도 괜찮습니다.
# 다만 교안을 바탕으로 출제되었기 때문에 복습하시다보면 답안 기입에 도움이 되실 것 같습니다.

# 문제 풀이에 필요한 함수가 있는 패키지를 전부 불러옵니다. 아래 코드를 실행해주세요
library(ggplot2)
library(dplyr)
library(caret)
set.seed(1004)

# 모든 데이터는 배포된 dataset에 포함되어 있습니다.
# 문제에 적절한 코드를 작성해주시면 됩니다.
# 1~2번 문제는 bank1, 2데이터를 이용하여 푸는 문제입니다.자세한 설명은 문제 pdf파일을 참고하세요.

# 아래 코드를 실행하여 데이터를 불러오세요. 경로는 적절하게 설정하세요
bank1 <- read.table("C:/RProject/Rproject/homework/7/bank1.csv", sep = ";", header = TRUE)
bank2 <- read.table("C:/RProject/Rproject/homework/7/bank2.csv", sep = ";", header = TRUE)
bank <- merge(bank1, bank2, by = "ID")


# (5점) 1-(1). 새로운 데이터는 여러가지를 검토하면서 데이터를 파악해야 합니다. 데이터를 검토하는 함수를 2개 이상 작성하세요.

str(bank)
dim(bank)
head(bank)
summary(bank)
View(bank)

# (5점) 1-(2). 데이터에 결측치가 있는지 확인하는 코드를 작성하세요. (참고로 결측치는 없습니다.)
sum(is.na(bank))

# (5점) 1-(3). 20세부터 59세까지의 고객만 고려하려고 합니다. age변수가 20세 이상 60세 미만인 데이터만 추출하세요. 
# Hint. 앞으로의 분석에서 20세~59세 까지의 고객만 고려할 것이므로, 추출하고 데이터에 저장까지 해주셔야합니다.
bank_age <- bank %>% filter(age >= 20 & age < 60)
View(bank_age)

# (5점) 1-(4). 직업 종류(job)에 따른 연평균 잔액(balance)의 평균을 구하고 내림차순으로 정렬하세요.
bank_balance <- bank %>% group_by(job) %>% 
  summarise(job_bal = mean(balance)) %>% 
  arrange(desc(job_bal))
View(bank_balance)

#? (5점) 1-(5) 교육수준(education)에 따른 정기예금 가입(y) 비율을 sum_by_edu라는 데이터에 저장하세요.
# Hint. 1과 0으로 이루어진 변수는 mean을 이용하면 비율을 구할 수 있습니다.
y <- ifelse(bank$y == "yes", 1, 0) 
unique(y)
prop.table(table(y))
sum_by_edu <- bank %>% group_by(education) %>% 
  summarise(prop.table(table(y)))

View(sum_by_edu)
#yes를 1, no를 0으로 하고 평균까지 구했는데, 이를 교육별로 결과도출하는 것을 잘 모르겠습니다다..

# ? (5점) 1-(6) 위 문제에서 만든 sum_by_edu 데이터를 이용하여 교육수준에 따른 정기예금 가입 비율을 막대그래프로 표현하세요.
barplot(table(sum_by_edu))


# (7)~(8) 나이와 평균 연평균 잔액의 관계를 살펴보고 싶습니다.
# (5점) 1-(7)먼저 나이(age)별로 연평균 잔액(balance)의 평균을 구하고 이를 age_bl라는 데이터에 저장하세요.
age_bl <- bank %>% group_by(age) %>% 
  summarise(age_bal = mean(balance))

View(age_bl)

# (5점) 1-(8) age_bl데이터를 이용하여 나이와 평균 연평균 잔액의 산점도를 그리세요.
plot(age_bl)


# (5점) 2-(1). 나이를 범주화 하여 age_group 변수로 지정해주세요.
# 이 때, 범주는 20대, 30대, 40대, 50대로 나누어주시기 바랍니다. 

age_group <- age_bl %>%
  mutate(ageg = ifelse(age >=20 & age < 30, "20대",
                       ifelse(age >=30 & age < 40, "30대",
                              ifelse(age >=40 & age < 50, "40대","50대"))))

View(age_group)

# (5점) 2-(2) 연령 그룹에 따라 연평균 잔액의 평균이 다른지 알고 싶습니다. 알맞은 가설을 세워주세요.
# 귀무가설 : 연령 그룹에 따라 연평균 잔액의 평균이 다르다
# 대립가설 : 연령 그룹에 따라 연평균 잔액의 평균이 같다
  
# (10점) 2-(3) (2)에서 세운 가설에 맞게 가설검정을 진행하세요. 관련 코드와 통계량에 따른 결론을 모두 작성해주셔야 합니다.
# 단, 정규성과 등분산성을 모두 만족한다고 가정합니다.
t.test(age_group[,2], alternative= 'two.sided',var.equal = TRUE)

  
# 결론을 아래에 작성하세요. 
0.05보다 작으므로 귀무가설 기각된다. 
따라서 연령 그룹에 따라 연평균 잔액의 평균이 같다
  
  
# 3~5번 문제는 HR_new 데이터를 이용하여 풀어주세요.
# 데이터에 대한 설명은 문제 pdf를 참고해주세요.
# 아래 코드를 실행해주세요 (경로는 각자 환경에 맞게 지정하세요.)
hr <- read.csv("C:/RProject/Rproject/homework/7/HR_new.csv", na.string = c("", " "))
hr$left <- as.factor(hr$left)
hr$salary <- NULL ## salary 변수 제거

View(hr)

# (5점) 3. 결측치가 last_evaluation, time_spend_company에 있다고 할 때, 이들 두 변수에 있는 결측치를 제거하는 코드를 작성해주세요. (현재 샘플링으로 인해 없어진 상태이지만 있다고 했을 때에 사용하는 코드를 작성해주시면 됩니다.)
sum(is.na(hr$last_evaluation))
sum(is.na(hr$time_spend_company))

hr_R1 <- na.omit(hr$last_evaluation)
hr_R2 <- na.omit(hr$time_spend_company)
str(hr_R1)
str(hr_R2)

# hr 데이터는 left를 제외하고 모두 연속형 변수로 이루어져 있습니다. 
# (10점) 4. 연속형 변수들을 이용하여 차원축소를 진행하려고 합니다. 차원 축소 후, 각 주성분이 분산의 몇%를 설명하는지 까지 확인하는 코드도 작성하세요. 
hr1 <- hr[,1:8]
hr1.pca <- prcomp(hr1[2:ncol(hr1)], center = T, scale. = T)
str(hr1)
pca_num <- prcomp(hr1)
summary(pca_num)
따라서 축1개 일 때는 99%을 설명하고 
나머지 축이 2,3,4,5,6,7,8개 일 때는 100%를 설명한다


# hr 데이터의 종속변수는 left로, 직장을 떠나는지의 여부입니다. 
# (15점) 5. 분류에 해당하는 많은 알고리즘을 배웠습니다. 본인이 사용하고 싶은 알고리즘을 이용하여 분석을 진행하세요.
# 결과 해석(test 데이터를 이용한 예측) 까지 진행하시기 바랍니다.
# Hint. 데이터 분할 / 데이터 분석 / 결과 예측 순서대로 진행하시기 바랍니다. 
library(caret)
customGrid <- expand.grid(k = 1:5)
nb_fit <- train(left ~ .,
                data = hr,
                method = "naive_bayes",
                trControl = ctrl,
                metric = "Accuracy")
nb_fit
summary(hr$left)
usekernel가 true일때 Accuracy는 약 79%이고 kappa는 0.272099261이다. 
따라서 회사를 떠날 가능성이 높다

# 6~7 번은 Adsp 강의와 관련된 내용입니다.
# 설명에 맞는 단어를 작성해주세요

# (5점) 6. 아래에서 설명하고 있는 빅데이터 활용 기본 테크닉은 무엇인가요?
# - 자연세계의 진화과정에 기초한 계산 모델로서 최적화 문제를 해결하는 기법의 하나이다. 생물의 진화를 모방한 진화 연산의 대표적인 기법으로, 실제 진화의 과정에서 많은 부분을 차용하였다.
# - 어떤 미지의 함수 Y = f(x)를 최적화하는 해 x를 찾기 위해 진화를 모방한 탐색 알고리즘이라고 말할 수 있다.
정답 : 유전 알고리즘
  
# (5점) 7. KDD 분석 방법론에서 분석 목적에 맞게 변수를 생성, 선택하는 등 데이터마이닝을 할 수 있도록 데이터를 변경하는 단계와 유사한 CRISP-DM 분석 방법론의 단계는 무엇인가요?
정답 : 데이터 준비
  

  
