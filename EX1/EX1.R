library(ggplot2)
library(readxl)
econ <- read_excel("econ.xlsx", col_types = c("date", 
                                              "skip", "numeric", "numeric", "skip", 
                                              "skip"))
econ[econ$tempo >= "1989-01-01", ]


