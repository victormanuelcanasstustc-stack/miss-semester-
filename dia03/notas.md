# Día 3 — Entorno de desarrollo y herramientas

## 1. Configuración de VS Code

Se configuró Visual Studio Code para trabajar con Python 3.11.9.

- Servidor de lenguaje: Pylance.
- Formateador: Black.
- Análisis de código: Ruff.
- Formato automático al guardar: activado.
- Depurador: Python Debugger (debugpy).
- Configuración guardada en la carpeta .vscode.

## 2. Depuración

Se creó el archivo prueba_debug.py para practicar la depuración de un programa que calcula el promedio de varias notas.

Se utilizó el depurador integrado de VS Code para ejecutar el programa y observar sus variables durante la ejecución.

La evidencia está guardada en evidencias/04_debugger.png.

## 3. Linter y formateador

Se utilizaron Ruff y Black sobre el archivo dia01/pruebas/programa.py.

Primero se encontraron errores de sintaxis porque el archivo tenía contenido que no correspondía a código Python válido.

Se guardaron los resultados iniciales en:
- evidencias/02_linter_errores.txt
- evidencias/03_formateador_errores.txt

Después se corrigió el archivo y se comprobó que Ruff no reportara errores y que Black aceptara el formato.

## 4. Atajos de teclado

Se documentaron 15 atajos útiles en atajos.md y se practicó la navegación y edición sin utilizar el ratón.

También se configuró un atajo personalizado para iniciar la depuración.

## 5. Video

Se grabó un video de aproximadamente un minuto mostrando la navegación y edición mediante el teclado.

Archivo: video/navegacion_sin_raton.mp4

## 6. Reflexión

Esta actividad permitió conocer mejor las herramientas del editor. Aprendí que un buen entorno de desarrollo facilita encontrar errores, mantener el código organizado y trabajar con mayor eficiencia.
