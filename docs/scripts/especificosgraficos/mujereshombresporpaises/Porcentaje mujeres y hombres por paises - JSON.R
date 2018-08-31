library(tidyverse)
library(dplyr)
library(readr)
library(jsonlite)

# Ruta al archivo
filePath <- "https://gist.githubusercontent.com/arancruzmar/05a60722b91d2c061881271761736a65/raw/4ed31d941f42c38cdbb2defd6b40d864b0ebec44/datosabsolutosorquestasespyeu"

# csv, estableciendo el separador y diciendo el número de filas
orquestas <- read.csv(filePath, sep=",", encoding = "utf-8", nrows = 1548)

#Seleccionamos y sumamos el número de mujeres que son intrumentistas en cada país.

Total_Mujeres <-orquestas %>% 
  group_by(País) %>% 
  summarise(Mujeres = sum(Mujeres))

Total_Mujeres

#Seleccionamos y sumamos el número de hombres que son intrumentistas en cada país.

Total_Hombres <- orquestas %>% 
  group_by(País) %>% 
  summarise(Hombres = sum(Hombres))

Total_Hombres

Totales <- orquestas %>% 
  group_by(País) %>% 
  summarise(Total = sum(Total))

Totales

#Unimos en una misma tabla los totales de mujeres y de hombres por país.

Instrumentistas_Paises <- merge(Total_Mujeres,Total_Hombres)

Instrumentistas_Paises <- merge (Instrumentistas_Paises,Totales)

Instrumentistas_Paises

#Calculamos el porcentaje de mujeres por cada país (39 países), según los datos de las 103 orquestas.

Mujeres <- round((Instrumentistas_Paises$Mujeres / Instrumentistas_Paises$Total)*100,0)

Mujeres

#Calculamos el porcentaje de hombres por cada país (39 países), según los datos de las 103 orquestas.

Hombres <- round((Instrumentistas_Paises$Hombres / Instrumentistas_Paises$Total)*100,0)

Hombres

#Unimos el porcentaje de mujeres y de hombres.

Instrumentistas_Paises <- cbind(Instrumentistas_Paises,Mujeres)
Instrumentistas_Paises <- cbind(Instrumentistas_Paises,Hombres)


#Ordenamos el porcentaje de mujeres y de hombres por país.

Comunidad<- (Instrumentistas_Paises["País"])

#Unimos en una misma tabla cada país con los correspondientes porcentajes de instrumentistas mujeres e instrumentistas hombres.

porcentaje_paises<- cbind(Comunidad, Mujeres, Hombres)

porcentaje_paises

porcentaje_paises %>% 
  toJSON() %>%
  write_lines('porcentajesmujeresyhombresorquestas.json')



write_csv(porcentaje_paises, 'porcentaje_mujereshombres_pais.csv')

