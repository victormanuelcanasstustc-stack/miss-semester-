from .connect4 import crear_tablero, imprimir_tablero
from .astar import manhattan, euclidiana, astar


def main():
    print("===================================")
    print("PROYECTO DE INTELIGENCIA ARTIFICIAL")
    print("Minimax + Poda Alfa-Beta + A*")
    print("===================================")

    print("\nMódulo Connect 4 cargado correctamente.")
    print("Módulo A* cargado correctamente.")

    print("\nCaracterísticas implementadas:")
    print("- Juego de suma cero: Connect 4")
    print("- Algoritmo Minimax")
    print("- Poda Alfa-Beta")
    print("- Ordenamiento de movimientos")
    print("- Búsqueda A*")
    print("- Heurística Manhattan")
    print("- Heurística Euclidiana")

    print("\nProyecto inicializado correctamente.")


if __name__ == "__main__":
    main()
