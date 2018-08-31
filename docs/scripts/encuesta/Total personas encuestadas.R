library(tidyverse)
library(dplyr)
library(janitor)

# Establecemos la ruta al archivo
filePath <- "https://gist.githubusercontent.com/arancruzmar/a2429719b5bab0d00993d65c4331c171/raw/cafde614e75a1628a88f9853f93c3605264b9cd2/encuesta"

# Leemos el csv, estableciendo el separador y diciendo el número de filas
encuestas <- read.csv(filePath, sep=",", encoding = "utf-8", nrows = 271)

c <- encuestas$Sexo

c


num <- length(c)

num

Mujeres_Encuestadas = 0
Hombres_Encuestados = 0
i = 0

Mujeres_Encuestadas
Hombres_Encuestados

for (i in 1:num) 
  if (c[i] =="Mujer") {
     Mujeres_Encuestadas = (Mujeres_Encuestadas + 1)
     i=i+1
  }else{
    Hombres_Encuestados = (Hombres_Encuestados + 1)
    i=i+1
  }


Mujeres_Encuestadas
Hombres_Encuestados

Porcentaje_mujeres_encuestadas = 0
Porcentaje_hombres_encuestados = 0

Porcentaje_mujeres_encuestadas = round((Mujeres_Encuestadas / (Mujeres_Encuestadas+Hombres_Encuestados))*100,0)
Porcentaje_hombres_encuestados = round((Hombres_Encuestados / (Mujeres_Encuestadas+Hombres_Encuestados))*100,0)

Porcentaje_mujeres_encuestadas
Porcentaje_hombres_encuestados
