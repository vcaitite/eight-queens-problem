#install.packages("GA")
library(GA)

# algoritmo genetico
n = 15
lw <- seq(1,1, length.out=n)
up <- seq(n,n, length.out=n)
result <- ga(type="permutation", fitness=eight_queens_fitness, lower=lw, upper=up, popSize = 20, maxiter = 10000)

# solucao
summary(result)$solution

# plot da evolucao
plot(result)

# Resultado graficamente
plot_result(summary(result)$solution[1,])

