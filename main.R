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

# Identificar las filas problemáticas, se comento despues de usarse
#esto se uso para identifar errores que me salia en el dataset
#problemas <- problems(dataset)
#print(problemas)
