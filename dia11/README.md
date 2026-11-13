# Día 11 — Code Quality y configuración del entorno

## 1. Objetivo

El objetivo de esta actividad es desarrollar un instalador que permita preparar el entorno de desarrollo del repositorio Missing Semester de manera automatizada y reproducible.

También se busca reducir los pasos manuales de configuración, facilitar la instalación de herramientas y comprobar que el entorno funcione correctamente en diferentes sistemas operativos.

## 2. Descripción del instalador

Se desarrolló el archivo `instalar_entorno.sh`, ubicado en la carpeta `dia11`.

Este script automatiza las siguientes tareas:

- Detecta el sistema operativo en el que se está ejecutando.
- Comprueba la disponibilidad de Git, Python, Node.js y npm.
- En Ubuntu, instala los paquetes necesarios que falten mediante `apt-get`.
- Crea un entorno virtual de Python llamado `.venv`.
- Instala el proyecto de inteligencia artificial desarrollado en el Día 8.
- Instala Ruff como herramienta de análisis y calidad de código.
- Configura alias de Bash para facilitar el trabajo en la terminal.
- Evita duplicar los alias cuando el instalador se ejecuta nuevamente.
- Configura el acceso SSH a GitHub cuando encuentra una llave existente.
- Comprueba las extensiones de Python, Pylance, Black y Ruff en VS Code cuando está disponible.
- Verifica la instalación de NumPy y las dependencias del proyecto.

## 3. Herramientas utilizadas

Durante el desarrollo y las pruebas se utilizaron las siguientes herramientas:

| Herramienta | Función |
|---|---|
| Git | Control de versiones |
| Git Bash | Ejecución de comandos y scripts |
| Python 3.11 | Ejecución de programas |
| Node.js y npm | Entorno de desarrollo JavaScript |
| Ruff | Análisis y calidad de código Python |
| NumPy | Dependencia del proyecto de IA |
| VS Code | Editor de código |
| SSH | Autenticación con GitHub |
| GitHub Actions | Automatización de pruebas |
| Ubuntu | Entorno de prueba automatizado |

## 4. Requisitos y alcance

### 4.1. Windows

Para ejecutar el instalador en Windows se requiere tener previamente instalados:

- Git para Windows con Git Bash.
- Python 3.11 o superior.
- Node.js.
- npm.

El script configura el entorno del proyecto y comprueba las herramientas disponibles, pero no instala automáticamente Git Bash ni las herramientas base de Windows.

### 4.2. Ubuntu

En Ubuntu se necesita Bash y acceso a `apt-get`. Cuando faltan paquetes necesarios, el instalador intenta instalarlos utilizando los permisos disponibles del sistema.

VS Code es opcional para la ejecución del instalador. Si está disponible, se comprueban o instalan las extensiones necesarias.

La configuración SSH solamente se agrega cuando existe una llave `id_ed25519`. El instalador no genera, copia ni publica llaves privadas.

## 5. Ejecución del instalador

Desde la raíz del repositorio se ejecuta:

```bash
bash dia11/instalar_entorno.sh
```

El instalador detecta el sistema operativo, comprueba las herramientas, prepara el entorno virtual, instala las dependencias y realiza verificaciones finales.

Para cargar los alias en la terminal actual se utiliza:

```bash
source ~/.bashrc
```

Para activar el entorno virtual en Windows con Git Bash:

```bash
source .venv/Scripts/activate
```

Para activarlo en Ubuntu:

```bash
source .venv/bin/activate
```

## 6. Configuración de alias

Se agregaron alias para facilitar las operaciones frecuentes en la terminal:

| Alias | Función |
|---|---|
| `cproyecto` | Acceder a la carpeta del proyecto |
| `ll` | Mostrar archivos con información detallada |
| `gs` | Consultar el estado de Git |
| `ultimos` | Mostrar los últimos cinco commits |
| `guardar` | Preparar los cambios para Git |
| `subir` | Enviar los cambios a la rama actual |
| `py` | Ejecutar Python |
| `buscarpy` | Buscar archivos Python |

Se implementó una comprobación para evitar que el bloque de alias se agregue varias veces al archivo `.bashrc`.

## 7. Configuración SSH

