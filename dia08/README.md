# Proyecto de Inteligencia Artificial

Proyecto académico que reúne dos componentes:

- **Connect 4:** implementación de Minimax, poda Alfa-Beta y ordenamiento de movimientos.
- **Búsqueda A*:** búsqueda de rutas utilizando las heurísticas Manhattan y Euclidiana.

## 1. Requisitos

- Python 3.11 o superior.
- Git.
- Conexión a Internet para instalar las dependencias.

## 2. Descargar el proyecto

Clona el repositorio:

```git clone -b actividad7-rama --single-branch https://github.com/victormanuelcanasstustc-stack/miss-semester-.git
```

Entra en la carpeta de la actividad:

```bash
cd miss-semester-/dia08
```

## 3. Crear el entorno virtual

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

## 4. Instalar el proyecto

```bash
python -m pip install --upgrade pip
python -m pip install .
```

NumPy se instala automáticamente según la versión declarada en `pyproject.toml`.

## 5. Ejecutar el proyecto

```bash
proyecto-ia
```

También puedes utilizar:

```bash
python -m proyecto_ia
```

## 6. Ejecutar las pruebas

```bash
python -m unittest discover -s tests -v
```

Las pruebas verifican:

- Cálculo de la distancia Manhattan.
- Cálculo de la distancia Euclidiana.
- Búsqueda A* con heurística Manhattan.
- Búsqueda A* con heurística Euclidiana.

## 7. Estructura del proyecto

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

## 8. Dependencias

Las dependencias están declaradas en `pyproject.toml`.

- NumPy 2.4.6

Los demás módulos utilizados pertenecen a la biblioteca estándar de Python.