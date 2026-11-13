def calcular_promedio(notas):
    if not notas:
        return 0
    return sum(notas) / len(notas)


if __name__ == "__main__":
    print(calcular_promedio([4.0, 5.0]))
