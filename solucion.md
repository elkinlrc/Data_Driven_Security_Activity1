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

## 1. Data Science

A continuación, se clasifica cada pregunta según su tipo (descriptiva,
exploratoria, inferencial, predictiva o causal) y se justifica
brevemente la elección.

------------------------------------------------------------------------

### **Pregunta 1**

1.  **Enunciado:**  
    Dado un registro de vehículos que circulan por una autopista,
    disponemos de su marca y modelo, país de matriculación, y tipo de
    vehículo (por número de ruedas). Con tal de ajustar precios de los
    peajes:  

    - ¿Cuántos vehículos tenemos por tipo?  
    - ¿Cuál es el tipo más frecuente?  
    - ¿De qué países tenemos más vehículos?

    **Clasificación:**  
    **Descriptiva**

    **Justificación:**  
    Esta pregunta busca resumir el conjunto de datos mediante
    estadísticas básicas, como conteos y frecuencias, sin realizar
    inferencias ni predicciones.

------------------------------------------------------------------------

2.  **Enunciado:**  
    Dado un registro de visualizaciones de un servicio de
    video-on-demand, donde disponemos de los datos del usuario, de la
    película seleccionada, fecha de visualización y categoría de la
    película, queremos saber:  

    - ¿Hay alguna preferencia en cuanto a género literario según los
      usuarios y su rango de edad?

    **Clasificación:**  
    **Exploratoria**

    **Justificación:**  
    Se busca identificar relaciones o patrones entre el rango de edad de
    los usuarios y sus preferencias de género literario. No se intenta
    predecir ni generalizar resultados.

------------------------------------------------------------------------

3.  **Enunciado:**  
    Dado un registro de peticiones a un sitio web, vemos que las
    peticiones que provienen de una red de telefonía concreta
    acostumbran a ser incorrectas y provocarnos errores de servicio:  

    - ¿Podemos determinar si en el futuro, los próximos mensajes de esa
      red seguirán dando problemas?  
    - ¿Hemos notado el mismo efecto en otras redes de telefonía?

    **Clasificación:**  **Predictiva**

    **Justificación:**  Ésta pregunta busca predecir si futuros mensajes
    de una red específica seguirán generando errores y determinar si el
    patrón se repite en otras redes, basándose en datos históricos, por
    lo tanto, se trata una predicción.

------------------------------------------------------------------------

4.  **Enunciado:**  
    Dado los registros de usuarios de un servicio de compras por
    internet, los usuarios pueden agruparse por preferencias de
    productos comprados. Queremos saber:  

    - ¿Es posible que, dado un usuario al azar y según su historial,
      pueda ser directamente asignado a uno o diversos grupos?

    **Clasificación:**  
    **Inferencial**

    **Justificación:**  
    Ésta pregunta busca generalizar un patrón del conjunto de datos
    existente para asignar un usuario nuevo a un grupo, utilizando su
    historial de compras. Se trata de inferir en la clasificación del
    usuario.

### **Pregunta 2**

Considera el siguiente escenario: Sabemos que un usuario de nuestra red
empresarial ha estado usando esta para fines no relacionados con el
trabajo, como por ejemplo tener un servicio web no autorizado abierto a
la red (otros usuarios tienen servicios web activados y autorizados). No
queremos tener que rastrear los puertos de cada PC, y sabemos que la
actividad puede haber cesado. Pero podemos acceder a los registros de
conexiones TCP de cada máquina de cada trabajador (hacia donde abre
conexión un PC concreto). Sabemos que nuestros clientes se conectan
desde lugares remotos de forma legítima, como parte de nuestro negocio,
y que un trabajador puede haber habilitado temporalmente servicios de
prueba. Nuestro objetivo es reducir lo posible la lista de posibles
culpables, con tal de explicarles que por favor no expongan nuestros
sistemas sin permiso de los operadores o la dirección. Explica con
detalle cómo se podría proceder al análisis y resolución del problema
mediante Data Science, indicando de donde se obtendrían los datos, qué
tratamiento deberían recibir, qué preguntas hacerse para resolver el
problema, qué datos y gráficos se obtendrían, y cómo se comunicarían
estos.

#### Análisis de Conexiones TCP para Identificar Actividad No Autorizada

###### **Qué podemos hacer para resolver el problema**

Suponiendo que tenemos un gran archivo con todas las conexiones TCP que
realizan las computadoras de los empleados. Queremos descubrir si
alguien habilitó un servicio web no autorizado. Esto es lo que haríamos
paso a paso:

------------------------------------------------------------------------

###### **1. Reunir los datos**

Primero, necesitamos los registros de conexiones de cada computadora.
Estos registros nos dirán: - A qué direcciones IP y puertos se
conectaron. - Qué hora fue la conexión. - Cuánto tiempo duró y cuántos
datos se enviaron o recibieron.

También necesitamos: - Una lista de servicios y puertos autorizados en
la empresa. - Información de las IPs externas conocidas y legítimas.

------------------------------------------------------------------------

###### **2. ¿Qué hacemos con esos datos?**

