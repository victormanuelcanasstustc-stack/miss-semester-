## Búsqueda de archivos por tamaño

Se utilizaron los comandos find y size para localizar archivos según su tamaño.

- Archivos mayores de 500 bytes: mediano.txt y grande.txt.
- Archivos menores de 100 bytes: app.js, pequeno.txt, programa.py y otro.txt.

Los dos comandos se ejecutaron correctamente en Git Bash.

## Búsqueda de texto con grep

Se creó un archivo de prueba con tres líneas de texto.

- La búsqueda de Python encontró dos coincidencias en las líneas 1 y 2.
- La búsqueda de Linux encontró una coincidencia en la línea 3.

Se utilizó grep -n para mostrar las coincidencias junto con sus números de línea.

## Conteo de líneas, palabras y caracteres con wc

Se utilizó el comando wc para analizar el archivo texto_busqueda.txt.

- Líneas: 3.
- Palabras: 16.
- Caracteres: 117.

Se comprobaron las opciones -l, -w y -m.

## Ordenamiento y eliminación de duplicados

Se creó un archivo con seis frutas, algunas repetidas.

- sort permitió ordenar las frutas alfabéticamente.
- uniq eliminó las frutas repetidas.
- uniq -c mostró cuántas veces aparece cada fruta.

Resultados:
- Banano: 1.
- Manzana: 2.
- Pera: 2.
- Uva: 1.

## Redirección de salida

Se practicó el uso de los operadores de redirección.

- El operador > permitió guardar la lista ordenada en un archivo.
- El operador >> permitió agregar un título sin eliminar el contenido anterior.
- El comando cat mostró el contenido guardado.
- El comando wc -l confirmó que el archivo tiene 7 líneas.

## Variables y sustitución de comandos en Bash

Se realizaron pruebas con variables y sustitución de comandos.

- Se creó la variable nombre con el valor Victor.
- Se utilizó $nombre para mostrar su contenido.
- Se utilizó $(date +%Y-%m-%d) para obtener la fecha actual.
- La fecha obtenida fue 2026-11-11.

Ambas operaciones funcionaron correctamente.

## Creación de alias en Bash

Se crearon dos alias para simplificar comandos frecuentes.

- ll: ejecuta ls -lah para mostrar los archivos con información detallada.
- buscarpy: busca archivos con extensión .py dentro del proyecto.

Los alias se guardaron en ~/.bashrc para mantenerlos disponibles en futuras sesiones.

## Variables de entorno

Se creó la variable de entorno PROYECTO con el valor missing-semester mediante export.

Se comprobó su contenido utilizando:
- echo "$PROYECTO"
- printenv PROYECTO
- env | grep PROYECTO

Los tres comandos mostraron correctamente la variable.
