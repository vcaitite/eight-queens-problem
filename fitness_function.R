eight_queens_fitness <- function(solution)
{
  #teste
  #solution = c(1,5,8,4,2,6,7,3)
  
  n = 15
  
  #inicializa um vetor com n^2 posicoes preenchido com zeros
  position_vector = rep.int(0,n**2)
  
  #variavel auxiliar
  position = 1
  
  #transforma a solution em vetor com 64 posicoes
  for (i in 1:n) {
    position_vector[ position + solution[i] -1] = 1;
    position = position + n
  }
  
  #tranforma o vetor em uma matriz n x n 
  queens = matrix(position_vector, nrow=n, ncol=n, byrow = FALSE)
  
  #variavel para contar os ataques
  total = 0 
  
  #verifica linhas e colunas
  for (i in 1:n) {
    #verifica colunas
    total = total + ifelse(sum(queens[,i])>1,1,0)
    #verifica linhas
    total = total + ifelse(sum(queens[i,])>1,1,0)
  }
  
  #faz a transposicao das diagonais
  tmp <- row(queens) - col(queens)
  z = split(queens,tmp)
  
  #inverte a matriz para ler as outras diagonais
  queens2 = queens[,n:1]
  tmp <- row(queens2) - col(queens2)
  y = split(queens2,tmp)

  i = 1
  for (v in z) {
    #verifica diagonais
    total = total + ifelse(sum( z[[i]])>1,1,0)
    #verifica diagonais inversa
    total = total + ifelse(sum( y[[i]])>1,1,0)
    i = i + 1
  }
  return(-total)
  
}










