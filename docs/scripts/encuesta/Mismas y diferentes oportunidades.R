library(tidyverse)
library(dplyr)
library(janitor)

# Establecemos la ruta al archivo
filePath <- "https://gist.githubusercontent.com/arancruzmar/a2429719b5bab0d00993d65c4331c171/raw/cafde614e75a1628a88f9853f93c3605264b9cd2/encuesta"

# Leemos el csv, estableciendo el separador y diciendo el número de filas
encuestas <- read.csv(filePath, sep=",", encoding = "utf-8", nrows = 271)

c <- encuestas$Sexo

c

d <- encuestas$Mujeres_MismasOportunidades

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


Hombres_MismasOportunidades = 0
Hombres_DiferentesOportunidades = 0
Mujeres_MismasOportunidades = 0
Mujeres_DiferentesOportunidades =0

i=0

for (i in 1:num) 
  if (c[i] =="Hombre") {
    if (d[i] =="Sí") {
      Hombres_MismasOportunidades = (Hombres_MismasOportunidades+1)
      i=i+1
    }else{
      Hombres_DiferentesOportunidades = (Hombres_DiferentesOportunidades+1)
      i=i+1
    }
  }else{
    if (d[i] =="Sí") {
      Mujeres_MismasOportunidades = (Mujeres_MismasOportunidades+1)
      i=i+1
    }else{
      Mujeres_DiferentesOportunidades = (Mujeres_DiferentesOportunidades+1)
      i=i+1
    }
  }

Hombres_MismasOportunidades
Hombres_DiferentesOportunidades
Mujeres_MismasOportunidades
Mujeres_DiferentesOportunidades

Total_MismasOportunidades = 0
Total_DiferentesOportunidades =0

i=0

for (i in 1:num) 
  if (d[i] =="Sí") {
    Total_MismasOportunidades = (Total_MismasOportunidades+1)
    i=i+1
  }else{
    Total_DiferentesOportunidades = (Total_DiferentesOportunidades+1)
    i=i+1
  }

Total_MismasOportunidades
Total_DiferentesOportunidades

Porcentaje_Hombres_MismasOportunidades = round((Hombres_MismasOportunidades/Hombres_Encuestados)*100,0)
Porcentaje_Hombres_DiferentesOportunidades = round((Hombres_DiferentesOportunidades/Hombres_Encuestados)*100,0)
Porcentaje_Mujeres_MismasOportunidades = round((Mujeres_MismasOportunidades/Mujeres_Encuestadas)*100,0)
Porcentaje_Mujeres_DiferentesOportunidades = round((Mujeres_DiferentesOportunidades/Mujeres_Encuestadas)*100,0)
Porcentaje_Total_MismasOportunidades = round((Total_MismasOportunidades/(Mujeres_Encuestadas+Hombres_Encuestados))*100,0)
Porcentaje_Total_DiferentesOportunidades = round((Total_DiferentesOportunidades/(Mujeres_Encuestadas+Hombres_Encuestados))*100,0)


Porcentaje_Hombres_MismasOportunidades
Porcentaje_Hombres_DiferentesOportunidades
Porcentaje_Mujeres_MismasOportunidades
Porcentaje_Mujeres_DiferentesOportunidades
Porcentaje_Total_MismasOportunidades
Porcentaje_Total_DiferentesOportunidades
