library(ggplot2)
library(readxl)
econ <- read_excel("econ.xlsx", col_types = c("date", 
                                              "skip", "numeric", "numeric", "skip", 
                                              "skip"))
econcut <- econ[econ$tempo >= "1989-01-01", ]
popavg <- median(econcut$pop)
tppavg <- median(econcut$tpp)
pops <- sd(econcut$pop)
tpps <- sd(econcut$tpp)

zpop <- function(pop) {
  x <- (pop - popavg) / pops
  return(x)
}

ztpp <- function(tpp) {
  x <- (tpp - tppavg) / tpps
  return(x)
}

z1 <- sapply(econcut$pop, zpop)
z2 <- sapply(econcut$tpp, ztpp)
graph1 <- ggplot(econcut, aes(tempo)) + geom_line(aes(y = z1, color = "z1")) + 
  geom_line(aes(y= z2, color = "z2"))
graph1 + xlab("Data") + ylab("X") 