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
###ejercicio 3
contar_peticiones_url <- function(dataset, url_buscada = "/") {
  # Filtrar las filas donde el Endpoint coincide con la URL buscada
  conteo <- dataset %>%
    filter(Endpoint == url_buscada) %>%
    summarise(Total = n())
  
  # Retornar el total
  return(conteo$Total)
}
hora<-hora_mayor_volumen_get(dataset)
### fin del erjercicio 3


###ejercicio 5
contar_peticiones_url <- function(dataset, url_buscada = "/") {
  # Filtrar las filas donde el Endpoint coincide con la URL buscada
  conteo <- dataset %>%
    filter(Endpoint == url_buscada) %>%
    summarise(Total = n())
  
  # Retornar el total
  return(conteo$Total)
}
total_peticiones <- contar_peticiones_url(dataset)
### fin del ejercicio 5

#aqui usamos dos formas de como obtener las dimensiones de un dataset 
cat("1. dimensión del data set",dimensiones, "\n")
cat("1. Número de filas:", n_filas, "\n")
cat("1. Número de columnas:", n_columnas, "\n")
cat("1. Valor medio de la columna 'bytes':", media_bytes, "\n")
cat("3. La hora", hora$Timestamp, "es la hora que tiene mayor volumen. El volumen es", hora$Volumen, "\n")
cat("5. Número de peticiones a la URL '/':", total_peticiones, "\n")

