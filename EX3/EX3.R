library(ggplot2)
library(tidyr)
file <- "https://web.tecnico.ulisboa.pt/~paulo.soares/pe/projeto/GENDER_EMP_19032023152556091.txt"
dados <- read.delim(file)
dados <- dados[dados$Country == "Germany" 
               & dados$TIME == "2015"
               & dados$SEX %in% c("MEN", "WOMEN")
               & dados$IND == "EMP5"
               & dados$AGE %in% c("1524", "2554", "5564"),]
ggplot(dados, aes(x = dados$Age.Group, y = dados$Value, fill = dados$Sex)) + geom_bar(position = "dodge", stat="identity") + 
  ggtitle("EMP5 value by age group and sex, 2015, Germany") +
  xlab("Age group") +
  ylab("EMP5 value") +
  labs(fill = "Sex")
