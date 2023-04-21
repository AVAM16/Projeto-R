library(ggplot2)
library(tidyr)
file <- "https://web.tecnico.ulisboa.pt/~paulo.soares/pe/projeto/GENDER_EMP_19032023152556091.txt"
dados <- read.delim(file)
dados <- dados[dados$Country == "Germany" 
               & dados$TIME == "2015"
               & dados$SEX %in% c("MEN", "WOMEN")
               & dados$IND == "EMP5"
               & dados$AGE %in% c("1524", "2554", "5564"),]