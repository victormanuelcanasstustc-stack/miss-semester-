# Evidencia de aplicación de TDD

## Proyecto utilizado
Proyecto de búsqueda A* de la actividad 8.

## Práctica aplicada
Desarrollo guiado por pruebas (TDD).

### 1. Fase RED
Se creó primero una prueba llamada `test_astar_laberinto_vacio`, que verifica que el algoritmo A* genere un `ValueError` cuando recibe un laberinto vacío.

Al ejecutar las pruebas, cuatro pruebas anteriores pasaron y la nueva prueba falló porque el programa generó un `IndexError`.

Esto permitió identificar un problema real en la validación de los datos de entrada.

### 2. Fase GREEN
Se modificó la función `astar()` en `dia08/proyecto_ia/astar.py` para comprobar si el laberinto está vacío antes de acceder a sus dimensiones.

Se agregó una validación que genera un `ValueError` con un mensaje claro.

### 3. Resultado final
Se ejecutó nuevamente el conjunto de pruebas:

- Total de pruebas: 5.
- Pruebas exitosas: 5.
- Pruebas fallidas: 0.
- Resultado: OK.

### 4. Aprendizaje
Esta práctica demuestra la utilidad de escribir pruebas antes de modificar el código. La prueba permitió detectar un error, definir el comportamiento esperado y comprobar que la corrección funcionara sin dañar las funcionalidades anteriores.