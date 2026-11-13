# Actividad 9 – Agentic Coding

## Objetivo

Analizar las prácticas de programación con agentes de inteligencia artificial, compararlas con mi agente de revisión de código y aplicar una mejora a un proyecto existente.

## Contenido

- `tabla_contraste.md`: comparación de las prácticas con las funcionalidades de mi agente.
- `analisis_tres_practicas.md`: análisis de las tres prácticas que más tiempo habrían ahorrado durante el desarrollo.
- `evidencias/resultado_practica.md`: registro de la aplicación de TDD.

## Aplicación práctica

Se aplicó desarrollo guiado por pruebas (TDD) al proyecto de búsqueda A* de la actividad 8.

Primero se escribió una prueba para comprobar el comportamiento del algoritmo ante un laberinto vacío. La prueba falló inicialmente porque el programa generaba un `IndexError`.

Después se corrigió la función `astar()` para validar la entrada y generar un `ValueError` cuando el laberinto está vacío.

Finalmente, se ejecutaron cinco pruebas y todas terminaron correctamente.

## Resultado

Se aplicó una mejora verificable mediante pruebas automatizadas. Los cambios en el código y las pruebas se registrarán en un commit de Git.

## Nota

La tabla de contraste debe revisarse con los apuntes de la clase completa para incorporar todas las recomendaciones específicas del instructor.