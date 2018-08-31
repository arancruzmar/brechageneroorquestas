library(tidyverse)
library(dplyr)
library(janitor)

# Este script calcula, del total de orquestas europeas de las que se tienen datos, el total de mujeres instrumentistas y hombres instrumentistas.
# Además, calcula el total de instrumentistas.

# Establecemos la ruta al archivo
# Este archivo contiene: país, ciudad, nombre de la orquesta, instrumento, número de mujeres intrumentistas y número de hombres instrumentistas por cada instrumento y orquesta
filePath <- "https://gist.githubusercontent.com/arancruzmar/da70406fa412f889d7dbe8c3c2ddec2d/raw/8ac97b9c146d4a239bb1feab87059d0c1eade322/datosorquestaseuropeas"

# Leemos el csv, estableciendo el separador y diciendo el número de filas
orquestas_europeas <- read.csv(filePath, sep=",", encoding = "utf-8", nrows = 1101)

# Utilizamos un pipe para limpiar el csv
DatosOrquestasEuropeas <- orquestas_europeas %>%
  clean_names() %>% # Métodos de janitor para limpiar columnas
  remove_empty("cols") %>%
  remove_empty("rows")

# Sumamos toda la columna de mujeres para calcular el total de mujeres que forman parte de orquestas europeas

Mujeres = sum(DatosOrquestasEuropeas[1:1100,5])

Mujeres

# Sumamos toda la columna de hombres para calcular el total de mujeres que forman parte de orquestas europeas

Hombres = sum(DatosOrquestasEuropeas[1:1100,6])

Hombres

# Sumamos las mujeres instrumentistas y los hombres intrumentistas para calcular el total

Total = Mujeres + Hombres

Total

