library(ggplot2)
set.seed(4762)
k <- 1358
distexp <- rexp(k,24)
sumfun <- function(x, n) {
  return(sum(x[1:n]))
}
data <- distexp
for (x in 1:k){
  data[x] <- sumfun(distexp, x)
}
