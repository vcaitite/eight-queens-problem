#install.packages("GA")
library(GA)

# algoritmo genetico
result <- ga(type="permutation", fitness=eight_queens_fitness, lower=c(1,1,1,1,1,1,1,1), upper=c(8,8,8,8,8,8,8,8), popSize = 10, maxiter = 1000)

# solucao
summary(result)$solution

# plot da evolucao
plot(result)

# Resultado graficamente
plot_result(summary(result)$solution[1,])

