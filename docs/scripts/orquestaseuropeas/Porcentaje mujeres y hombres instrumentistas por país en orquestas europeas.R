library(tidyverse)
library(dplyr)

#Este script calcula el porcentaje de mujeres y hombres instrumentistas por cada país con orquestas analizadas.
#Además, se crea una nueva tabla con esta información.

# Establecemos la ruta al archivo
# Este archivo contiene: país, mujeres, hombres y total de instrumentistas.
filePath <- "https://gist.githubusercontent.com/arancruzmar/7c4b189f259c0b74ffdd367a78a96ad6/raw/fcc8de9052ee91a055f712610a759fb76b72cef4/instrumentistas_por_pais_orquestaseuropeas"

# csv, estableciendo el separador y diciendo el número de filas
instrumentistas_paises <- read.csv(filePath, sep=",", encoding = "utf-8", nrows = 39)

#Calculamos el porcentaje de mujeres por cada país (38 países), según los datos de las 72 orquestas.

Mujeres <- round((instrumentistas_paises$Mujeres / instrumentistas_paises$Total)*100,0)

Mujeres

#Calculamos el porcentaje de hombres por cada país (38 países), según los datos de las 72 orquestas.

Hombres <- round((instrumentistas_paises$Hombres / instrumentistas_paises$Total)*100,0)

Hombres

#Unimos el porcentaje de mujeres y de hombres.

instrumentistas_paises <- cbind(instrumentistas_paises,Mujeres)
instrumentistas_paises <- cbind(instrumentistas_paises,Hombres)

#Ordenamos el porcentaje de mujeres y de hombres por país.

Comunidad<- (instrumentistas_paises["País"])

#Unimos en una misma tabla cada país con los correspondientes porcentajes de instrumentistas mujeres e instrumentistas hombres.

porcentaje_instrumentistas_paises<- cbind(Comunidad, Mujeres, Hombres)

porcentaje_instrumentistas_paises

#Creamos un csv con la nueva tabla que recoge el procentaje de instrumentistas mujeres y el procentaje de instrumentistas hombres por cada país

write_csv(porcentaje_instrumentistas_paises, 'porcentaje_instrumentistas_por_pais_orquestaseuropeas.csv')
