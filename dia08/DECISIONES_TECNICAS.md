# Decisiones técnicas del proyecto de Inteligencia Artificial

## 1. Organización del proyecto

El proyecto se divide en dos componentes principales: Connect 4 y búsqueda A*. Esta separación permite mantener cada algoritmo en su propio módulo y facilitar su comprensión y mantenimiento.

## 2. Decisiones en Connect 4

- **Representación del tablero:** se utiliza un arreglo de NumPy de 6 filas y 7 columnas. Esta estructura permite representar las posiciones del juego mediante valores numéricos.
- **Detección de victorias:** se revisan grupos de cuatro posiciones consecutivas en dirección horizontal, vertical y diagonal.
- **Evaluación heurística:** se asignan puntuaciones a grupos de cuatro posiciones para valorar las oportunidades de cada jugador. También se considera la columna central del tablero.
- **Minimax:** se utiliza para evaluar posibles movimientos en un juego de dos participantes con objetivos opuestos.
- **Poda Alfa-Beta:** permite descartar ramas que no necesitan seguir evaluándose durante la búsqueda, conservando el resultado de Minimax.

## 3. Decisiones en búsqueda A*

- **Cola de prioridad:** se utiliza `heapq` para organizar los nodos pendientes según su costo estimado.
- **Función de evaluación:** se combina el costo acumulado `g` con la heurística `h`, mediante la expresión `f = g + h`.
- **Movimientos:** el algoritmo permite desplazamientos en cuatro direcciones: arriba, abajo, izquierda y derecha.
- **Obstáculos:** las posiciones con valor `1` se consideran bloqueadas y no se incluyen en la ruta.
- **Heurísticas:** se implementaron Manhattan y Euclidiana para estimar la distancia hasta el objetivo.
- **Reconstrucción de rutas:** se conserva el nodo anterior de cada posición para reconstruir el camino encontrado.
- **Casos especiales:** se genera un error si el laberinto está vacío y se devuelve `None` cuando no se encuentra una ruta.

## 4. Limitaciones identificadas

La búsqueda A* trabaja con movimientos ortogonales y un costo uniforme por movimiento. No contempla desplazamientos diagonales.

Además, el punto de entrada principal del proyecto muestra información sobre los componentes y algoritmos cargados. No inicia una partida interactiva de Connect 4 ni presenta una ruta de A*.

## 5. Justificación general

Estas decisiones buscan mantener una implementación organizada y comprensible, utilizar estructuras apropiadas para cada algoritmo y facilitar las pruebas. La separación por módulos también permite modificar o ampliar un componente sin tener que reorganizar todo el proyecto.