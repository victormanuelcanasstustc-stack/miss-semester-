import time

def analizar_archivo(ruta):
    inicio = time.perf_counter()

    palabras = []

    with open(ruta, "r", encoding="utf-8") as archivo:
        for linea in archivo:
            for palabra in linea.split():
                if palabra not in palabras:
                    palabras.append(palabra)

    frecuencias = {}

    with open(ruta, "r", encoding="utf-8") as archivo:
        for linea in archivo:
            for palabra in linea.split():
                if palabra in palabras:
                    frecuencias[palabra] = frecuencias.get(palabra, 0) + 1

    duracion = time.perf_counter() - inicio

    print("Análisis terminado")
    print(f"Palabras diferentes: {len(palabras)}")
    print(f"Frecuencias: {frecuencias}")
    print(f"Tiempo total: {duracion:.4f} segundos")


if __name__ == "__main__":
    analizar_archivo("dia05/datos.txt")
