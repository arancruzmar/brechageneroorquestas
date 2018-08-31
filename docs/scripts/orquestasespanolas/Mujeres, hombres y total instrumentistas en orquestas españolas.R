library(tidyverse)
library(dplyr)
library(janitor)

# Este script calcula, del total de orquestas de las que se tienen datos, el total de mujeres instrumentistas y hombres instrumentistas.
# Además, calcula el total de instrumentistas.

# Establecemos la ruta al archivo
# Este archivo contiene: país, comunidad autónoma, ciudad, nombre de la orquesta, instrumento, número de mujeres intrumentistas y número de hombres instrumentistas por cada instrumento y orquesta
filePath <- "https://gist.githubusercontent.com/arancruzmar/afbb480072f427c66df9d1c3abfb2006/raw/b59811486d0b5ce439de5b64b6d8a055a18dc894/datosorquestasesp"

# Leemos el csv, estableciendo el separador y diciendo el número de filas.
orquestas_espanolas <- read.csv(filePath, sep=",", encoding = "utf-8", nrows = 448)

# Utilizamos un pipe para limpiar el csv.
DatosOrquestasEspanolas <- orquestas_espanolas %>%
  clean_names() %>% # Métodos de janitor para limpiar columnas
  remove_empty("cols") %>%
  remove_empty("rows")

# Sumamos toda la columna de mujeres para calcular el total de mujeres que forman parte de orquestas.

Mujeres = sum(DatosOrquestasEspanolas[1:447,6])

Mujeres

# Sumamos toda la columna de hombres para calcular el total de mujeres que forman parte de orquestas

Hombres = sum(DatosOrquestasEspanolas[1:447,7])

Hombres

# Sumamos las mujeres instrumentistas y los hombres intrumentistas para calcular el total

Total = Mujeres + Hombres

Total

