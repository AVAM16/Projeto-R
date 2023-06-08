library(ggplot2)

set.seed(1237)

n <- 187
cauchy_sample <- rcauchy(n, location = 2, scale = 1.8)
sorted_cauchy_sample <- sort(cauchy_sample)

normal_sample <- rnorm(n, mean = 3.3, sd = 2)

probabilities <- seq(1, n) / (n + 1)

quantiles_cauchy <- quantile(sorted_cauchy_sample, probabilities)

quantiles_normal <- quantile(normal_sample, probabilities)


plot <- ggplot() +
  geom_point(data = df_cauchy, aes(x = sorted_cauchy_sample, y = quantiles_cauchy,
                                   color = "Cauchy")) +
  geom_point(data = df_normal, aes(x = sorted_cauchy_sample, y = quantiles_normal,
                                   color = "Normal")) +
  geom_abline(slope = 1, intercept = 0, linetype = "dashed") +
  scale_x_continuous(name = "Valores da distribuição", limits = c(-100, 100)) +
  scale_y_continuous(name = "Quantis de probabilidade", limits = c(-100, 100)) +
  labs(color = "Quantis") +
  scale_color_manual(values = c("blue", "red"),
                     labels = c("Cauchy", "Normal"))


plot
