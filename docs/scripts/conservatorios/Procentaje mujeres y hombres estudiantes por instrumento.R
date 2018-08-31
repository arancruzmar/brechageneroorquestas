library(tidyverse)
library(dplyr)

#Este script calcula el porcentaje de mujeres y hombres estudiantes de cada instrumento que compone una orquesta
#Además, se crea una nueva tabla con esta información.

# Establecemos la ruta al archivo
# Este archivo contiene: instrumentos, mujeres, hombres y total de estudiantes por conservatorio.
filePath <- "https://gist.githubusercontent.com/arancruzmar/b6c811b79a0075428a12513b64c5ed56/raw/063f4c8290b0bed3ceab63e91335519bf3277412/estudiantes_por_intrumentos"

# csv, estableciendo el separador y diciendo el número de filas
conservatorio_instrumentos <- read.csv(filePath, sep=",", encoding = "utf-8", nrows = 16)

#Calculamos el % de mujeres que estudian cada instrumento, según los datos de los 30 conservatorios
Mujeres <- round((conservatorio_instrumentos$Mujeres / conservatorio_instrumentos$Total)*100,0)

Mujeres

#Calculamos el % de hombres que estudian cada instrumento
Hombres <- round((conservatorio_instrumentos$Hombres / conservatorio_instrumentos$Total)*100,0)

Hombres

#Unimos el porcentaje de mujeres y de hombres

calculo_estudiantes <- cbind(conservatorio_instrumentos,Mujeres)
calculo_estudiantes <- cbind(conservatorio_instrumentos,Hombres)

#Ordenamos el porcentaje de mujeres y de hombres por instrumento

Comunidad<- (calculo_estudiantes["Instrumentos"])

#Unimos en una misma tabla cada tipo de instrumento con los correspondientes porcentajes de estudiantes mujeres y estudiantes hombres

porcentaje_estudiantes_instrumento<- cbind(Comunidad, Mujeres, Hombres)

porcentaje_estudiantes_instrumento

#Creamos un csv con la nueva tabla que recoge el procentaje de estudiantes mujeres y el procentaje de estudiantes hombres por cada instrumento

write_csv(porcentaje_estudiantes_instrumento, 'porcentaje_estudiantes_instrumentos.csv')
