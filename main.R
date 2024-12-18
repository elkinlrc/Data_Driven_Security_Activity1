#cargamos la librerias que vamos a usar
library(readr)
library(stringr)
library(dplyr)
source("procesar_dataset.R")
dataset <- procesar_dataset()

n_filas <- nrow(dataset)
n_columnas <- ncol(dataset)

dimensiones <- dim(dataset)
media_bytes <- mean(dataset$bytes, na.rm = TRUE)



# Función para determinar la hora con mayor volumen de peticiones "GET"
hora_mayor_volumen_get <- function(dataset) {
  
  
  # Filtrar solo las peticiones de tipo "GET"
  peticiones_get <- dataset %>% 
    filter(Metodo == "GET")
  
  # Extraer la hora de la columna Timestamp (formato [HH:MM:SS])
  peticiones_get$Timestamp <- str_sub(peticiones_get$Timestamp, 5, 6)
  
  # Contar la cantidad de peticiones por hora
  conteo_horas <- peticiones_get %>%
    group_by(Timestamp) %>%
    summarise(Volumen = n()) %>%
    arrange(desc(Volumen)) %>%
    slice(1)  # Selecciona el primer registro, que es el de mayor volumen
  
  # Devolver solo el registro con la hora y el volumen correspondiente
  return(conteo_horas)
  

}
# Llamada a la función con el dataset
hora<-hora_mayor_volumen_get(dataset)


#aqui usamos dos formas de como obtener las dimensiones de un dataset 
cat("dimensión del data set",dimensiones, "\n")
cat("Número de filas:", n_filas, "\n")
cat("Número de columnas:", n_columnas, "\n")
cat("Valor medio de la columna 'bytes':", media_bytes, "\n")
cat("La hora", hora$Timestamp, "es la hora que tiene mayor volumen. El volumen es", hora$Volumen, "\n")

# Identificar las filas problemáticas, se comento despues de usarse
#esto se uso para identifar errores que me salia en el dataset
#problemas <- problems(dataset)
#print(problemas)
