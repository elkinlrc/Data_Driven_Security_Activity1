---
editor_options: 
  markdown: 
    wrap: 72
---
__ Análisis de Datos y Resolución de Casos Prácticos en Data Driven
Security __



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
+ _Descriptiva_

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
_Exploratoria_

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
