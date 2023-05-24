set.seed(4762)

lambda <- 24
k <- 1358
amostra <- rexp(k, rate = 1/lambda)

soma_sucessiva <- cumsum(amostra)

T <- ceiling(soma_sucessiva[k])

subintervalos <- seq(0, T, by = 1)

num_acontecimentos <- tabulate(findInterval(soma_sucessiva, subintervalos))

media <- mean(num_acontecimentos)

valor_esperado <- k * (1/T)

desvio_absoluto <- abs(media - valor_esperado)

desvio_absoluto_arredondado <- round(desvio_absoluto, 4)

desvio_absoluto_arredondado