import heapq
import math


def manhattan(actual, objetivo):
    """
    Calcula la distancia Manhattan entre dos puntos.
    """
    return abs(actual[0] - objetivo[0]) + abs(actual[1] - objetivo[1])


def euclidiana(actual, objetivo):
    """
    Calcula la distancia Euclidiana entre dos puntos.
    """
    return math.sqrt(
        (actual[0] - objetivo[0]) ** 2 +
        (actual[1] - objetivo[1]) ** 2
    )


def reconstruir(camino, actual):
    """
    Reconstruye la ruta desde el objetivo hasta el inicio.
    """

    ruta = []

    while actual in camino:
        ruta.append(actual)
        actual = camino[actual]

    ruta.append(actual)

    ruta.reverse()

    return ruta


def astar(laberinto, inicio, objetivo, heuristica):
    """
    Implementación del algoritmo A*.
    """

    filas = len(laberinto)
    columnas = len(laberinto[0])

    abiertos = []

    heapq.heappush(abiertos, (0, inicio))

    origen = {}

    g = {inicio: 0}

    f = {
        inicio: heuristica(inicio, objetivo)
    }

    while abiertos:

        actual = heapq.heappop(abiertos)[1]

        if actual == objetivo:
            return reconstruir(origen, actual)

        movimientos = [
            (-1, 0),   # arriba
            (1, 0),    # abajo
            (0, -1),   # izquierda
            (0, 1)     # derecha
        ]

        for dx, dy in movimientos:

            vecino = (
                actual[0] + dx,
                actual[1] + dy
            )

            # Verificar límites
            if (
                vecino[0] < 0
                or vecino[0] >= filas
                or vecino[1] < 0
                or vecino[1] >= columnas
            ):
                continue

            # Verificar obstáculos
            if laberinto[vecino[0]][vecino[1]] == 1:
                continue

            nuevo_g = g[actual] + 1

            if vecino not in g or nuevo_g < g[vecino]:

                origen[vecino] = actual

                g[vecino] = nuevo_g

                f[vecino] = (
                    nuevo_g +
                    heuristica(vecino, objetivo)
                )

                heapq.heappush(
                    abiertos,
                    (f[vecino], vecino)
                )

    return None


if __name__ == "__main__":

    print("===================================")
    print("ALGORITMO A*")
    print("Heurísticas Manhattan y Euclidiana")
    print("===================================")

    print("\nMódulo cargado correctamente.")