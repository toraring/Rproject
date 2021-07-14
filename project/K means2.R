k means2

imgdim <- as.vector(dim(img))
imgRGB <- data.frame(
  x = rep(1:imgdim[2], each = imgdim[1]),
  y = rep(imgdim[1]:1, imgdim[2]),
  R = as.vector(img[,,1]),
  G = as.vector(img[,,2]),
  B = as.vector(img[,,3])
)
head(imgRGB)

tail(imgRGB)

kClusters <- c(3, 5, 10, 15, 30, 50) # 축소할 색상 클러스터 개수
set.seed(1234)
for (i in kClusters) {
  img.kmeans <- kmeans(imgRGB[, c("R", "G", "B")], centers = i)
  img.result <- img.kmeans$centers[img.kmeans$cluster,]
  img.array <- array(img.result, dim = imgdim)
  writeJPEG(img.array, paste('kmeans_', i, 'clusters.jpeg', sep = ''))
}