El instalador comprueba si existe una llave SSH llamada `id_ed25519`.

Cuando encuentra la llave, agrega una configuración para GitHub en el archivo `~/.ssh/config`, siempre que no exista previamente una entrada para ese servidor.

Esta configuración permite utilizar la autenticación SSH sin exponer la llave privada.

Durante las pruebas se comprobó que Git reconociera correctamente el usuario `git`, el servidor `github.com` y la ruta de la llave configurada.

## 8. Pruebas realizadas en Windows

La primera prueba se realizó en Windows utilizando Git Bash.

El instalador se ejecutó correctamente y detectó las herramientas disponibles.

Resultados obtenidos:

- Python: 3.11.9.
- Node.js: v24.14.1.
- npm: 11.11.0.
- NumPy: 2.4.6.
- Ruff: 0.17.5.
- `pip check`: no se encontraron dependencias rotas.

También se ejecutaron nuevamente el instalador y las comprobaciones de configuración.

Se verificó que el bloque de alias apareciera una sola vez y que la configuración SSH de GitHub tampoco se duplicara.

Finalmente, se ejecutaron las pruebas unitarias del proyecto de inteligencia artificial:

```bash
python -m unittest discover -s dia08/tests -v
```

Resultado: cinco pruebas aprobadas y ninguna fallida.

La evidencia de esta ejecución se encuentra en:

`dia11/evidencias/instalacion_windows.log`

## 9. Prueba automatizada en Ubuntu

Para comprobar el funcionamiento en un entorno Linux se creó el workflow:

`.github/workflows/probar-instalador.yml`

Este workflow utiliza GitHub Actions y ejecuta las siguientes actividades:

1. Descarga el repositorio.
2. Prepara Python 3.11.
3. Prepara Node.js 22.
4. Comprueba la sintaxis del instalador.
5. Ejecuta el instalador en Ubuntu.
6. Activa el entorno virtual.
7. Comprueba Python, las dependencias, Ruff y NumPy.

La ejecución terminó correctamente y GitHub Actions mostró el resultado exitoso.

Esta prueba permitió comprobar el instalador en un runner Ubuntu independiente del equipo Windows utilizado para el desarrollo.

La captura de evidencia se encuentra en:

`dia11/evidencias/github_actions_exito.png`

## 10. Control de versiones

Los cambios del Día 11 se guardaron en la rama `actividad7-rama`.

Entre los commits realizados se encuentran:

- `159b3bc`: Agregar instalador reproducible y pruebas del entorno.
- `86444a8`: Agregar evidencias de instalación y CI de Ubuntu.

Los cambios y las evidencias fueron enviados correctamente al repositorio remoto de GitHub.

## 11. Dificultades y aprendizajes

Durante el desarrollo se presentaron algunas dificultades relacionadas con la configuración del instalador, la compatibilidad entre Windows y Linux y el manejo de los archivos de configuración.

Uno de los aprendizajes más importantes fue comprender que un script debe considerar las diferencias entre los sistemas operativos. Por ejemplo, la ubicación del ejecutable de Python dentro de un entorno virtual cambia entre Windows y Linux.

También aprendí la importancia de comprobar que un instalador pueda ejecutarse más de una vez sin duplicar configuraciones.

Otra dificultad fue el manejo de `.gitignore`. Inicialmente, el archivo de registro de instalación estaba siendo excluido del repositorio. Se corrigieron las reglas para permitir que las evidencias importantes pudieran guardarse en GitHub.

Además, comprendí que no es suficiente con ejecutar un programa en mi propio computador: también es necesario probarlo en un entorno independiente para detectar posibles problemas de compatibilidad.

## 12. Conclusión

El desarrollo de esta actividad permitió integrar conocimientos de Bash, Python, Git, SSH, configuración de herramientas y automatización mediante GitHub Actions.

Se construyó un instalador que facilita la preparación del entorno de desarrollo y se comprobó su funcionamiento tanto en Windows con Git Bash como en Ubuntu mediante integración continua.

La actividad también permitió comprender la importancia de la reproducibilidad, la documentación técnica, el control de versiones y las pruebas automatizadas para mantener proyectos de software más organizados y confiables.