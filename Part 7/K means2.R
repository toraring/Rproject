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

