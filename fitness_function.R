eight_queens_fitness <- function(solution)
{
  #teste
  #solution = c(1,5,8,4,2,6,7,3)
  
  
  #inicializa um vetor com 64 posicoes preenchido com zeros
  position_vector = rep.int(0,64)
  
  #variavel auxiliar
  position = 1
  
  #transforma a solution em vetor com 64 posicoes
  for (i in 1:8) {
    position_vector[ position + solution[i] -1] = 1;
    position = position + 8
  }
  
  #tranforma o vetor em uma matriz 8 x 8 
  queens = matrix(position_vector, nrow=8, ncol=8, byrow = FALSE)
  
  #variavel para contar os ataques
  total = 0 
  
  #verifica linhas e colunas
  for (i in 1:8) {
    #verifica colunas
    total = total + ifelse(sum(queens[,i])>1,1,0)
    #verifica linhas
    total = total + ifelse(sum(queens[i,])>1,1,0)
  }
  
  #faz a transposicao das diagonais
  tmp <- row(queens) - col(queens)
  z = split(queens,tmp)
  
  #inverte a matriz para ler as outras diagonais
  queens2 = queens[,8:1]
  tmp <- row(queens2) - col(queens2)
  y = split(queens2,tmp)

  for (i in 1:15) {
    #verifica diagonais
    total = total + ifelse(sum( z[[i]])>1,1,0)
    #verifica diagonais inversa
    total = total + ifelse(sum( y[[i]])>1,1,0)
  }
  return(-total)
  
}










