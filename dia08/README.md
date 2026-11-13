# Proyecto de Inteligencia Artificial

Proyecto académico desarrollado en Python que reúne dos componentes: Connect 4 con Minimax y poda Alfa-Beta, y búsqueda de rutas mediante el algoritmo A*.

## 1. Características

### Connect 4
- Tablero de 6 filas por 7 columnas.
- Detección de victorias horizontales, verticales y diagonales.
- Evaluación de posiciones mediante ventanas de cuatro casillas.
- Algoritmo Minimax.
- Poda Alfa-Beta.
- Ordenamiento de movimientos para priorizar las columnas centrales.

### Búsqueda A*
- Búsqueda de rutas en laberintos representados mediante matrices.
- Movimientos en cuatro direcciones: arriba, abajo, izquierda y derecha.
- Detección de límites y obstáculos.
- Heurísticas Manhattan y Euclidiana.
- Reconstrucción de rutas.
- Validación de laberintos vacíos.

## 2. Requisitos

- Python 3.11 o superior.
- Git.
- NumPy 2.4.6.

## 3. Descargar el proyecto

Clona el repositorio:

```bash
git clone -b actividad7-rama --single-branch https://github.com/victormanuelcanasstustc-stack/miss-semester-.git
```

Entra en la carpeta de la actividad:

```bash
cd miss-semester-/dia08
```

## 4. Crear el entorno virtual

En Windows con Git Bash:

```bash
python -m venv .venv
source .venv/Scripts/activate
```

En Windows con PowerShell:

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
```

## 5. Instalar el proyecto

Actualiza pip e instala el paquete:

```bash
python -m pip install --upgrade pip
python -m pip install .
```

Las dependencias se instalan según la configuración declarada en `pyproject.toml`.

## 6. Ejecutar el proyecto

Ejecuta el comando instalado:

```bash
proyecto-ia
```

También puedes utilizar:

```bash
python -m proyecto_ia
```

Estos comandos muestran un resumen de los componentes y características implementadas.

## 7. Ejecutar las pruebas

Desde la carpeta `dia08`, ejecuta:

```bash
python -m unittest discover -s tests -v
```

Las pruebas automatizadas verifican:

- Cálculo de la distancia Manhattan.
- Cálculo de la distancia Euclidiana.
- Búsqueda A* con ambas heurísticas.
- Comportamiento de A* ante un laberinto vacío.

## 8. Estructura del proyecto

```text
dia08/
├── proyecto_ia/
│   ├── __init__.py
│   ├── __main__.py
│   ├── astar.py
│   ├── connect4.py
│   └── main.py
├── tests/
│   └── test_astar.py
├── evidencias/
├── .gitignore
├── pyproject.toml
└── README.md
```

## 9. Organización del código

- `main.py`: punto de entrada que presenta los componentes del proyecto.
- `astar.py`: contiene las heurísticas, la reconstrucción de rutas y el algoritmo A*.
- `connect4.py`: contiene la lógica del tablero Connect 4, la evaluación de posiciones y Minimax con poda Alfa-Beta.
- `tests/`: contiene las pruebas automatizadas.
- `pyproject.toml`: define los datos del paquete, sus dependencias y el comando de ejecución.

## 10. Dependencias

Las dependencias se encuentran declaradas en `pyproject.toml`.

- NumPy 2.4.6.
- `heapq`, `math` y `random`, que pertenecen a la biblioteca estándar de Python.