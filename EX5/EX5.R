set.seed(1056)

simulate_geometric <- function(p, n) {
  u <- runif(n)
  x <- floor(log(u) / log(1 - p))
  return(x)
}

p <- 0.2 
n <- 1171

X <- simulate_geometric(p, n)

sample_mean <- mean(X)
sample_sd <- sd(X)

count <- sum(X > (sample_mean + sample_sd))

proportion <- count / n

proportion_round <- round(proportion, 4)

proportion_round