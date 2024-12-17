---
editor_options:
  markdown:
    wrap: 72
---

\_\_ Análisis de Datos y Resolución de Casos Prácticos en Data Driven
Security \_\_

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

**Enunciado:**\
Dado un registro de vehículos que circulan por una autopista, disponemos
de su marca y modelo, país de matriculación, y tipo de vehículo (por
número de ruedas). Con tal de ajustar precios de los peajes:\
- ¿Cuántos vehículos tenemos por tipo?\
- ¿Cuál es el tipo más frecuente?\
- ¿De qué países tenemos más vehículos?

**Clasificación:**\
+ *Descriptiva*

**Justificación:**\
En este ejercicio se están contando cosas para resultados estadísticos:
cuántos hay por tipo, cuál se repite más y de dónde vienen. Es
básicamente describir el conjunto de datos con números.

------------------------------------------------------------------------

### **Pregunta 2**

**Enunciado:**\
Dado un registro de visualizaciones de un servicio de video-on-demand,
donde disponemos de los datos del usuario, de la película seleccionada,
fecha de visualización y categoría de la película, queremos saber:\
- ¿Hay alguna preferencia en cuanto a género literario según los
usuarios y su rango de edad?

**Clasificación:**\
*Exploratoria*

**Justificación:**\
EN este ejercicio busca identificar relaciones o patrones entre el rango
de edad de los usuarios y sus preferencias de género literario. No se
intenta predecir ni generalizar resultados estadisticos. por lo tanto,
es de tipo exploratoria

------------------------------------------------------------------------

### **Pregunta 3**

**Enunciado:**\
Dado un registro de peticiones a un sitio web, vemos que las peticiones
que provienen de una red de telefonía concreta acostumbran a ser
incorrectas y provocarnos errores de servicio:\
- ¿Podemos determinar si en el futuro, los próximos mensajes de esa red
seguirán dando problemas?\
- ¿Hemos notado el mismo efecto en otras redes de telefonía?

**Clasificación:**

**Justificación:**

------------------------------------------------------------------------

### **Pregunta 4**

**Enunciado:**\
Dado los registros de usuarios de un servicio de compras por internet,
los usuarios pueden agruparse por preferencias de productos comprados.
Queremos saber:\
- ¿Es posible que, dado un usuario al azar y según su historial, pueda
ser directamente asignado a uno o diversos grupos?

**Clasificación:**

**Justificación:**

### **2. Introducción a R**

#### ¿Cuáles son las dimensiones del dataset cargado?  
- **Número de filas**: `47748`  
- **Número de columnas**: `7`  

#### Valor medio de la columna **Bytes**  
- El peso medio de la columna **Bytes** es: `6531.45660551213`  

---

### **Código en R**  
```
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
#colocamos valores por defecto a campos vacios 
dataset$X6[is.na(dataset$X6)] <- 0
dataset$X7[is.na(dataset$X7)] <- 0
# Cambiar nombres de las columnas
colnames(dataset) <- c("site", "Hora", "Metodo", "Endpoint", "Protocolo", "Respuesta http", "bytes")

# Obtener el número de filas y columnas
n_filas <- nrow(dataset)
n_columnas <- ncol(dataset)

dimensiones <- dim(dataset)
media_bytes <- mean(dataset$bytes, na.rm = TRUE)

#aqui usamos dos formas de como obtener las dimensiones de un dataset 
cat("dimensión del data set",dimensiones, "\n")
cat("Número de filas:", n_filas, "\n")
cat("Número de columnas:", n_columnas, "\n")
cat("Valor medio de la columna 'bytes':", media_bytes, "\n")


```

