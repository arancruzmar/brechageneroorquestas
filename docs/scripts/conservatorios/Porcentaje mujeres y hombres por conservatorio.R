library(tidyverse)
library(dplyr)

#Este script calcula el porcentaje de mujeres y hombres por conservatorio
#Además, se crea una nueva tabla con esta información.

# Establecemos la ruta al archivo
# Este archivo contiene: conservatorio, mujeres, hombres y total de estudiantes por conservatorio.
filePath <- "https://gist.githubusercontent.com/arancruzmar/6d73c311c78e4086229bc87927ca31b5/raw/3500803d86fdc980364524f93418c9e92f58c1f3/estudiantes_por_conservatorio"

# csv, estableciendo el separador y diciendo el número de filas
estudiantes_conservatorio <- read.csv(filePath, sep=",", encoding = "utf-8", nrows = 35)

#Calculamos el % de mujeres por cada conservatorio, según los datos de los 34 conservatorios

Mujeres <- round((estudiantes_conservatorio$Mujeres / estudiantes_conservatorio$Total)*100,0)

Mujeres

#Calculamos el % de hombres por cada conservatorio

Hombres <- round((estudiantes_conservatorio$Hombres / estudiantes_conservatorio$Total)*100,0)

Hombres

#Unimos el porcentaje de mujeres y de hombres

calculo_orquestas <- cbind(estudiantes_conservatorio,Mujeres)
calculo_orquestas <- cbind(estudiantes_conservatorio,Hombres)

#Ordenamos el porcentaje de mujeres y de hombres por conservatorio

Comunidad<- (calculo_orquestas["Conservatorio"])

#Unimos en una misma tabla el conservatorio con los correspondientes porcentajes de estudiantes mujeres y estudiantes hombres

porcentaje_estudiantes_conservatorio<- cbind(Comunidad, Mujeres, Hombres)

porcentaje_estudiantes_conservatorio

#Creamos un csv con la nueva tabla que recoge el procentaje de estudiantes mujeres y el procentaje de estudiantes hombres por conservatorio

write_csv(porcentaje_estudiantes_conservatorio, 'porcentaje_estudiantes_conservatorio.csv')
