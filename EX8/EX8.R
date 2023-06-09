library(ggplot2)

set.seed(1237)

n <- 187
cauchy_sample <- rcauchy(n, location = 2, scale = 1.8)
sorted_cauchy_sample <- sort(cauchy_sample)

normal_sample <- rnorm(n, mean = 3.3, sd = 2)

probabilities <- seq(1, n) / (n + 1)

quantiles_cauchy <- quantile(sorted_cauchy_sample, probabilities)

quantiles_normal <- quantile(normal_sample, probabilities)

df <- data.frame(sample = sorted_cauchy_sample,
                 y_cauchy = quantiles_cauchy,
                 y_normal = quantiles_normal)

plot <- ggplot(df, aes(x = sample)) +
  geom_point(aes(y = y_cauchy, colour = "Cauchy")) +
  geom_point(aes(y = y_normal, colour = "Normal")) +
  geom_abline(slope = 1, intercept = 0, linetype = "dashed") +
  scale_x_continuous(name = "Valores da distribuição", limits = c(-150, 150)) +
  scale_y_continuous(name = "Quantis de probabilidade", limits = c(-150, 150)) +
  labs(color = "Quantis")


plot
