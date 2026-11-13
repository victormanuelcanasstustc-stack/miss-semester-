# Bitácora de intentos – Actividad 8

## Objetivo

Registrar los problemas encontrados durante el empaquetado del proyecto de inteligencia artificial y las soluciones aplicadas.

## Intento 1. Dependencia faltante

**Problema:** Al ejecutar el proyecto original, se presentó el error `ModuleNotFoundError: No module named 'numpy'`.

**Causa:** NumPy no estaba instalado en el entorno de Python utilizado.

**Solución:** Se creó un entorno virtual independiente y se instaló NumPy. Se fijó la versión `2.4.6` en el archivo `pyproject.toml`.

## Intento 2. Importación de pruebas

**Problema:** Al ejecutar `python -m unittest discover -s dia08/tests -v` desde la raíz del repositorio, Python no encontró el módulo `proyecto_ia`.

**Causa:** El paquete estaba dentro de la carpeta `dia08`, que no se encontraba en la ruta de búsqueda de módulos.

**Solución:** Se organizó el proyecto como un paquete instalable y se configuró su instalación mediante `pyproject.toml`. Después, las cuatro pruebas se ejecutaron correctamente desde la carpeta del proyecto.

## Intento 3. Creación del entorno virtual

**Problema:** Al intentar ejecutar nuevamente `python -m venv .venv`, Windows mostró un error de permisos.

**Causa:** El entorno virtual ya estaba creado y activo.

**Solución:** Se continuó trabajando con el entorno existente, sin necesidad de recrearlo.

## Intento 4. Creación del README

**Problema:** Los primeros intentos de crear el README mediante bloques de texto en Git Bash quedaron incompletos.

**Causa:** Los delimitadores de los bloques de texto entraban en conflicto con los bloques de código incluidos en el documento.

**Solución:** Se utilizó el Bloc de notas de Windows para crear y guardar correctamente el archivo README.md.

## Resultados de las pruebas

- Instalación del paquete: exitosa.
- Dependencia NumPy 2.4.6: instalada correctamente.
- Comando `proyecto-ia`: ejecutado correctamente.
- Comando `python -m proyecto_ia`: ejecutado correctamente.
- Pruebas automatizadas: 4 aprobadas de 4.

## Conclusión

Los problemas encontrados permitieron mejorar la organización, configuración y documentación del proyecto. Se logró empaquetarlo correctamente y ejecutar sus pruebas dentro de un entorno virtual independiente.

Queda pendiente realizar la prueba final desde una instalación limpia, siguiendo únicamente las instrucciones del README.