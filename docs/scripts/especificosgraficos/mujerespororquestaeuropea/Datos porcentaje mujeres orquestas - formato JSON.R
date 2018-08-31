library(tidyverse)
library(dplyr)
library(readr)
library(jsonlite)

# Ruta al archivo
filePath <- "https://gist.githubusercontent.com/arancruzmar/0828c114f933023b9c9d7cec1d52df50/raw/dbe8110b1857f27e3bac433405e8bdeaffd2d93b/datos_instrumentistas_por_orquestasypaises"

# csv, estableciendo el separador y diciendo el número de filas
orquestas <- read.csv(filePath, sep=",", encoding = "utf-8", nrows = 104)


datosgrafico <- data.frame(local=orquestas$País,name=orquestas$Orquesta,value=orquestas$Mujeres,size=orquestas$Total)

datosgrafico

datosgrafico %>% 
  toJSON() %>%
  write_lines('mujeresorquestas.json')


mediamujeres <- mean(orquestas$Mujeres)

mediamujeres
