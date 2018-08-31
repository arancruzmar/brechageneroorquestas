library(tidyverse)
library(dplyr)

#Este script calcula el porcentaje de mujeres y hombres instrumentistas por cada instrumento que componen las orquestas analizadas.
#Además, se crea una nueva tabla con esta información.

# Establecemos la ruta al archivo
# Este archivo contiene: instrumentos, mujeres, hombres y total de instrumentistas.
filePath <- "https://gist.githubusercontent.com/arancruzmar/396117207ede8f0726eb66cde2300158/raw/8ee25f1384b28841a1bb12769d0ed95c3b297aee/instrumentistas_por_instrumento_orquestaseuropeas"

# csv, estableciendo el separador y diciendo el número de filas
instrumentistas_instrumentos <- read.csv(filePath, sep=",", encoding = "utf-8", nrows = 18)

#Esta sería la operación, que hago también con los hombres. Salen los % pero es verdad que como en fila. 
Mujeres <- round((instrumentistas_instrumentos$Mujeres / instrumentistas_instrumentos$Total)*100,0)

Mujeres

Hombres <- round((instrumentistas_instrumentos$Hombres / instrumentistas_instrumentos$Total)*100,0)

Hombres

calculo_instrumentistas <- cbind(instrumentistas_instrumentos,Mujeres)
calculo_instrumentistas <- cbind(instrumentistas_instrumentos,Hombres)

Comunidad<- (calculo_instrumentistas["Instrumentos"])

porcentaje_instrumentistas_orquestaseuropeas_instrumento<- cbind(Comunidad, Mujeres, Hombres)

porcentaje_instrumentistas_orquestaseuropeas_instrumento

write_csv(porcentaje_instrumentistas_orquestaseuropeas_instrumento, 'porcentaje_instrumentistas_por_instrumento_orquestaseuropeas.csv')
