1. 데이터 확인
library(jpeg)
cat <- readJPEG('cat.jpeg')
class(cat)

dim(cat)

2. rgb 데이터 분할 및 주성분 분석
r <- cat[,,1] # array에서 r에 해당하는 데이터
g <- cat[,,2] # array에서 g에 해당하는 데이터
b <- cat[,,3] # array에서 b에 해당하는 데이터
cat.r.pca <- prcomp(r, center = F) # r 데이터 주성분분석
cat.g.pca <- prcomp(g, center = F) # g 데이터 주성분분석
cat.b.pca <- prcomp(b, center = F) # b 데이터 주성분분석

rgb.pca <- list(cat.r.pca, cat.g.pca, cat.b.pca) # 분석 결과 rgb로 합침

3. 차원축소하여 jpg로 저장
pc <- c(2,10,50,100,300) # 축소할 차원 수
for (i in pc) {
  pca.img <- sapply(rgb.pca, function(j) {
    compressed.img <- j$x[,1:i] %*% t(j$rotation[,1:i])
  }, simplify = 'array')
  writeJPEG(pca.img, paste('cat_pca_', i, '.jpeg', sep = ''))
}