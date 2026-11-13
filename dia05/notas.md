# Actividad 5 — Medir antes de optimizar

## 1. Predicción inicial (escrita antes del perfilamiento)

Creo que la mayor parte de la lentitud estará en el procesamiento repetido de las líneas del archivo. Mi hipótesis es que utilizar búsquedas repetidas dentro de una lista para contar palabras hará que el programa tarde más cuando aumente la cantidad de datos.

Predigo que la operación de búsqueda y conteo será el principal cuello de botella.

Esta predicción se conserva sin modificar para compararla con los resultados reales del perfilador.

## 2. Resultados del perfilamiento

Se procesaron 100.000 líneas, con un total de 800.000 palabras.

### Primera versión: programa_lento.py

- Tiempo medido por el programa: 1.0334 segundos.
- Tiempo total de cProfile: 1.034 segundos.
- Llamadas a funciones: 1.003.221.
- Tiempo propio de analizar_archivo: 0.889 segundos.

El trabajo más costoso estaba relacionado con las búsquedas repetidas de palabras dentro de una lista. Estas operaciones no aparecen como funciones independientes en cProfile, por lo que su tiempo queda atribuido a analizar_archivo.

### Segunda versión: programa_optimizado.py

- Tiempo medido por el programa: 0.3192 segundos.
- Tiempo total de cProfile: 0.319 segundos.
- Llamadas a funciones: 601.399.
- Tiempo acumulado de Counter.update: 0.216 segundos.

El conteo mediante Counter permitió evitar las búsquedas repetidas en la lista. El segundo perfilamiento mostró que el trabajo se concentra ahora principalmente en la actualización del contador.

## 3. Comparación entre predicción y resultados reales

La predicción inicial fue acertada en lo esencial. Se esperaba que las búsquedas repetidas dentro de una lista fueran el principal problema.

El perfilador mostró que analizar_archivo concentraba la mayor parte del tiempo en la primera versión. Después de optimizar, el trabajo principal pasó a las operaciones de actualización del contador de palabras.

## 4. Optimización aplicada

Se reemplazó la lista y las búsquedas repetidas por collections.Counter, que permite acumular las frecuencias de las palabras directamente.

## 5. Comparación de tiempos

- Tiempo antes: 1.0334 segundos.
- Tiempo después: 0.3192 segundos.
- Factor de mejora: aproximadamente 3.24 veces.
- Reducción del tiempo: aproximadamente 69.1 %.

Cálculo: 1.0334 / 0.3192 = 3.237.

Las mediciones se realizaron con el mismo archivo de datos y ambos programas se ejecutaron mediante cProfile.

## 6. Conclusión

El ejercicio demuestra que medir antes de optimizar permite identificar el trabajo que realmente consume tiempo. La versión optimizada procesó las mismas 100.000 líneas y obtuvo las mismas 506 palabras diferentes y las 800.000 palabras procesadas, pero redujo considerablemente el tiempo de ejecución.

El segundo perfilamiento confirmó que el cuello de botella cambió: las búsquedas repetidas en listas dejaron de ser necesarias y el tiempo pasó a concentrarse en las operaciones de actualización del contador.
