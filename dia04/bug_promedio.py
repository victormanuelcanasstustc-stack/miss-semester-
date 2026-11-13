import logging

logging.basicConfig(level=logging.DEBUG, format="%(levelname)s: %(message)s")


def calcular_promedio(notas):
    logging.debug("Iniciando el cálculo del promedio")

    if not notas:
        logging.warning("La lista de notas está vacía")
        raise ValueError("No se puede calcular un promedio sin notas")

    total = sum(notas)
    cantidad = len(notas)

    logging.info("Se recibieron %s notas", cantidad)

    promedio = total / cantidad

    logging.debug("Promedio calculado correctamente")
    return promedio


notas = []

try:
    resultado = calcular_promedio(notas)
    print(f"El promedio es: {resultado}")
except ValueError:
    logging.error("No fue posible calcular el promedio")
