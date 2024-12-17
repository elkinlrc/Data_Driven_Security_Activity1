Análisis de Datos y Resolución de Casos Prácticos en Data Driven
Security
================

## Descripción

Repositorio para la Actividad Evaluable 1 de Data Driven Security
(Máster en Gestión de la Ciberseguridad, 2024/2025). Contiene análisis
de preguntas de ciencia de datos, resolución de un caso práctico sobre
registros TCP, y procesamiento de logs HTTP con R. Incluye código
reproducible en RMarkdown, documentación y resultados renderizados.

# Actividad Evaluable 1 - Data Driven Security

### Clasificación de preguntas de Data Science

A continuación, se clasifica cada pregunta según su tipo (descriptiva,
exploratoria, inferencial, predictiva o causal) y se justifica
brevemente la elección.

------------------------------------------------------------------------

### **Pregunta 1**

**Enunciado:**  
Dado un registro de vehículos que circulan por una autopista, disponemos
de su marca y modelo, país de matriculación, y tipo de vehículo (por
número de ruedas). Con tal de ajustar precios de los peajes:  
- ¿Cuántos vehículos tenemos por tipo?  
- ¿Cuál es el tipo más frecuente?  
- ¿De qué países tenemos más vehículos?

**Clasificación:**  
**Descriptiva**

**Justificación:**  
Esta pregunta busca resumir el conjunto de datos mediante estadísticas
básicas, como conteos y frecuencias, sin realizar inferencias ni
predicciones.

------------------------------------------------------------------------

### **Pregunta 2**

**Enunciado:**  
Dado un registro de visualizaciones de un servicio de video-on-demand,
donde disponemos de los datos del usuario, de la película seleccionada,
fecha de visualización y categoría de la película, queremos saber:  
- ¿Hay alguna preferencia en cuanto a género literario según los
usuarios y su rango de edad?

**Clasificación:**  
**Exploratoria**

**Justificación:**  
Se busca identificar relaciones o patrones entre el rango de edad de los
usuarios y sus preferencias de género literario. No se intenta predecir
ni generalizar resultados.

------------------------------------------------------------------------

### **Pregunta 3**

**Enunciado:**  
Dado un registro de peticiones a un sitio web, vemos que las peticiones
que provienen de una red de telefonía concreta acostumbran a ser
incorrectas y provocarnos errores de servicio:  
- ¿Podemos determinar si en el futuro, los próximos mensajes de esa red
seguirán dando problemas?  
- ¿Hemos notado el mismo efecto en otras redes de telefonía?

**Clasificación:**  **Predictiva**

**Justificación:**  Ésta pregunta busca predecir si futuros mensajes de
una red específica seguirán generando errores y determinar si el patrón
se repite en otras redes, basándose en datos históricos, por lo tanto,
se trata una predicción.

------------------------------------------------------------------------

### **Pregunta 4**

**Enunciado:**  
Dado los registros de usuarios de un servicio de compras por internet,
los usuarios pueden agruparse por preferencias de productos comprados.
Queremos saber:  
- ¿Es posible que, dado un usuario al azar y según su historial, pueda
ser directamente asignado a uno o diversos grupos?

**Clasificación:**  
**Inferencial**

**Justificación:**  
Ésta pregunta busca generalizar un patrón del conjunto de datos
existente para asignar un usuario nuevo a un grupo, utilizando su
historial de compras. Se trata de inferir en la clasificación del
usuario.

ejercicio 1

``` r
#cargamos la librerias que vamos a usar
library(readr)
library(stringr)

# Leer el archivo CSV donde los separadores son espacios
dataset <- read_table(
  "epa-http.csv",
  col_names = FALSE,  # Nombres genéricos de columna
  na = c("", "NA", "NULL"),   
  col_types = cols( #decimos la columna que tipo de valor debe usar
    X1 = col_character(), # Columna 1 como texto
    X2 = col_character(), # Columna 2 como texto
    X3 = col_character(), # Columna 3 como texto
    X4 = col_character(), # Columna 4 como texto
    X5 = col_character(), # Columna 5 como texto
    X6 = col_integer(),   # Columna 6 como entero
    X7 = col_integer()  # Columna 7 como texto
  )
)
```

    ## Warning: 5331 parsing failures.
    ## row col               expected actual           file
    ##  11  X7 no trailing characters      - 'epa-http.csv'
    ##  14  X7 no trailing characters      - 'epa-http.csv'
    ##  20  X7 no trailing characters      - 'epa-http.csv'
    ##  24  X7 no trailing characters      - 'epa-http.csv'
    ##  36  X7 no trailing characters      - 'epa-http.csv'
    ## ... ... ...................... ...... ..............
    ## See problems(...) for more details.

``` r
#colocamos valores por defecto a campos vacios 
dataset$X6[is.na(dataset$X6)] <- 0
dataset$X7[is.na(dataset$X7)] <- 0
# Cambiar nombres de las columnas
colnames(dataset) <- c("site", "Hora", "Metodo", "Endpoint", "Protocolo", "Respuesta http", "bytes")

dataset$Metodo <- str_replace_all(dataset$Metodo, '"', "") 
# Obtener el número de filas y columnas
n_filas <- nrow(dataset)
n_columnas <- ncol(dataset)

dimensiones <- dim(dataset)
media_bytes <- mean(dataset$bytes, na.rm = TRUE)
```

