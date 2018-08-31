library(tidyverse)
library(dplyr)

#Este script calcula el número de mujeres y hombres, y el total, de estudiantes por instrumento
#Además, se crea una nueva tabla con esta información.

# Establecemos la ruta al archivo
# Este archivo contiene: comunidad autónoma, ciudad, nombre del conservatorio, instrumento, número de mujeres estudiantes y número de hombres estudiantes por cada instrumento y conservatorio.
filePath <- "https://gist.githubusercontent.com/arancruzmar/a99652f0712d4304329ef255c8980323/raw/a64d42a74478de8ce179a6c14c7cbd32d6bc99f2/datosconservatorios"

# Leemos el csv, estableciendo el separador y diciendo el número de filas. Cogemos todas menos las cuatro últimas que no tienen la información por instrumentos.
conservatorios <- read.csv(filePath, sep=",", encoding = "utf-8", nrows = 450)

#Seleccionamos y sumamos el número de mujeres que estudian cada instrumento

Total_Mujeres <-conservatorios %>% 
  group_by(Instrumentos) %>% 
  summarise(Mujeres = sum(Mujeres))

Total_Mujeres

#Seleccionamos y sumamos el número de hombres que estudian cada instrumento

Total_Hombres <- conservatorios %>% 
  group_by(Instrumentos) %>% 
  summarise(Hombres = sum(Hombres))

Total_Hombres

#Unimos en una misma tabla los totales de mujeres y de hombres por instrumento

Estudiantes_Instrumentos <- merge(Total_Mujeres,Total_Hombres)

Estudiantes_Instrumentos

#Con la tabla anterior creada, sumamos el total de estudiantes por instrumento

Total <- rowSums (Estudiantes_Instrumentos[1:15,2:3])

Total

#Añadimos los totales de estudiantes por instrumento a la tabla creada con los totales de mujeres y de hombres

Totales <- cbind (Estudiantes_Instrumentos,Total)

Totales

#Creamos un csv con la nueva tabla que recoge el número de estudiantes mujeres, hombres y totales por instrumento

write_csv(Totales, 'estudiantes_por_instrumentos.csv')

