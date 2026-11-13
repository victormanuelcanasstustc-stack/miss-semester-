import time
from collections import Counter


def analizar_archivo(ruta):
    inicio = time.perf_counter()

    frecuencias = Counter()

    with open(ruta, "r", encoding="utf-8") as archivo:
        for linea in archivo:
            frecuencias.update(linea.split())

    duracion = time.perf_counter() - inicio

    print("Análisis optimizado terminado")
    print(f"Palabras diferentes: {len(frecuencias)}")
    print(f"Total de palabras procesadas: {sum(frecuencias.values())}")
    print(f"Tiempo total: {duracion:.4f} segundos")


if __name__ == "__main__":
    analizar_archivo("dia05/datos.txt")
