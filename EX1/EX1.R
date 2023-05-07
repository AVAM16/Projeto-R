library(ggplot2)
library(readxl)
econ <- read_excel("econ.xlsx", col_types = c("date", 
                                              "skip", "numeric", "numeric", "skip", 
                                              "skip"))
econcut <- econ[econ$tempo >= "1989-01-01", ]
popavg <- mean(econcut$pop)
tppavg <- mean(econcut$tpp)
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

X1 <- sapply(econcut$pop, zpop)
X2 <- sapply(econcut$tpp, ztpp)
graph1 <- ggplot(econcut, aes(tempo)) + geom_line(aes(y = X1, color = "X1")) + 
  geom_line(aes(y= X2, color = "X2"))
graph1 + xlab("Data") + ylab("Valor") + scale_color_discrete(name = "Função")
