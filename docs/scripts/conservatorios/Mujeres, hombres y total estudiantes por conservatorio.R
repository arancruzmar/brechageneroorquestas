library(tidyverse)
library(dplyr)

#Este script calcula el número de mujeres y hombres, y el total, de estudiantes por conservatorio.
#Además, se crea una nueva tabla con esta información.

# Establecemos la ruta al archivo
# Este archivo contiene: comunidad autónoma, ciudad, nombre del conservatorio, instrumento, número de mujeres estudiantes y número de hombres estudiantes por cada instrumento y conservatorio.
filePath <- "https://gist.githubusercontent.com/arancruzmar/a99652f0712d4304329ef255c8980323/raw/a64d42a74478de8ce179a6c14c7cbd32d6bc99f2/datosconservatorios"

# Leemos el csv, estableciendo el separador y diciendo el número de filas
conservatorios <- read.csv(filePath, sep=",", encoding = "utf-8", nrows = 455)

#Seleccionamos y sumamos el número de mujeres que estudian en cada conservatorio

Total_Mujeres <-conservatorios %>% 
  group_by(Conservatorio) %>% 
  summarise(Mujeres = sum(Mujeres))

Total_Mujeres

#Seleccionamos y sumamos el número de hombres que estudian en cada conservatorio

Total_Hombres <- conservatorios %>% 
  group_by(Conservatorio) %>% 
  summarise(Hombres = sum(Hombres))

Total_Hombres

#Unimos en una misma tabla los totales de mujeres y de hombres por conservatorio

Estudiantes_Conservatorios <- merge(Total_Mujeres,Total_Hombres)

Estudiantes_Conservatorios

#Con la tabla anterior creada, sumamos el total de estudiantes por conservatorio

Total <- rowSums (Estudiantes_Conservatorios[1:34,2:3])

Total

#Añadimos los totales de estudiantes por conservatorio a la tabla creada con los totales de mujeres y de hombres

Totales <- cbind (Estudiantes_Conservatorios,Total)

Totales

#Creamos un csv con la nueva tabla que recoge el número de estudiantes mujeres, hombres y totales por conservatorio

write_csv(Totales, 'estudiantes_por_conservatorio.csv')

