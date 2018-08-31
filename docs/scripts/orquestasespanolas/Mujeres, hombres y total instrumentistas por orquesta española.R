library(tidyverse)
library(dplyr)

# Este script calcula, del total de orquestas de las que se tienen datos, el total de mujeres instrumentistas y hombres instrumentistas por orquesta
# Además, calcula el total de instrumentistas de cada orquesta

# Establecemos la ruta al archivo
# Este archivo contiene: país, comunidad autónoma, ciudad, nombre de la orquesta, instrumento, número de mujeres intrumentistas y número de hombres instrumentistas por cada instrumento y orquesta
filePath <- "https://gist.githubusercontent.com/arancruzmar/afbb480072f427c66df9d1c3abfb2006/raw/b59811486d0b5ce439de5b64b6d8a055a18dc894/datosorquestasesp"

# Leemos el csv, estableciendo el separador y diciendo el número de filas
orquestas_espanolas <- read.csv(filePath, sep=",", encoding = "utf-8", nrows = 448)

#Seleccionamos y sumamos el número de mujeres de cada orquesta.

Total_Mujeres <-orquestas_espanolas %>% 
  group_by(Orquesta) %>% 
  summarise(Mujeres = sum(Mujeres))

Total_Mujeres

#Seleccionamos y sumamos el número de hombres de cada orquesta.

Total_Hombres <- orquestas_espanolas %>% 
  group_by(Orquesta) %>% 
  summarise(Hombres = sum(Hombres))

Total_Hombres

#Unimos en una misma tabla los totales de mujeres y de hombres por orquesta.

Instrumentistas_Orquestas <- merge(Total_Mujeres,Total_Hombres)

Instrumentistas_Orquestas

#Con la tabla anterior creada, sumamos el total de instrumentistas por orquesta.

Total <- rowSums (Instrumentistas_Orquestas[1:31,2:3])

Total

#Añadimos los totales de intrumentistas por orquesta a la tabla creada con los totales de mujeres y de hombres.

Totales <- cbind (Instrumentistas_Orquestas,Total)

Totales

#Creamos un csv con el número de instrumentistas homrbres, mujeres y total por cada orquesta.

write_csv(Totales, 'instrumentistas_por_orquestaesp.csv')

