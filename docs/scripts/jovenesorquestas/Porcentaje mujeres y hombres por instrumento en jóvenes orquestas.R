library(tidyverse)
library(dplyr)

#Este script calcula el porcentaje de mujeres y hombres instrumentistas de cada instrumento que compone una joven orquesta.
#Además, se crea una nueva tabla con esta información.

# Establecemos la ruta al archivo
# Este archivo contiene: instrumentos, mujeres, hombres y total de instrumentistas.
filePath <- "https://gist.githubusercontent.com/arancruzmar/dbe2ba55168e652bf55a2519ebcfe049/raw/e2743a205e1c00a43f63b1926b7d47d0be687635/instrumentistas_por_instrumento_jovenesorquestasfinal"

# csv, estableciendo el separador y diciendo el número de filas
instrumentistas_jo_instrumentos <- read.csv(filePath, sep=",", encoding = "utf-8", nrows = 18)

#Calculamos el porcentaje de mujeres que tocan cada instrumento, según los datos de las 8 jóvenes orquestas.

Mujeres <- round((instrumentistas_jo_instrumentos$Mujeres / instrumentistas_jo_instrumentos$Total)*100,0)

Mujeres

#Calculamos el porcentaje de hombres que tocan cada instrumento, según los datos de las 8 jóvenes orquestas.

Hombres <- round((instrumentistas_jo_instrumentos$Hombres / instrumentistas_jo_instrumentos$Total)*100,0)

Hombres

#Unimos el porcentaje de mujeres y de hombres.

calculo_instrumentistas_jo <- cbind(instrumentistas_jo_instrumentos,Mujeres)
calculo_instrumentistas_jo <- cbind(instrumentistas_jo_instrumentos,Hombres)

#Ordenamos el porcentaje de mujeres y de hombres por instrumento.

Comunidad<- (calculo_instrumentistas_jo["Instrumentos"])

#Unimos en una misma tabla cada tipo de instrumento con los correspondientes porcentajes de instrumentistas mujeres e instrumentistas hombres.

porcentaje_instrumentistas_jo_instrumento<- cbind(Comunidad, Mujeres, Hombres)

porcentaje_instrumentistas_jo_instrumento

#Creamos un csv con la nueva tabla que recoge el procentaje de instrumentistas mujeres y el procentaje de instrumentistas hombres por cada instrumento.

write_csv(porcentaje_instrumentistas_jo_instrumento, 'porcentaje_instrumentistas_por_instrumento_jovenesorquestas.csv')
