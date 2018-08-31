library(tidyverse)
library(dplyr)

#Este script une las orquestas españolas y europeas. Calcula los porcentajes de mujeres y hombres instrumentistas.
#Además, se crea una nueva tabla con esta información.

# Establecemos la ruta al archivo que contiene orquestas españolas
# Este archivo contiene: país, comunidad autónoma, ciudad, nombre de la orquesta, instrumento, número de mujeres intrumentistas y número de hombres instrumentistas por cada instrumento y orquesta
filePath <- "https://gist.githubusercontent.com/arancruzmar/afbb480072f427c66df9d1c3abfb2006/raw/b59811486d0b5ce439de5b64b6d8a055a18dc894/datosorquestasesp"

# Este archivo contiene: país, ciudad, nombre de la orquesta, instrumento, número de mujeres intrumentistas y número de hombres instrumentistas por cada instrumento y orquesta
filePath2 <- "https://gist.githubusercontent.com/arancruzmar/da70406fa412f889d7dbe8c3c2ddec2d/raw/8ac97b9c146d4a239bb1feab87059d0c1eade322/datosorquestaseuropeas"

# csv, estableciendo el separador y diciendo el número de filas
orquestasespanolas <- read.csv(filePath, sep=",", encoding = "utf-8", nrows = 448)

# Leemos el csv, estableciendo el separador y diciendo el número de filas
orquestaseuropeas <- read.csv(filePath2, sep=",", encoding = "utf-8", nrows = 1101)

# Seleccionamos los campos del dataset de orquestas españolas que se quieren trasladar al nuevo dataset

orquestasespanolas <- data.frame(País=orquestasespanolas$País,Orquesta=orquestasespanolas$Orquesta,Instrumentos=orquestasespanolas$Instrumentos,Mujeres=orquestasespanolas$Mujeres,Hombres=orquestasespanolas$Hombres)

# Seleccionamos los campos del dataset de orquestas europeas que se quieren trasladar al nuevo dataset

orquestaseuropeas <- data.frame(País=orquestaseuropeas$País,Orquesta=orquestaseuropeas$Orquesta,Instrumentos=orquestaseuropeas$Instrumentos,Mujeres=orquestaseuropeas$Mujeres,Hombres=orquestaseuropeas$Hombres)

# Se unen todos los campos

todaslasorquestas <- rbind(orquestasespanolas,orquestaseuropeas)

# Creamos un nuevo dataset con el país, orquesta, instrumentos, número de hombres y número de mujeres de orquestas españolas y europeas

write_csv(todaslasorquestas, 'orquestasespanolasyeuropeas.csv')

#Seleccionamos y sumamos el número de mujeres de cada orquesta.

Total_Mujeres <-todaslasorquestas %>% 
  group_by(País,Orquesta) %>% 
  summarise(Mujeres = sum(Mujeres))

#Seleccionamos y sumamos el número de hombres de cada orquesta.

Total_Hombres <- todaslasorquestas %>% 
  group_by(País,Orquesta) %>% 
  summarise(Hombres = sum(Hombres))

#Unimos en una misma tabla, país, orquesta, los totales de mujeres y de hombres por orquesta.

Instrumentistas_Orquestas <- merge(País=todaslasorquestas$País,Orquesta=todaslasorquestas$Orquesta,Total_Mujeres,Total_Hombres)

#Con la tabla anterior creada, sumamos el total de instrumentistas por orquesta.

Total <- rowSums (Instrumentistas_Orquestas[1:103,3:4])

#Añadimos los totales de intrumentistas por orquesta a la tabla creada con los totales de mujeres y de hombres.

Totales <- cbind (Instrumentistas_Orquestas,Total)

#Calculamos el porcentaje de mujeres por cada orquesta, según los datos de las 103 orquestas

Mujeres <- round((Totales$Mujeres / Totales$Total)*100,0)

#Calculamos el porcentaje de hombres por cada orquesta, según los datos de las 103 orquestas

Hombres <- round((Totales$Hombres / Totales$Total)*100,0)

#Unimos el porcentaje de mujeres y de hombres

calculo_orquestas <- cbind(Totales,Mujeres)
calculo_orquestas <- cbind(Totales,Hombres)

#Ordenamos el porcentaje de mujeres y de hombres por orquesta

Dato<- (calculo_orquestas["Orquesta"])
Dato2<- (calculo_orquestas["País"])
Dato3<-(calculo_orquestas["Total"])

#Unimos en una misma tabla la orquesta con los correspondientes porcentajes de instrumentistas mujeres e instrumentistas hombres

porcentaje_instrumentistas_orquestas<- cbind(Dato2, Dato, Mujeres, Hombres,Dato3)

porcentaje_instrumentistas_orquestas

#Creamos un csv con la nueva tabla que recoge el procentaje de instrumentistas mujeres y el procentaje de instrumentistas hombres por cada orquesta y el total (sin %)

write_csv(porcentaje_instrumentistas_orquestas, 'porcentaje_instrumentistas_por_orquestasypaises.csv')


