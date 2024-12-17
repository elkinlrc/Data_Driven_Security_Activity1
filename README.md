# **Análisis de Logs de Servidor HTTP con R**

Este proyecto tiene como objetivo realizar un análisis de registros HTTP (logs) de un servidor usando **R**. A lo largo de la clase, hemos explorado diversas técnicas para cargar, limpiar y analizar datos, especialmente centrados en archivos de log con formato estructurado.

---

## **Descripción del Proyecto**

- **Archivo de entrada**: `epa-http.csv`  
  Este archivo contiene registros de un servidor HTTP donde cada línea incluye información como:  
  - Dirección IP del cliente  
  - Hora de la solicitud  
  - Método HTTP  
  - Endpoint solicitado  
  - Protocolo HTTP  
  - Código de respuesta  
  - Tamaño en bytes de los datos transferidos  

---

## **Objetivos del Proyecto**

1. **Lectura y Exploración de Datos**  
   - Cargar archivos de texto utilizando `readr` y tratar separadores complejos.  
   - Identificar y manejar valores nulos (`NA`) en el dataset.  
   - Validar las dimensiones del dataset (número de filas y columnas).  

2. **Análisis Estadístico Básico**  
   - Calcular el valor medio de la columna **Bytes** (tamaño de respuesta).  
   - Identificar filas problemáticas que no cumplen con el formato esperado.  

3. **Limpieza de Datos**  
   - Rellenar valores faltantes con valores predeterminados (como 0 o "xx").  

---

## **Herramientas y Librerías**

El proyecto se desarrolló utilizando las siguientes herramientas:  

- **Lenguaje**: [R](https://cran.r-project.org/)  
- **Librerías principales**:  
  - `readr`: Para leer archivos de texto con formatos personalizados.  
  - `stringr`: Para trabajar con strings en R.  


---
