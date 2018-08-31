library(tidyverse)
library(dplyr)

#Este script calcula el número de mujeres y hombres, y el total, de instrumentistas por instrumentos en jóvenes orquestas.
#Además, se crea una nueva tabla con esta información.

# Establecemos la ruta al archivo
# Este archivo contiene: comunidad autónoma, ciudad, nombre de la joven orquesta, instrumento, número de mujeres instrumentistas y número de hombres instrumentistas por cada instrumento y orquesta
filePath <- "https://gist.githubusercontent.com/arancruzmar/d03b272acc2ef8fa4a2514f5b9e06715/raw/6787d1346ade4337ab75880e59a3655042063b0f/datosjovenesorquestasfinal"

# Leemos el csv, estableciendo el separador y diciendo el número de filas
jovenes_orquestas <- read.csv(filePath, sep=",", encoding = "utf-8", nrows = 132)

#Seleccionamos y sumamos el número de mujeres que son intrumentistas en cada instrumento

Total_Mujeres <-jovenes_orquestas %>% 
  group_by(Instrumentos) %>% 
  summarise(Mujeres = sum(Mujeres))

Total_Mujeres

#Seleccionamos y sumamos el número de hombres que son intrumentistas en cada instrumento

Total_Hombres <- jovenes_orquestas %>% 
  group_by(Instrumentos) %>% 
  summarise(Hombres = sum(Hombres))

Total_Hombres

#Unimos en una misma tabla los totales de mujeres y de hombres por instrumento

Instrumentistas_Instrumentos_JovenesOrquestas <- merge(Total_Mujeres,Total_Hombres)

Instrumentistas_Instrumentos_JovenesOrquestas

#Con la tabla anterior creada, sumamos el total de instrumentistas por instrumento

Total <- rowSums (Instrumentistas_Instrumentos_JovenesOrquestas[1:16,2:3])

Total

#Añadimos los totales de instrumentistas por instrumento a la tabla creada con los totales de mujeres y de hombres

Totales <- cbind (Instrumentistas_Instrumentos_JovenesOrquestas,Total)

Totales

#Creamos un csv con la nueva tabla que recoge el número de instrumentistas mujeres, hombres y totales por instrumentos de jóvenes orquestas

write_csv(Totales, 'instrumentistas_por_instrumento_jovenesorquestas.csv')

