library(tidyverse)
library(dplyr)

#Este script calcula el porcentaje de mujeres y hombres por joven orquesta
#Además, se crea una nueva tabla con esta información.

# Establecemos la ruta al archivo
# Este archivo contiene: orquesta, mujeres, hombres y total de instrumentistas.
filePath <- "https://gist.githubusercontent.com/arancruzmar/f68a7ce01e78a5bb59a668e5bbc2dd98/raw/e368bf4a91ea8788a584c7f3b786078095b9db4f/instrumentistas_por_jovenorquestafinal"

# csv, estableciendo el separador y diciendo el número de filas
instrumentistas_jo_orquesta <- read.csv(filePath, sep=",", encoding = "utf-8", nrows = 11)

#Calculamos el porcentaje de mujeres por cada joven orquesta, según los datos de las 8 jóvenes orquestas

Mujeres <- round((instrumentistas_jo_orquesta$Mujeres / instrumentistas_jo_orquesta$Total)*100,0)

Mujeres

#Calculamos el porcentaje de hombres por cada joven orquesta, según los datos de las 8 jóvenes orquestas

Hombres <- round((instrumentistas_jo_orquesta$Hombres / instrumentistas_jo_orquesta$Total)*100,0)

Hombres

#Unimos el porcentaje de mujeres y de hombres

calculo_orquestas_jo <- cbind(instrumentistas_jo_orquesta,Mujeres)
calculo_orquestas_jo <- cbind(instrumentistas_jo_orquesta,Hombres)

#Ordenamos el porcentaje de mujeres y de hombres por joven orquesta

Comunidad<- (calculo_orquestas_jo["Orquesta"])

#Unimos en una misma tabla la joven orquesta con los correspondientes porcentajes de instrumentistas mujeres e instrumentistas hombres

porcentaje_instrumentistas_jo_orquesta<- cbind(Comunidad, Mujeres, Hombres)

porcentaje_instrumentistas_jo_orquesta

#Creamos un csv con la nueva tabla que recoge el procentaje de instrumentistas mujeres y el procentaje de instrumentistas hombres por cada joven orquesta

write_csv(porcentaje_instrumentistas_jo_orquesta, 'porcentaje_instrumentistas_por_jovenorquesta.csv')
