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

