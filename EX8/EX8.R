library(ggplot2)

set.seed(1237)

n <- 187
cauchy_sample <- rcauchy(n, location = 2, scale = 1.8)

normal_sample <- rnorm(n, mean = 3.3, sd = 2)

df_cauchy <- data.frame(
  values = sort(cauchy_sample),
  quantiles = seq(1, n) / (n + 1)
)

df_normal <- data.frame(
  values = sort(normal_sample),
  quantiles = seq(1, n) / (n + 1)
)

plot <- ggplot() +
  geom_point(data = df_cauchy, aes(x = quantiles, y = values),
             color = "blue", alpha = 0.6) +
  geom_point(data = df_normal, aes(x = quantiles, y = values),
             color = "red", alpha = 0.6) +
  geom_abline(slope = 1, intercept = 0, linetype = "dashed") +
  scale_x_continuous(name = "Quantis", limits = c(0, 1)) +
  scale_y_continuous(name = "Valores") +
  theme_minimal()

plot
