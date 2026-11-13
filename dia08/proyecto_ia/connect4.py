import numpy as np
import math
import random

FILAS = 6
COLUMNAS = 7

VACIO = 0
JUGADOR = 1
IA = 2

VENTANA = 4


def crear_tablero():
    return np.zeros((FILAS, COLUMNAS))


def poner_ficha(tablero, fila, columna, ficha):
    tablero[fila][columna] = ficha


def columna_valida(tablero, columna):
    return tablero[FILAS - 1][columna] == 0


def obtener_fila(tablero, columna):
    for f in range(FILAS):
        if tablero[f][columna] == 0:
            return f


def imprimir_tablero(tablero):
    print(np.flip(tablero, 0))


def victoria(tablero, ficha):

    for c in range(COLUMNAS - 3):
        for f in range(FILAS):
            if (
                tablero[f][c] == ficha
                and tablero[f][c + 1] == ficha
                and tablero[f][c + 2] == ficha
                and tablero[f][c + 3] == ficha
            ):
                return True

    for c in range(COLUMNAS):
        for f in range(FILAS - 3):
            if (
                tablero[f][c] == ficha
                and tablero[f + 1][c] == ficha
                and tablero[f + 2][c] == ficha
                and tablero[f + 3][c] == ficha
            ):
                return True

    for c in range(COLUMNAS - 3):
        for f in range(FILAS - 3):
            if (
                tablero[f][c] == ficha
                and tablero[f + 1][c + 1] == ficha
                and tablero[f + 2][c + 2] == ficha
                and tablero[f + 3][c + 3] == ficha
            ):
                return True

    for c in range(COLUMNAS - 3):
        for f in range(3, FILAS):
            if (
                tablero[f][c] == ficha
                and tablero[f - 1][c + 1] == ficha
                and tablero[f - 2][c + 2] == ficha
                and tablero[f - 3][c + 3] == ficha
            ):
                return True

    return False


def evaluar_ventana(ventana, ficha):

    puntuacion = 0

    rival = JUGADOR if ficha == IA else IA

    if ventana.count(ficha) == 4:
        puntuacion += 100

    elif ventana.count(ficha) == 3 and ventana.count(VACIO) == 1:
        puntuacion += 10

    elif ventana.count(ficha) == 2 and ventana.count(VACIO) == 2:
        puntuacion += 5

    if ventana.count(rival) == 3 and ventana.count(VACIO) == 1:
        puntuacion -= 8

    return puntuacion


def evaluar_tablero(tablero, ficha):

    puntuacion = 0

    centro = [int(i) for i in list(tablero[:, COLUMNAS // 2])]
    puntuacion += centro.count(ficha) * 6

    for f in range(FILAS):

        fila = [int(i) for i in list(tablero[f, :])]

        for c in range(COLUMNAS - 3):
            ventana = fila[c:c + 4]
            puntuacion += evaluar_ventana(ventana, ficha)

    for c in range(COLUMNAS):

        columna = [int(i) for i in list(tablero[:, c])]

        for f in range(FILAS - 3):
            ventana = columna[f:f + 4]
            puntuacion += evaluar_ventana(ventana, ficha)

    return puntuacion


def movimientos_validos(tablero):

    validos = []

    for c in range(COLUMNAS):
        if columna_valida(tablero, c):
            validos.append(c)

    return sorted(
        validos,
        key=lambda x: abs(COLUMNAS // 2 - x)
    )


def minimax(tablero, profundidad, alpha, beta, maximizando):

    validos = movimientos_validos(tablero)

    terminal = (
        victoria(tablero, JUGADOR)
        or victoria(tablero, IA)
        or len(validos) == 0
    )

    if profundidad == 0 or terminal:

        if terminal:

            if victoria(tablero, IA):
                return None, 1000000

            elif victoria(tablero, JUGADOR):
                return None, -1000000

            else:
                return None, 0

        return None, evaluar_tablero(tablero, IA)

    if maximizando:

        valor = -math.inf
        mejor_columna = random.choice(validos)

        for col in validos:

            fila = obtener_fila(tablero, col)

            copia = tablero.copy()

            poner_ficha(copia, fila, col, IA)

            nuevo_valor = minimax(
                copia,
                profundidad - 1,
                alpha,
                beta,
                False
            )[1]

            if nuevo_valor > valor:
                valor = nuevo_valor
                mejor_columna = col

            alpha = max(alpha, valor)

            if alpha >= beta:
                break

        return mejor_columna, valor

    else:

        valor = math.inf
        mejor_columna = random.choice(validos)

        for col in validos:

            fila = obtener_fila(tablero, col)

            copia = tablero.copy()

            poner_ficha(copia, fila, col, JUGADOR)

            nuevo_valor = minimax(
                copia,
                profundidad - 1,
                alpha,
                beta,
                True
            )[1]

            if nuevo_valor < valor:
                valor = nuevo_valor
                mejor_columna = col

            beta = min(beta, valor)

            if alpha >= beta:
                break

        return mejor_columna, valor


if __name__ == "__main__":

    tablero = crear_tablero()

    imprimir_tablero(tablero)

    print("\nConnect 4 cargado correctamente.")
    print("Minimax + Poda Alfa-Beta listos.")