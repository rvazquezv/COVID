library(tidyverse)
library(dslabs)
library(gridExtra)
library(caret)

c1<-Galicia_own%>%filter(Fecha>="01-06-2020")%>%ggplot(aes(Nuevos_contagios,Muertes))+geom_point(alpha = 0.5)
Galicia_own%>%summarize(r=cor(Nuevos_contagios,Muertes))%>%pull(r)



Muertes_hat = lm(Muertes~Nuevos_contagios, data=Galicia_own)
summary(Muertes_hat)


Muertes_hat %>% ggplot(aes(Nuevos_contagios, Muertes)) +
  geom_point() + 
  geom_smooth(color="red", span = 0.05, method = "loess", method.args = list(degree=1))

Galicia_own%>%ggplot(aes(Fecha,Muertes))+geom_point()+geom_line()+geom_smooth(color="red", span = 0.05, method = "loess", method.args = list(degree=1))

Galicia_own%>%ggplot(aes(Fecha,Nuevos_contagios))+geom_point()+geom_line()+geom_smooth(color="red", span = 0.05, method = "loess", method.args = list(degree=1))
