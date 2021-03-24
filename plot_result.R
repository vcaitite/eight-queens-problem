#install.packages("imager")
library(imager)

plot_result <- function(queens_position){
  n = 15
  image <- load.image(file.choose())
  plot(image)
  #coordenadas
  x = 2*c(18,53,88,122,158,192,227,262)
  for (i in 1:n) {
    print(queens_position[i])
    text(x[i],x[queens_position[i]],"Q",cex=2,col = "yellow")
  }
}

