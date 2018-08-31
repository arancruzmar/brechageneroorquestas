library(tidyverse)
library(dplyr)

# Este script calcula, del total de orquestas europeas de las que se tienen datos, el total de mujeres instrumentistas y hombres instrumentistas por orquesta.
# Además, calcula el total de instrumentistas.

# Establecemos la ruta al archivo.
# Este archivo contiene: país, ciudad, nombre de la orquesta, instrumento, número de mujeres intrumentistas y número de hombres instrumentistas por cada instrumento y orquesta.
filePath <- "https://gist.githubusercontent.com/arancruzmar/da70406fa412f889d7dbe8c3c2ddec2d/raw/8ac97b9c146d4a239bb1feab87059d0c1eade322/datosorquestaseuropeas"

# Leemos el csv, estableciendo el separador y diciendo el número de filas
orquestas_europeas <- read.csv(filePath, sep=",", encoding = "utf-8", nrows = 1101)

#Seleccionamos y sumamos el número de mujeres de cada orquesta.

Total_Mujeres <-orquestas_europeas %>% 
  group_by(Orquesta) %>% 
  summarise(Mujeres = sum(Mujeres))

Total_Mujeres

#Seleccionamos y sumamos el número de hombres de cada orquesta.

Total_Hombres <- orquestas_europeas %>% 
  group_by(Orquesta) %>% 
  summarise(Hombres = sum(Hombres))

Total_Hombres

#Unimos en una misma tabla los totales de mujeres y de hombres por orquesta.

Instrumentistas_Orquestas_Europeas <- merge(Total_Mujeres,Total_Hombres)

Instrumentistas_Orquestas_Europeas

#Con la tabla anterior creada, sumamos el total de instrumentistas por orquesta.

Total <- rowSums (Instrumentistas_Orquestas_Europeas[1:72,2:3])

Total

#Añadimos los totales de intrumentistas por orquesta a la tabla creada con los totales de mujeres y de hombres.

Totales <- cbind (Instrumentistas_Orquestas_Europeas,Total)

Totales

#Creamos un csv con el número de instrumentistas homrbres, mujeres y total por cada orquesta.

write_csv(Totales, 'instrumentistas_por_orquesta_orquestaseuropeas.csv')

