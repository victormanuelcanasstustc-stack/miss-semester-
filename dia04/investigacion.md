# Investigación del error — Cálculo del promedio

## Problema encontrado

El programa genera ZeroDivisionError cuando recibe una lista vacía.

## Hipótesis y experimentos

### Paso 1. Inspección con el depurador
Se colocó un breakpoint en la línea donde se calcula el promedio.

Se observaron estas variables:
- notas = []
- total = 0
- cantidad = 0

### Paso 2. Primera hipótesis
Hipótesis: el error puede estar relacionado con la cantidad de notas recibidas.

Experimento: ejecutar el programa con dos notas: [4.5, 4.0].

Resultado: el programa calculó correctamente 4.25.

### Paso 3. Segunda hipótesis
Hipótesis: el programa también puede funcionar con una sola nota.

Experimento: ejecutar con [5.0].

Resultado: el programa calculó correctamente 5.0.

### Paso 4. Hipótesis confirmada
Los experimentos indican que el problema ocurre cuando la lista está vacía y la cantidad de notas es cero.

Se descarta que la suma o el cálculo del promedio fallen con listas que contienen datos.

## Próxima hipótesis

El programa debe validar que la lista tenga elementos antes de realizar la división. Se implementará una validación para evitar dividir entre cero.

## Solución aplicada

Se agregó una validación para comprobar si la lista está vacía antes de calcular el promedio. Si no hay notas, se registra una advertencia y se evita la división entre cero.

## Hipótesis descartada

Se descartó que el problema estuviera en la función sum() o en el manejo de números decimales, porque las pruebas con dos notas y con una sola nota produjeron resultados correctos.

## Uso del depurador y los registros

El depurador es útil cuando se necesita analizar paso a paso un programa, revisar variables y encontrar el punto exacto donde ocurre un error.

Los registros son más útiles cuando el programa se ejecuta en otro equipo, en producción o durante largos periodos y no es posible detenerlo para usar un depurador.

Por ejemplo, en un proceso automático que calcula promedios diariamente, los registros permiten identificar si recibió una lista vacía sin tener que detener su ejecución.

## Conclusión

La actividad permitió identificar un error real mediante breakpoints, inspeccionar variables, comprobar hipótesis y corregir el problema. También se implementaron registros estructurados con los niveles DEBUG, INFO, WARNING y ERROR.