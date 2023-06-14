set.seed(189)

m <- 250
n <- 46 
mu_h0 <- 50.5
mu <- 51.8
sigma <- 2 

perform_hypothesis_test <- function(sample) {
  t_stat <- (mean(sample) - mu_h0) / (sigma / sqrt(n))
  p_value <- 2 * (1 - pt(abs(t_stat), df = n - 1))
  return(p_value)
}

samples <- replicate(m, rnorm(n, mean = mu, sd = sigma))

p_values <- apply(samples, 2, perform_hypothesis_test)

non_rejection_prob <- mean(p_values > 0.09)

round(non_rejection_prob, 3)
