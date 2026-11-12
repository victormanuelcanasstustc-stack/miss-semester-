def calcular_promedio(notas):
    total = sum(notas)
    cantidad = len(notas)
    promedio = total / cantidad
    resultado = {"total": total, "cantidad": cantidad, "promedio": promedio}
    return resultado


notas = [4.5, 4.8, 4.2, 5.0]
resultado = calcular_promedio(notas)
print(resultado)
