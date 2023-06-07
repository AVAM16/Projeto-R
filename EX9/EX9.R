# Fixing the seed
set.seed(1094)

# Parameters
p <- 0.2
gamma <- 0.98
k <- 2500
sample_sizes <- c(30, 50, 100, 200, 300, 500, 1000)

# Function to calculate the difference in CI lengths
calculate_difference <- function(sample_size) {
  # Method 1
  x_bar <- mean(rbinom(sample_size, 1, p))
  z <- qnorm((1 + gamma) / 2)
  p_1 <- (-2 * x_bar + sqrt(4 * x_bar^2 - 4 * (x_bar^2 - (z^2) * (x_bar * (1 - x_bar)) / sample_size))) / 2
  
  # Method 2
  z_2 <- (x_bar - p) / sqrt((x_bar * (1 - x_bar)) / sample_size)
  
  # Confidence intervals
  ci_1 <- c(x_bar - qnorm(gamma/2) * sqrt(x_bar * (1 - x_bar) / sample_size), 
            x_bar + qnorm(gamma/2) * sqrt(x_bar * (1 - x_bar) / sample_size))
  ci_2 <- c(p - qnorm(gamma/2) * sqrt(p * (1 - p) / sample_size), 
            p + qnorm(gamma/2) * sqrt(p * (1 - p) / sample_size))
  
  # Difference in CI lengths
  diff_length <- abs(diff(ci_2)) - abs(diff(ci_1))
  
  return(diff_length)
}

# Calculate differences for each sample size
mean_diff_lengths <- sapply(sample_sizes, function(n) {
  diffs <- replicate(k, calculate_difference(n))
  mean(diffs)
})

# Plotting the results
plot(sample_sizes, mean_diff_lengths, type = "b", pch = 16,
     xlab = "Sample Size", ylab = "Mean Difference in CI Lengths",
     main = "Comparison of Confidence Interval Methods",
     ylim = range(mean_diff_lengths, 0))