Antes de analizarlos, organizamos la información para que sea más fácil
trabajar: 1. **Limpiar los datos**: Quitamos conexiones duplicadas o
registros incompletos. 2. **Categorizar las conexiones**: - ¿Son locales
o externas? - ¿Van a IPs conocidas o extrañas? - ¿Usan puertos normales
o inusuales?

3.  **Buscar patrones normales**: Analizamos cómo son las conexiones
    legítimas (días, horas, lugares comunes).

------------------------------------------------------------------------

###### **3. Preguntas clave**

Para descubrir algo sospechoso, nos hacemos preguntas como: - ¿Alguna
computadora está enviando datos a lugares donde normalmente no se
conecta? - ¿Alguien está usando puertos que no deberían estar
abiertos? - ¿Las conexiones extrañas ocurren fuera del horario
laboral? - ¿Qué computadoras tienen patrones diferentes al resto?

------------------------------------------------------------------------

###### **4. El análisis**

Aquí es donde se pone interesante. Buscamos las respuestas a esas
preguntas: - Revisamos qué computadoras están conectándose a IPs
desconocidas o usando puertos raros. - Comparamos a los empleados entre
sí para ver si alguien destaca por un comportamiento diferente. - Si
encontramos algo raro, hacemos gráficos para entenderlo mejor: - Por
ejemplo, un mapa que muestra hacia dónde van las conexiones. - Gráficos
de las horas con más actividad para ver si algo ocurrió fuera de lo
normal.

------------------------------------------------------------------------

###### **5. Reducir la lista de posibles culpables**

Después de todo este análisis, terminamos con una lista pequeña de
computadoras que se comportaron de forma extraña. Por ejemplo: - Una
computadora que usó un puerto de un servidor web no autorizado. - Otra
que tuvo muchas conexiones externas sospechosas durante la noche.

Esto nos permite hablar solo con las personas involucradas y explicarles
la importancia de no exponer servicios sin autorización.

------------------------------------------------------------------------

###### **6. ¿Cómo lo compartimos?**

1.  **A la dirección**: Preparamos un informe con los hallazgos,
    incluyendo gráficos y datos claros. Por ejemplo:
    - “La computadora X tuvo conexiones sospechosas hacia estas IPs en
      horarios no laborales.”
2.  **A los empleados**: Enviamos un mensaje amable recordándoles las
    políticas de seguridad y por qué no deberían habilitar servicios no
    autorizados.

------------------------------------------------------------------------

###### **Resultado esperado**

Con este proceso: - Sabremos quién habilitó un servicio web sin
permiso. - Mejoraremos la seguridad al identificar posibles
vulnerabilidades. - Reduciremos el tiempo dedicado a buscar culpables y
evitaremos problemas futuros.

En pocas palabras, usamos los datos para encontrar patrones, identificar
lo sospechoso y tomar decisiones rápidas

## 2. Introducción a R

base para los ejercicios: se creo un archivo central que se encarga de
de procesar el dataset.

``` r
# procesar_dataset.R

library(readr)
library(stringr)
library(dplyr)

procesar_dataset <- function() {
  # Leer el archivo CSV
  dataset <- suppressWarnings(read_table(
    "epa-http.csv",
    col_names = FALSE,
    na = c("", "NA", "NULL"),
    col_types = cols(
      X1 = col_character(),
      X2 = col_character(),
      X3 = col_character(),
      X4 = col_character(),
      X5 = col_character(),
      X6 = col_integer(),
      X7 = col_integer()
    )
  ))
  
  # Reemplazar valores NA por 0
  dataset$X6[is.na(dataset$X6)] <- 0
  dataset$X7[is.na(dataset$X7)] <- 0
  
  # Cambiar nombres de columnas
  colnames(dataset) <- c("site", "Timestamp", "Metodo", "Endpoint", "Protocolo", "Respuesta http", "bytes")
  
  # Eliminar comillas dobles en la columna Método
  dataset$Metodo <- str_replace_all(dataset$Metodo, '"', "")
  
  return(dataset)
}
```

### Ejercicio 1

Una vez cargado el Dataset a analizar, comprobando que se cargan las
IPs, el Timestamp, la Petición (Tipo, URL y Protocolo), Código de
respuesta, y Bytes de reply. 1. Cuales son las dimensiones del dataset
cargado (número de filas y columnas) 2.Valor medio de la columna Bytes

**Respuesta: Son 7 columnas y 47748 filas. Y la media de la columna
Bytes es de 6531.45. Esto se almacena en las variables n_filas,
n_columnas y media_bytes respectivamente.**

``` r
knitr::opts_chunk$set(echo = TRUE, message = FALSE, warning = FALSE)
source("procesar_dataset.R")

#cargamos la librerias que vamos a usar
library(readr)
library(stringr)
library(dplyr)

dataset <- procesar_dataset()
# Leer el archivo CSV donde los separadores son espacios

# Obtener el número de filas y columnas
n_filas <- nrow(dataset)
n_columnas <- ncol(dataset)

dimensiones <- dim(dataset)
media_bytes <- mean(dataset$bytes, na.rm = TRUE)
```

