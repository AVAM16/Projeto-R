library(ggplot2)
set.seed(1094)

n_values <- c(30, 50, 100, 200, 300, 500, 1000)
k <- 2500
p <- 0.2
gamma <- 0.98

# Metodo 1
calculate_interval_length_method1 <- function(x_bar, n, z) {
  discriminant <- x_bar^2 - 2 * p * x_bar + p^2 - z^2 * p * (1 - p) / n
  interval_length <- 2 * sqrt(max(0, discriminant))
  return(interval_length)
}

# Metodo 2
calculate_interval_length_method2 <- function(x_bar, n) {
  interval_length <- 2 * qnorm((1 + gamma) / 2) * sqrt(x_bar * (1 - x_bar) / n)
  return(interval_length)
}

mean_differences <- numeric(length(n_values))

for (i in seq_along(n_values)) {
  n <- n_values[i]
  differences <- numeric(k)
  
  for (j in 1:k) {
    sample <- rbinom(n, size = 1, prob = p)
    x_bar <- mean(sample)
    z <- qnorm((1 + gamma) / 2)
    
    interval_length_method1 <- calculate_interval_length_method1(x_bar, n, z)
    interval_length_method2 <- calculate_interval_length_method2(x_bar, n)
    
    differences[j] <- interval_length_method2 - interval_length_method1
  }
  
  valid_differences <- differences[is.finite(differences)]
  mean_differences[i] <- mean(valid_differences)
}

data <- data.frame(n = n_values, mean_differences = mean_differences)

ggplot(data, aes(x = n, y = mean_differences)) +
  geom_point() +
  geom_line() +
  labs(x = "Tamanho da amostra (n)", y = "Média das diferenças",
       title = "Média das diferenças em função da dimensão da amostra") +
  ylim(min(mean_differences), max(mean_differences))