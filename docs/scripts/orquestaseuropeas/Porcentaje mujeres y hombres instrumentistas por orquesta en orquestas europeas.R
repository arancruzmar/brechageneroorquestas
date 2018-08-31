library(tidyverse)
library(dplyr)

#Este script calcula el porcentaje de mujeres y hombres instrumentistas en cada orquesta europea analizada.
#Además, se crea una nueva tabla con esta información.

# Establecemos la ruta al archivo
# Este archivo contiene: orquesta, mujeres, hombres y total de instrumentistas.
filePath <- "https://gist.githubusercontent.com/arancruzmar/06579992c365bfee3df87bc36fe91378/raw/e7f502d40e36a022fa2ed451419d7e51e5d868df/instrumentistas_por_orquestaeuropea"

# csv, estableciendo el separador y diciendo el número de filas
instrumentistas_orquestas <- read.csv(filePath, sep=",", encoding = "utf-8", nrows = 73)

#Calculamos el porcentaje de mujeres que tocan en cada orquesta, de las 72 analizadas.

Mujeres <- round((instrumentistas_orquestas$Mujeres / instrumentistas_orquestas$Total)*100,0)

Mujeres

#Calculamos el porcentaje de hombres que tocan en cada orquesta, de las 72 analizadas.

Hombres <- round((instrumentistas_orquestas$Hombres / instrumentistas_orquestas$Total)*100,0)

Hombres

#Unimos el porcentaje de mujeres y de hombres.

calculo_orquestas <- cbind(instrumentistas_orquestas,Mujeres)
calculo_orquestas <- cbind(instrumentistas_orquestas,Hombres)

#Ordenamos el porcentaje de mujeres y de hombres por orquesta

Comunidad<- (calculo_orquestas["Orquesta"])

#Unimos en una misma tabla por cada orquesta los porcentajes de instrumentistas mujeres e instrumentistas hombres.

porcentaje_instrumentistas_orquesta<- cbind(Comunidad, Mujeres, Hombres)

porcentaje_instrumentistas_orquesta

#Creamos un csv con la nueva tabla que recoge el procentaje de instrumentistas mujeres y el procentaje de instrumentistas hombres por cada orquesta.

write_csv(porcentaje_instrumentistas_orquesta, 'porcentaje_instrumentistas_por_orquestaeuropea.csv')

