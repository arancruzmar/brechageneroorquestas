library(tidyverse)
library(dplyr)

#Este script calcula el porcentaje de mujeres y hombres por orquesta
#Además, se crea una nueva tabla con esta información.

# Establecemos la ruta al archivo
# Este archivo contiene: orquesta, mujeres, hombres y total de instrumentistas.
filePath <- "https://gist.githubusercontent.com/arancruzmar/2a35294704c4a29d18a487c08ad28f1b/raw/f7b9d3d197bb14be8cb0b0a1dc0ae129c25ab900/instrumentistas_por_orquestaesp"

# csv, estableciendo el separador y diciendo el número de filas
instrumentistas_orquestas <- read.csv(filePath, sep=",", encoding = "utf-8", nrows = 31)

#Calculamos el porcentaje de mujeres por cada orquesta, según los datos de las 31 orquestas

Mujeres <- round((instrumentistas_orquestas$Mujeres / instrumentistas_orquestas$Total)*100,0)

Mujeres

#Calculamos el porcentaje de hombres por cada orquesta, según los datos de las 31 orquestas

Hombres <- round((instrumentistas_orquestas$Hombres / instrumentistas_orquestas$Total)*100,0)

Hombres

#Unimos el porcentaje de mujeres y de hombres

calculo_orquestas <- cbind(instrumentistas_orquestas,Mujeres)
calculo_orquestas <- cbind(instrumentistas_orquestas,Hombres)

#Ordenamos el porcentaje de mujeres y de hombres por orquesta

Comunidad<- (calculo_orquestas["Orquesta"])

#Unimos en una misma tabla la orquesta con los correspondientes porcentajes de instrumentistas mujeres e instrumentistas hombres

porcentaje_instrumentistas_orquesta<- cbind(Comunidad, Mujeres, Hombres)

porcentaje_instrumentistas_orquesta

#Creamos un csv con la nueva tabla que recoge el procentaje de instrumentistas mujeres y el procentaje de instrumentistas hombres por cada orquesta

write_csv(porcentaje_instrumentistas_orquesta, 'porcentaje_instrumentistas_por_orquestaesp.csv')
