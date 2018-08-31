library(tidyverse)
library(dplyr)

filePath <- "https://gist.githubusercontent.com/arancruzmar/50a336e6d1b0bc3a8fc6c9e1d1b17e0b/raw/e226e9c783dc4d6235c8d5c987efbb7aec32c2f0/orquestasespanolasyeuropeas"
  
orquestas <- read.csv(filePath, sep=",", encoding = "utf-8", nrows = 1548)
i=0
Clase=0
c <- orquestas$Instrumentos
num <- length(c)
num

for (i in 1:num) 
  if (orquestas$Instrumentos[i]=="Violines primeros"|orquestas$Instrumentos[i]=="Violines segundos"|orquestas$Instrumentos[i]=="Violonchelos"|orquestas$Instrumentos[i]=="Contrabajos"|orquestas$Instrumentos[i]=="Violas"|orquestas$Instrumentos[i]=="Pianos"|orquestas$Instrumentos[i]=="Arpas") {
    Clase[i] <- c("Cuerda")
    i <-i+1
  } 
i=0
for (i in 1:num) 
  if (orquestas$Instrumentos[i]=="Percusiones"|orquestas$Instrumentos[i]=="Timbales") {
    Clase[i] <- c("Percusión")
    i <-i+1
    }
i=0
for (i in 1:num) 
  if (orquestas$Instrumentos[i]=="Flautas"|orquestas$Instrumentos[i]=="Oboes"|orquestas$Instrumentos[i]=="Clarinetes"|orquestas$Instrumentos[i]=="Fagotes") {
    Clase[i] <- c("Viento madera")
    i <-i+1
  }
i=0
for (i in 1:num) 
  if (orquestas$Instrumentos[i]=="Trompas"|orquestas$Instrumentos[i]=="Trompetas"|orquestas$Instrumentos[i]=="Trombones"|orquestas$Instrumentos[i]=="Tubas") {
    Clase[i] <- c("Viento metal")
    i <-i+1
  }

Clase

orquestas <- cbind (Clase, orquestas)

orquestas

TotalMujeres <- orquestas %>% 
  group_by(Clase,País) %>% 
  summarise(Mujeres = sum(Mujeres))

TotalMujeres

TotalHombres <-orquestas %>% 
  group_by(Clase,País) %>% 
  summarise(Hombres = sum(Hombres))

TotalHombres



Instrumentistas_InstrumentosAgrupados <- merge(TotalMujeres,TotalHombres)

Instrumentistas_InstrumentosAgrupados

Total <- rowSums (Instrumentistas_InstrumentosAgrupados[1:156,3:4])

Total

Totales <- cbind (Instrumentistas_InstrumentosAgrupados,Total)

Totales

TotalesFinal <- Totales[order(Totales$País),] 

TotalesFinal

a=1
b=2
c=3
d=4
z=1
fin=(nrow(TotalesFinal)-3)
print(TotalesFinal$País)
dfinalmujeres <- data.frame(País=TotalesFinal$País[a],Cuerda=TotalesFinal$Mujeres[a],Madera=TotalesFinal$Mujeres[c],Metal=TotalesFinal$Mujeres[d],Percusión=TotalesFinal$Mujeres[b])

while(z<fin){
  a <- a+4
  b <- b+4
  c <- c+4
  d <- d+4
  z <- z+4
  df<- data.frame(País=TotalesFinal$País[a],Cuerda=TotalesFinal$Mujeres[a],Madera=TotalesFinal$Mujeres[c],Metal=TotalesFinal$Mujeres[d],Percusión=TotalesFinal$Mujeres[b])
  dfinalmujeres <- rbind(dfinalmujeres,df)
}

dfinalmujeres

a=1
b=2
c=3
d=4
z=1
fin=(nrow(TotalesFinal)-3)
print(TotalesFinal$País)
dfinalhombres <- data.frame(País=TotalesFinal$País[a],Cuerda=TotalesFinal$Hombres[a],Madera=TotalesFinal$Hombres[c],Metal=TotalesFinal$Hombres[d],Percusión=TotalesFinal$Hombres[b])

while(z<fin){
  a <- a+4
  b <- b+4
  c <- c+4
  d <- d+4
  z <- z+4
  df<- data.frame(País=TotalesFinal$País[a],Cuerda=TotalesFinal$Hombres[a],Madera=TotalesFinal$Hombres[c],Metal=TotalesFinal$Hombres[d],Percusión=TotalesFinal$Hombres[b])
  dfinalhombres <- rbind(dfinalhombres,df)
}

dfinalhombres



#PORCENTAJES

PorcentajeMujeres <- data.frame(País=dfinalmujeres$País,Cuerda=round(dfinalmujeres$Cuerda / (dfinalmujeres$Cuerda+dfinalhombres$Cuerda)*100,0),Madera=round(dfinalmujeres$Madera/(dfinalmujeres$Madera+dfinalhombres$Madera)*100,0),Metal=round(dfinalmujeres$Metal/(dfinalmujeres$Metal+dfinalhombres$Metal)*100,0),Percusión=round(dfinalmujeres$Percusión/(dfinalmujeres$Percusión+dfinalhombres$Percusión)*100,0))

PorcentajeMujeres

write_csv(PorcentajeMujeres, 'datosgruposinstrumentosporpaisesmujeres.csv')


PorcentajeHombres <- data.frame(País=dfinalhombres$País,Cuerda=round(dfinalhombres$Cuerda / (dfinalmujeres$Cuerda+dfinalhombres$Cuerda)*100,0),Madera=round(dfinalhombres$Madera/(dfinalmujeres$Madera+dfinalhombres$Madera)*100,0),Metal=round(dfinalhombres$Metal/(dfinalmujeres$Metal+dfinalhombres$Metal)*100,0),Percusión=round(dfinalhombres$Percusión/(dfinalmujeres$Percusión+dfinalhombres$Percusión)*100,0))

PorcentajeHombres

write_csv(PorcentajeHombres, 'datosgruposinstrumentosporpaiseshombres.csv')

