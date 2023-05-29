set.seed(1312)

m <- 2577
n <- 17

samples <- matrix(rnorm(m * n), ncol = n)

sum_of_squares <- rowSums(samples^2)

quantile_sample <- quantile(sum_of_squares, probs = 0.47, type = 2)

quantile_theoretical <- qchisq(0.47, df = n)

difference <- abs(quantile_sample - quantile_theoretical)

difference_rounded <- round(difference, 4)

difference_rounded