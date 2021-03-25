#install.packages("imager")
library(imager)

plot_result <- function(queens_position, n){
  if (n == 8) {
    image <- load.image(file.choose())
    plot(image)
    #coordenadas
    x = 2*c(18,53,88,122,158,192,227,262)
    for (i in 1:n) {
      print(queens_position[i])
      text(x[i],x[queens_position[i]],"Q",cex=2,col = "yellow")
    }
  }
  else {
    print("**************************************************************************")
    print("Configuração de tabuleiro encontrada:")
    #inicializa um vetor com n^2 posicoes preenchido com zeros
    position_vector = rep.int(0,n**2)
    #variavel auxiliar
    position = 1
    #transforma a queens_position em vetor com 64 posicoes
    for (i in 1:n) {
      position_vector[ position + queens_position[i] -1] = 1
      position = position + n
    }
    #tranforma o vetor em uma matriz n x n 
    table = matrix(position_vector, nrow=n, ncol=n, byrow = FALSE)
    print(table)
  }
}
