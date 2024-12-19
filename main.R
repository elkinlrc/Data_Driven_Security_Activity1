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
####ejercicio 2############
#Codigo pregunta 2 Cantidad de ips o filas con .edu
# Obtener todos los IP educativos .edu 
data_edu <- dataset[grepl("\\.edu", dataset$site), ]
# Contar la cantidad de filas (páginas .edu)
total_paginas_edu <- nrow(data_edu)

########fin del ejericcio 4
####ejercicio 4############

#Codigo pregunta 4 Cantidad de bytes transmitidos en .edu de archivos .txt
# Obtener las filas transmitidos como .txt en las paginas .edu 
data_txt_edu <- dataset[grepl("\\.edu", dataset$site) & grepl("\\.txt$", dataset$Endpoint), ]
# Calcular la suma de la columna 'bytes'
total_bytes <- sum(data_txt_edu$bytes, na.rm = TRUE)



####ejercicio 6############
#Codigo pregunta 6 peticiones que no tienen como protocolo HTTP/0.2

# Eliminar comillas adicionales en la columna Protocolo
dataset$Protocolo <- gsub('"', '', dataset$Protocolo)
# Filtrar las filas que NO tienen el protocolo "HTTP/0.2"
no_http_02 <- subset(dataset, Protocolo != "HTTP/0.2")
# Contar el número de filas que cumplen con esta condición
cantidad_no_http_02 <- nrow(no_http_02)


##########################

#aqui usamos dos formas de como obtener las dimensiones de un dataset 
cat("1. dimensión del data set",dimensiones, "\n")
cat("1. Número de filas:", n_filas, "\n")
cat("1. Número de columnas:", n_columnas, "\n")
cat("1. Valor medio de la columna 'bytes':", media_bytes, "\n")
cat("3. La hora", hora$Timestamp, "es la hora que tiene mayor volumen. El volumen es", hora$Volumen, "\n")
cat("5. Número de peticiones a la URL '/':", total_peticiones, "\n")








