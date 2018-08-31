library(tidyverse)
library(dplyr)
library(janitor)

# Este script calcula, del total de conservatorios de los que se tienen datos, el total de mujeres estudiantes, hombres estudiantes, y el total.
# Además, calcula el total de estudiantes.

# Establecemos la ruta al archivo
# Este archivo contiene: comunidad autónoma, ciudad, nombre del conservatorio, instrumento, número de mujeres estudiantes y número de hombres estudiantes por cada instrumento y conservatorio.
filePath <- "https://gist.githubusercontent.com/arancruzmar/a99652f0712d4304329ef255c8980323/raw/a64d42a74478de8ce179a6c14c7cbd32d6bc99f2/datosconservatorios"

# Leemos el csv, estableciendo el separador y diciendo el número de filas
conservatorios <- read.csv(filePath, sep=",", encoding = "utf-8", nrows = 455)

# Utilizamos un pipe para limpiar el csv
DatosConservatorios <- conservatorios %>%
  clean_names() %>% # Métodos de janitor para limpiar columnas
  remove_empty("cols") %>%
  remove_empty("rows")

# Sumamos toda la columna de mujeres para calcular el total de mujeres que estudian en los conservatorios analizados

Mujeres = sum(DatosConservatorios[1:454,5])

Mujeres

# Sumamos toda la columna de hombres para calcular el total de hombres que estudian en los conservatorios analizados

Hombres = sum(DatosConservatorios[1:454,6])

Hombres

# Sumamos mujeres y hombres para calcular el total de estudiantes

Total = Mujeres + Hombres

Total

Porcentajemujeres = round(Mujeres / Total,2)*100

Porcentajemujeres

Porcentajehombres = round(Hombres / Total,2)*100

Porcentajehombres



