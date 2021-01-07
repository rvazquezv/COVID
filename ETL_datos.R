library(tidyverse)
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