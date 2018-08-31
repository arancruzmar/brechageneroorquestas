library(tidyverse)
library(dplyr)

#Este script calcula el porcentaje de mujeres y hombres instrumentistas de cada instrumento que compone una orquesta.
#Además, se crea una nueva tabla con esta información.

# Establecemos la ruta al archivo
# Este archivo contiene: instrumentos, mujeres, hombres y total de instrumentistas.
filePath <- "https://gist.githubusercontent.com/arancruzmar/6340668ca751f1ed983627e38e1e2863/raw/4b14932da6aaad271c4714969f3d37df2559edf9/instrumentistas_por_instrumento_orquestasesp"

# csv, estableciendo el separador y diciendo el número de filas
instrumentistas_instrumentos <- read.csv(filePath, sep=",", encoding = "utf-8", nrows = 18)

#Calculamos el porcentaje de mujeres que tocan cada instrumento, según los datos de las 31 orquestas.

Mujeres <- round((instrumentistas_instrumentos$Mujeres / instrumentistas_instrumentos$Total)*100,0)

Mujeres

#Calculamos el porcentaje de hombres que tocan cada instrumento, según los datos de las 31 orquestas.

Hombres <- round((instrumentistas_instrumentos$Hombres / instrumentistas_instrumentos$Total)*100,0)

Hombres

#Unimos el porcentaje de mujeres y de hombres.

calculo_instrumentistas <- cbind(instrumentistas_instrumentos,Mujeres)
calculo_instrumentistas <- cbind(instrumentistas_instrumentos,Hombres)

#Ordenamos el porcentaje de mujeres y de hombres por instrumento.

Comunidad<- (calculo_instrumentistas["Instrumentos"])

#Unimos en una misma tabla cada tipo de instrumento con los correspondientes porcentajes de instrumentistas mujeres e instrumentistas hombres.

porcentaje_instrumentistas_instrumento<- cbind(Comunidad, Mujeres, Hombres)

porcentaje_instrumentistas_instrumento

#Creamos un csv con la nueva tabla que recoge el procentaje de instrumentistas mujeres y el procentaje de instrumentistas hombres por cada instrumento.

write_csv(porcentaje_instrumentistas_instrumento, 'porcentaje_instrumentistas_por_instrumento_orquestasesp.csv')
