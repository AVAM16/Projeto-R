mu <- 51.8
sigma <- 2
n <- 46
m <- 250

set.seed(189)

samples <- matrix(rnorm(n * m, mean = mu, sd = sigma), nrow = n, ncol = m)

hypothesis_test <- function(sample) {
  t_stat <- (mean(sample) - 50.5) / (sigma/sqrt(n))
  p_value <- 2 * pt(abs(t_stat), df = n-1, lower.tail = FALSE)
  return(p_value <= 0.09)
}

results <- apply(samples, 2, hypothesis_test)

prob_non_rejection <- mean(results)

prob_non_rejection <- round(prob_non_rejection, 3)

prob_non_rejection
