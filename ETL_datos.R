library(tidyverse)
library(dslabs)
library(gridExtra)
ds_theme_set()
Galicia <- read_csv("data/galicia.csv")
Lugo <- read_csv("data/lugo.csv")
Galicia_own<-read_csv("gal.csv")

#Transformaciones en Lugo

Aux_Lugo<-Lugo%>%select(Fecha,Muertos_Acum=Lugo.fallecidos.acum)%>%filter(!is.na(Muertos_Acum))%>%mutate(Muertos=Muertos_Acum-lag(Muertos_Acum))

l2<-Aux_Lugo%>%ggplot(aes(Fecha,Muertos_Acum))+geom_point()+geom_line()
l3<-Aux_Lugo%>%ggplot(aes(Fecha,Muertos))+geom_point()+geom_line()

#Transformaciones en Galicia

Aux_Gal<-Galicia%>%select(Fecha,Muertos_Acum=Galicia.fallecidos.acum)%>%filter(!is.na(Muertos_Acum))%>%mutate(Muertos=Muertos_Acum-lag(Muertos_Acum))

g2<-Aux_Gal%>%ggplot(aes(Fecha,Muertos_Acum))+geom_point()+geom_line()
g3<-Aux_Gal%>%ggplot(aes(Fecha,Muertos))+geom_point()+geom_line()

#Transformaciones en Galicia (fuente de datos propia)

o2<-Galicia_own%>%ggplot(aes(Fecha,Muertes_Acumuladas))+geom_point()+geom_line()
o3<-Galicia_own%>%ggplot(aes(Fecha,Muertes))+geom_point()+geom_line()

o21<-Galicia_own%>%ggplot(aes(Fecha,Casos_Acumulados))+geom_point()+geom_line()
o31<-Galicia_own%>%ggplot(aes(Fecha,Nuevos_contagios))+geom_point()+geom_line()


#Representación grafica de muertes y nuevos contagios

grid.arrange(o3,o31)
layout(matrix(c(1,2),2,2,byrow=F))
plot(Galicia_own$Fecha,Galicia_own$Nuevos_contagios)
plot(Galicia_own$Fecha,Galicia_own$Muertes)


