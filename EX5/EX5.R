set.seed(1056)

p <- 0.2

n <- 1171

F_X <- function(x) {
  if (x < 0) {
    return(0)
  } else {
    return((1 - p)^x * p)
  }
}

simulacao <- numeric(n)
media_amostral <- numeric(n)
desvio_padrao_amostral <- numeric(n)
proporcao <- 0

for (i in 1:n) {
  u <- runif(1)
  x <- 0
  
  while (F_X(x) < u) {
    x <- x + 1
  }
  
  simulacao[i] <- x
  
  media_amostral[i] <- mean(simulacao[1:i])
  desvio_padrao_amostral[i] <- sd(simulacao[1:i])
  
  if (simulacao[i] > media_amostral[i] + desvio_padrao_amostral[i]) {
    proporcao <- proporcao + 1
  }
}

proporcao <- proporcao / n

proporcao <- round(proporcao, 4)

proporcao