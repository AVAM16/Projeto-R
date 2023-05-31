set.seed(4762)

k <- 1358
lambda <- 24
sample <- rexp(k, rate = 1/lambda)

cumulative_sum <- cumsum(sample)

T <- ceiling(cumulative_sum[k])

intervals <- seq(0, T, by = 1)

event_counts <- tabulate(findInterval(cumulative_sum, intervals))

mean_count <- mean(event_counts)
expected_count <- k * (1 - exp(-lambda))

abs_deviation <- abs(mean_count - expected_count)

rounded_deviation <- round(abs_deviation, 4)

rounded_deviation