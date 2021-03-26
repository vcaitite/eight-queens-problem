#install.packages("GA")
library(GA)
library(tictoc)

# algoritmo genetico
n = 15
lw <- seq(1,1, length.out=n)
up <- seq(n,n, length.out=n)
tic("Runtime:")
result <- ga(type="permutation", fitness=eight_queens_fitness, lower=lw, upper=up, maxFitness=0, monitor=FALSE, popSize = 20, maxiter = 10000)
toc()
# solucao
summary(result)$solution

# Descomentar para modo grafico
# plot da evolucao
#plot(result)
# Resultado graficamente
#plot_result(summary(result)$solution[1,], n)

