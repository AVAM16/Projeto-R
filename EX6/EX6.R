benford <- function(x) {
  log10(1 + 1/x)
}

p_1_8 <- benford(1) + benford(8)

count <- 0
total <- 0
for (i in 4:30) {
  if (substr(as.character(2^i), 1, 1) %in% c("1", "8")) {
    count <- count + 1
  }
  total <- total + 1
}
fraction_1_8 <- count/total

deviation <- abs(p_1_8 - fraction_1_8)

deviation_rounded <- round(deviation, 4)

deviation_rounded