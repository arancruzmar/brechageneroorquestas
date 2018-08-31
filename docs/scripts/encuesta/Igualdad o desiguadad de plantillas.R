library(tidyverse)
library(dplyr)
library(janitor)

# Establecemos la ruta al archivo
filePath <- "https://gist.githubusercontent.com/arancruzmar/a2429719b5bab0d00993d65c4331c171/raw/cafde614e75a1628a88f9853f93c3605264b9cd2/encuesta"

# Leemos el csv, estableciendo el separador y diciendo el número de filas
encuestas <- read.csv(filePath, sep=",", encoding = "utf-8", nrows = 271)

c <- encuestas$Sexo

c

d <- encuestas$Numero_MujeresHombresParecido

d

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


Hombres_IgualdadPlantilla = 0
Hombres_DesigualdadPlantilla = 0
Mujeres_IgualdadPlantilla = 0
Mujeres_DesigualdadPlantilla =0

i=0

for (i in 1:num) 
  if (c[i] =="Hombre") {
    if (d[i] =="Sí") {
      Hombres_IgualdadPlantilla = (Hombres_IgualdadPlantilla+1)
      i=i+1
    }else{
      Hombres_DesigualdadPlantilla = (Hombres_DesigualdadPlantilla+1)
      i=i+1
    }
  }else{
    if (d[i] =="Sí") {
      Mujeres_IgualdadPlantilla = (Mujeres_IgualdadPlantilla+1)
      i=i+1
    }else{
      Mujeres_DesigualdadPlantilla = (Mujeres_DesigualdadPlantilla+1)
      i=i+1
    }
  }

Hombres_IgualdadPlantilla
Hombres_DesigualdadPlantilla
Mujeres_IgualdadPlantilla
Mujeres_DesigualdadPlantilla

Total_IgualdadPlantilla = 0
Total_DesigualdadPlantilla =0

i=0

for (i in 1:num) 
  if (d[i] =="Sí") {
    Total_IgualdadPlantilla = (Total_IgualdadPlantilla+1)
    i=i+1
  }else{
    Total_DesigualdadPlantilla = (Total_DesigualdadPlantilla+1)
    i=i+1
  }

Total_IgualdadPlantilla
Total_DesigualdadPlantilla

Porcentaje_Hombres_IgualdadPlantilla = round((Hombres_IgualdadPlantilla/Hombres_Encuestados)*100,0)
Porcentaje_Hombres_DesigualdadPlantilla = round((Hombres_DesigualdadPlantilla/Hombres_Encuestados)*100,0)
Porcentaje_Mujeres_IgualdadPlantilla = round((Mujeres_IgualdadPlantilla/Mujeres_Encuestadas)*100,0)
Porcentaje_Mujeres_DesigualdadPlantilla = round((Mujeres_DesigualdadPlantilla/Mujeres_Encuestadas)*100,0)
Porcentaje_Total_IgualdadPlantilla = round((Total_IgualdadPlantilla/(Mujeres_Encuestadas+Hombres_Encuestados))*100,0)
Porcentaje_Total_DesigualdadPlantilla = round((Total_DesigualdadPlantilla/(Mujeres_Encuestadas+Hombres_Encuestados))*100,0)


Porcentaje_Hombres_IgualdadPlantilla
Porcentaje_Hombres_DesigualdadPlantilla
Porcentaje_Mujeres_IgualdadPlantilla
Porcentaje_Mujeres_DesigualdadPlantilla 
Porcentaje_Total_IgualdadPlantilla
Porcentaje_Total_DesigualdadPlantilla
