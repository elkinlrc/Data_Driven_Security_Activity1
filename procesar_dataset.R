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
