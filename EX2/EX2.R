library(ggplot2)

TIME_USE <- read.csv("TIME_USE_24092022.csv", encoding='utf-8')
TIME_USE <- TIME_USE[TIME_USE$País != "África do Sul",]
TIME_CUT <- TIME_USE[TIME_USE$Sexo == "Mulheres" 
                     & TIME_USE$Ocupação %in% c("Outros", "Trabalho remunerado ou estudo"),]
ggplot(TIME_CUT, aes(x = TIME_CUT$Ocupação, y = TIME_CUT$Tempo)) + geom_boxplot() +
  xlab("Ocupação") +
  ylab("Tempo")