### Ejercicio 2

De las diferentes IPs de origen accediendo al servidor, ¿cuantas
pertenecen a una IP claramente educativa (que contenga “.edu”)?

**Respuesta: 6524 URLs pertenecen a IPs educativas .edu. Esto se
almacena en la variable total_paginas_edu.**

``` r
knitr::opts_chunk$set(echo = TRUE, message = FALSE, warning = FALSE)
source("procesar_dataset.R")

#cargamos la librerias que vamos a usar
library(readr)
library(stringr)
library(dplyr)

dataset <- procesar_dataset()

#Codigo pregunta 2 Cantidad de ips o filas con .edu
# Obtener todos los IP educativos .edu 
data_edu <- dataset[grepl("\\.edu", dataset$site), ]
# Contar la cantidad de filas (páginas .edu)
total_paginas_edu <- nrow(data_edu)
```

### Ejercicio 3

De todas las peticiones recibidas por el servidor cual es la hora en la
que hay mayor volumen de peticiones HTTP de tipo “GET”?

**Respuesta: La hora 14 es la hora que tiene mayor volumen. El volumen
es 4546 .**

``` r
knitr::opts_chunk$set(echo = TRUE, message = FALSE, warning = FALSE)
source("procesar_dataset.R")

#cargamos la librerias que vamos a usar
library(readr)
library(stringr)
library(dplyr)

dataset <- procesar_dataset()

# Función para determinar la hora con mayor volumen de peticiones "GET"
hora_mayor_volumen_get <- function(dataset) {
  
  
  # Filtrar solo las peticiones de tipo "GET"
  peticiones_get <- dataset %>% 
    filter(Metodo == "GET")
  
  # Extraer la hora de la columna Hora (formato [HH:MM:SS])
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

hora<-hora_mayor_volumen_get(dataset)
```

### Ejercicio 4

De las peticiones hechas por instituciones educativas (.edu), ¿Cuantos
bytes en total se han transmitido, en peticiones de descarga de ficheros
de texto “.txt”?

**Respuesta: Un total de 106806 bytes fueron transmitidos en las 3
peticiones de descarga que hay de ficheros .txt. Esto se almacena en la
variable total_bytes.**

``` r
knitr::opts_chunk$set(echo = TRUE, message = FALSE, warning = FALSE)
source("procesar_dataset.R")

#cargamos la librerias que vamos a usar
library(readr)
library(stringr)
library(dplyr)

dataset <- procesar_dataset()

#Codigo pregunta 4 Cantidad de bytes transmitidos en .edu de archivos .txt
# Obtener las filas transmitidos como .txt en las paginas .edu 
data_txt_edu <- dataset[grepl("\\.edu", dataset$site) & grepl("\\.txt$", dataset$Endpoint), ]
# Calcular la suma de la columna 'bytes'
total_bytes <- sum(data_txt_edu$bytes, na.rm = TRUE)
```

### Ejercicio 5

Si separamos la petición en 3 partes (Tipo, URL, Protocolo), usando
str_split y el separador ” ” (espacio), ¿cuantas peticiones buscan
directamente la URL = “/”?

**Respuesta: Un total de 2382 peticiones buscan la URL “/”. Esto se
almacena en la variable total_peticiones.**

``` r
knitr::opts_chunk$set(echo = TRUE, message = FALSE, warning = FALSE)
source("procesar_dataset.R")

#cargamos la librerias que vamos a usar
library(readr)
library(stringr)
library(dplyr)

dataset <- procesar_dataset()
contar_peticiones_url <- function(dataset, url_buscada = "/") {
  # Filtrar las filas donde el Endpoint coincide con la URL buscada
  conteo <- dataset %>%
    filter(Endpoint == url_buscada) %>%
    summarise(Total = n())
  
  # Retornar el total
  return(conteo$Total)
}
total_peticiones <- contar_peticiones_url(dataset)
```

### Ejercicio 6

Aprovechando que hemos separado la petición en 3 partes (Tipo, URL,
Protocolo) ¿Cuantas peticiones NO tienen como protocolo “HTTP/0.2”?

**Respuesta: Un total de 1 peticion tiene como protocolo el HTTP/0.2.
Esto se almacena en la variable cantidad_no_http_02**

``` r
knitr::opts_chunk$set(echo = TRUE, message = FALSE, warning = FALSE)
source("procesar_dataset.R")

#cargamos la librerias que vamos a usar
library(readr)
library(stringr)
library(dplyr)

dataset <- procesar_dataset()

#Codigo pregunta 6 peticiones que no tienen como protocolo HTTP/0.2

# Eliminar comillas adicionales en la columna Protocolo
dataset$Protocolo <- gsub('"', '', dataset$Protocolo)
# Filtrar las filas que NO tienen el protocolo "HTTP/0.2"
no_http_02 <- subset(dataset, Protocolo != "HTTP/0.2")
# Contar el número de filas que cumplen con esta condición
cantidad_no_http_02 <- nrow(no_http_02)
```
