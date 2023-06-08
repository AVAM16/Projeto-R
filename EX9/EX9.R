library(ggplot2)
set.seed(1094)

p <- 0.2
gamma <- 0.98
k <- 2500
sample_sizes <- c(30, 50, 100, 200, 300, 500, 1000)

calculate_difference <- function(sample_size) {
  # Metodo 1
  x_bar <- mean(rbinom(sample_size, 1, p))
  z <- qnorm((1 + gamma) / 2)
  p_1 <- (-2 * x_bar + sqrt(4 * x_bar^2 - 4 * (x_bar^2 - (z^2) * (x_bar * (1 - x_bar)) / sample_size))) / 2
  
  # Metodo 2
  z_2 <- (x_bar - p) / sqrt((x_bar * (1 - x_bar)) / sample_size)
  
  ci_1 <- c(x_bar - qnorm(gamma/2) * sqrt(x_bar * (1 - x_bar) / sample_size), 
            x_bar + qnorm(gamma/2) * sqrt(x_bar * (1 - x_bar) / sample_size))
  ci_2 <- c(p - qnorm(gamma/2) * sqrt(p * (1 - p) / sample_size), 
            p + qnorm(gamma/2) * sqrt(p * (1 - p) / sample_size))
  
  diff_length <- abs(diff(ci_2)) - abs(diff(ci_1))
  
  return(diff_length)
}

mean_diff_lengths <- sapply(sample_sizes, function(n) {
  diffs <- replicate(k, calculate_difference(n))
  mean(diffs)
})

plot_data <- data.frame(sample_size = sample_sizes, mean_diff_length = mean_diff_lengths)

ggplot(plot_data, aes(x = sample_size, y = mean_diff_length)) +
  geom_point(shape = 16) +
  labs(x = "n", y = "Média das Diferenças",
       title = "Média das diferenças em função da dimensão da amostra") +
  ylim(0, max(mean_diff_lengths))
