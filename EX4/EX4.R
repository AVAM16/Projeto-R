set.seed(4762)
k <- 1358
lambda <- 24
sample <- rexp(k, rate = lambda)
cumulative_sum <- cumsum(sample)
T <- ceiling(cumulative_sum[k])
limits <- ceiling(cumulative_sums[k])
count <- table(cut(cumulative_sums, breaks =  limits, right = FALSE))

mean1 <- mean(count)

deviation <- abs(mean1 - lambda)
rounded_deviation <- round(deviation, 4)
rounded_deviation
