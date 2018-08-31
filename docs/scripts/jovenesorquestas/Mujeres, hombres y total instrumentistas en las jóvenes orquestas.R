library(tidyverse)
library(dplyr)
library(janitor)

# Este script calcula, del total de jóvenes orquestas de las que se tienen datos, el total de mujeres instrumentistas y hombres instrumentistas.
# Además, calcula el total de estudiantes.

# Establecemos la ruta al archivo
# Este archivo contiene: comunidad autónoma, ciudad, nombre de la orquesta, instrumento, número de mujeres intrumentistas y número de hombres instrumentistas por cada instrumento y orquesta
filePath <- "https://gist.githubusercontent.com/arancruzmar/d03b272acc2ef8fa4a2514f5b9e06715/raw/6787d1346ade4337ab75880e59a3655042063b0f/datosjovenesorquestasfinal"

# Leemos el csv, estableciendo el separador y diciendo el número de filas
jovenes_orquestas <- read.csv(filePath, sep=",", encoding = "utf-8", nrows = 132)

# Utilizamos un pipe para limpiar el csv
DatosJovenesOrquestasEspanolas <- jovenes_orquestas %>%
  clean_names() %>% # Métodos de janitor para limpiar columnas
  remove_empty("cols") %>%
  remove_empty("rows")

# Sumamos toda la columna de mujeres para calcular el total de mujeres que forman parte de jóvenes orquestas

Mujeres = sum(DatosJovenesOrquestasEspanolas[1:104,5])

Mujeres

# Sumamos toda la columna de hombres para calcular el total de hombres que forman parte de jóvenes orquestas

Hombres = sum(DatosJovenesOrquestasEspanolas[1:104,6])

Hombres

# Sumamos las mujeres instrumentistas y los hombres intrumentistas para calcular el total

Total = Mujeres + Hombres

Total

