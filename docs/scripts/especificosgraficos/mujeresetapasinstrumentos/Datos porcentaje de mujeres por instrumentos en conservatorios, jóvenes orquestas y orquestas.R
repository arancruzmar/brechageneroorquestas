library(tidyverse)
library(dplyr)

#Este script crea un dataframe con el procentaje de mujeres por instrumentos en conservatorios, jóvenes orquestas y orquestas.

# Establecemos la ruta al archivo que contiene orquestas españolas

# SUBIR % por instrumentos de conservatorios, jóvenes orquestas y orquestas.
# En jo y orquestas hay que hacer media de violines y percusiones

filePath <- "https://gist.githubusercontent.com/arancruzmar/402896839b19b00f77f3096fa529a9fb/raw/04e6bdeb910a6c0f7b595d9cb0309f533b0e3ef1/porcentajeinstrumentosconservatorios"
filePath2 <- "https://gist.githubusercontent.com/arancruzmar/ba50ffdc5cffc177f70fa603aea415df/raw/0309f63f9452633fa11eac08db841baa96740505/porcentajeinstrumentosjovenesorquestas"
filePath3 <- "https://gist.githubusercontent.com/arancruzmar/ca1667c7f06b21cddcf87e983ddba666/raw/fa640ac7899de8cb0921f851e6052e1aaa409418/porcentajeinstrumentosorquestasesp"

# Leemos el csv, estableciendo el separador y diciendo el número de filas
conservatorios <- read.csv(filePath, sep=",", encoding = "utf-8", nrows = 16)

# Leemos el csv, estableciendo el separador y diciendo el número de filas
jovenesorquestas <- read.csv(filePath2, sep=",", encoding = "utf-8", nrows = 17)

# csv, estableciendo el separador y diciendo el número de filas
orquestasespanolas <- read.csv(filePath3, sep=",", encoding = "utf-8", nrows = 18)

# Seleccionamos los campos del dataset de orquestas españolas que se quieren trasladar al nuevo dataset

conservatorios <- data.frame(Instrumentos=conservatorios$Instrumentos,Mujeres_Conservatorios=conservatorios$Mujeres)

# Seleccionamos los campos del dataset de orquestas europeas que se quieren trasladar al nuevo dataset

jovenesorquestas <- data.frame(Mujeres_JovenesOrquestas=jovenesorquestas$Mujeres)

# Seleccionamos los campos del dataset de orquestas europeas que se quieren trasladar al nuevo dataset

orquestasespanolas <- data.frame(Mujeres_Orquestas=orquestasespanolas$Mujeres)

# Se unen todos los campos

procentajesmujeresinstrumentos <- cbind(conservatorios,jovenesorquestas,orquestasespanolas)

procentajesmujeresinstrumentos

# Creamos un nuevo dataset con el país, orquesta, instrumentos, número de hombres y número de mujeres de orquestas españolas y europeas

write_csv(procentajesmujeresinstrumentos, 'procentajesmujeresinstrumentos.csv')