ejercicio 2

``` r
#cargamos la librerias que vamos a usar
library(readr)
library(stringr)

# Leer el archivo CSV donde los separadores son espacios
dataset <- read_table(
  "epa-http.csv",
  col_names = FALSE,  # Nombres genéricos de columna
  na = c("", "NA", "NULL"),   
  col_types = cols( #decimos la columna que tipo de valor debe usar
    X1 = col_character(), # Columna 1 como texto
    X2 = col_character(), # Columna 2 como texto
    X3 = col_character(), # Columna 3 como texto
    X4 = col_character(), # Columna 4 como texto
    X5 = col_character(), # Columna 5 como texto
    X6 = col_integer(),   # Columna 6 como entero
    X7 = col_integer()  # Columna 7 como texto
  )
)
```

    ## Warning: 5331 parsing failures.
    ## row col               expected actual           file
    ##  11  X7 no trailing characters      - 'epa-http.csv'
    ##  14  X7 no trailing characters      - 'epa-http.csv'
    ##  20  X7 no trailing characters      - 'epa-http.csv'
    ##  24  X7 no trailing characters      - 'epa-http.csv'
    ##  36  X7 no trailing characters      - 'epa-http.csv'
    ## ... ... ...................... ...... ..............
    ## See problems(...) for more details.

``` r
#colocamos valores por defecto a campos vacios 
dataset$X6[is.na(dataset$X6)] <- 0
dataset$X7[is.na(dataset$X7)] <- 0
# Cambiar nombres de las columnas
colnames(dataset) <- c("site", "Hora", "Metodo", "Endpoint", "Protocolo", "Respuesta http", "bytes")

#Codigo pregunta 2 Cantidad de ips o filas con .edu
# Obtener todos los IP educativos .edu 
data_edu <- dataset[grepl("\\.edu", dataset$site), ]
# Contar la cantidad de filas (páginas .edu)
total_paginas_edu <- nrow(data_edu)

#Codigo pregunta 4 Cantidad de bytes transmitidos en .edu de archivos .txt
# Obtener las filas transmitidos como .txt en las paginas .edu 
data_txt_edu <- dataset[grepl("\\.edu", dataset$site) & grepl("\\.txt$", dataset$Endpoint), ]
# Calcular la suma de la columna 'bytes'
total_bytes <- sum(data_txt_edu$bytes, na.rm = TRUE)
```

ejercicio 3

``` r
#cargamos la librerias que vamos a usar
library(readr)
library(stringr)
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
# Leer el archivo CSV donde los separadores son espacios
dataset <- read_table(
  "epa-http.csv",
  col_names = FALSE,  # Nombres genéricos de columna
  na = c("", "NA", "NULL"),   
  col_types = cols( #decimos la columna que tipo de valor debe usar
    X1 = col_character(), # Columna 1 como texto
    X2 = col_character(), # Columna 2 como texto
    X3 = col_character(), # Columna 3 como texto
    X4 = col_character(), # Columna 4 como texto
    X5 = col_character(), # Columna 5 como texto
    X6 = col_integer(),   # Columna 6 como entero
    X7 = col_integer()  # Columna 7 como texto
  )
)
```

    ## Warning: 5331 parsing failures.
    ## row col               expected actual           file
    ##  11  X7 no trailing characters      - 'epa-http.csv'
    ##  14  X7 no trailing characters      - 'epa-http.csv'
    ##  20  X7 no trailing characters      - 'epa-http.csv'
    ##  24  X7 no trailing characters      - 'epa-http.csv'
    ##  36  X7 no trailing characters      - 'epa-http.csv'
    ## ... ... ...................... ...... ..............
    ## See problems(...) for more details.

``` r
#colocamos valores por defecto a campos vacios 
dataset$X6[is.na(dataset$X6)] <- 0
dataset$X7[is.na(dataset$X7)] <- 0

# Cambiar nombres de las columnas
colnames(dataset) <- c("site", "Hora", "Metodo", "Endpoint", "Protocolo", "Respuesta http", "bytes")
#eliminar comillas doble
dataset$Metodo <- str_replace_all(dataset$Metodo, '"', "") 

# Función para determinar la hora con mayor volumen de peticiones "GET"
hora_mayor_volumen_get <- function(dataset) {
  
  
  # Filtrar solo las peticiones de tipo "GET"
  peticiones_get <- dataset %>% 
    filter(Metodo == "GET")
  
  # Extraer la hora de la columna Hora (formato [HH:MM:SS])
  peticiones_get$Hora <- str_sub(peticiones_get$Hora, 5, 6)
  
  # Contar la cantidad de peticiones por hora
  conteo_horas <- peticiones_get %>%
    group_by(Hora) %>%
    summarise(Volumen = n()) %>%
    arrange(desc(Volumen)) %>%
    slice(1)  # Selecciona el primer registro, que es el de mayor volumen
  
  # Devolver solo el registro con la hora y el volumen correspondiente
  return(conteo_horas)
  
  
}

hora<-hora_mayor_volumen_get(dataset)
```
