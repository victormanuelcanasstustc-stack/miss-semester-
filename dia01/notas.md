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

## Permisos y detalles de archivos con ls -l

Se utilizó ls -l para consultar los permisos, propietarios, tamaños y fechas de modificación de los archivos.

- El carácter - identifica un archivo normal.
- El carácter d identifica un directorio.
- La letra r representa el permiso de lectura.
- La letra w representa el permiso de escritura.
- La letra x representa el permiso de ejecución en archivos y el acceso en directorios.

Se comprobaron los permisos de los archivos de prueba y de los directorios dia01 y dia01/pruebas.

## Patrones glob en Bash

Se creó la carpeta glob_pruebas con archivos de diferentes nombres y extensiones.

- *.txt selecciona todos los archivos terminados en .txt.
- file?.txt selecciona archivos que comienzan por file y tienen un solo carácter adicional antes de .txt.
- {a,b,c}.txt permite seleccionar los archivos a.txt, b.txt y c.txt.

Las tres pruebas se realizaron correctamente en Git Bash.

## Diferencias entre comillas en Bash

- Las comillas simples conservan el texto literalmente.
- Las comillas dobles permiten expandir variables como $nombre.
- Las comillas ANSI ($'...') permiten representar caracteres especiales mediante secuencias como \n.
- Se utilizó printf para mostrar un texto con el símbolo $, el signo ! y un salto de línea.

El resultado se comprobó correctamente en Git Bash.

## Redirección de stdout y stderr

- stdout (1) representa la salida normal de un comando.
- stderr (2) representa los mensajes de error.
- > permite guardar la salida normal en un archivo.
- 2> permite guardar los errores en otro archivo.
- 2>&1 permite enviar los errores al mismo destino que stdout.

Se comprobó la separación de ambas salidas y su almacenamiento conjunto.

## Codigos de salida y operadores logicos

- El codigo 0 indica que un comando finalizo correctamente.
- Un codigo diferente de 0 indica que ocurrio un error.
- && ejecuta el siguiente comando solamente si el anterior tiene exito.
- || ejecuta el siguiente comando solamente si el anterior falla.

Se comprobaron estos comportamientos con true, false y mkdir.

## cd como comando interno del shell

Se comprobó que cd es un comando interno de Bash mediante type cd.

El comando cambia el directorio de trabajo de la sesión actual. Esto requiere que sea ejecutado por el propio shell, ya que un programa externo no puede modificar el directorio de su proceso padre.

También se comparó con ls, que es un comando externo.

## Ejercicio 5: Redireccion de stdout y stderr

Se separaron las salidas normales y los errores usando > y 2>. Tambien se combinaron ambas salidas con 2>&1.

## Ejercicio 6: Codigos de salida y operadores logicos

Se comprobó que el codigo 0 representa exito y el codigo 1 representa fallo. Se practicaron los operadores && y || para ejecutar comandos dependiendo del resultado anterior.

## Ejercicio 7: cd como comando interno

Se comprobó que cd es un comando interno de Bash. Permite cambiar el directorio de trabajo de la sesion actual. Se comparó con ls mediante type.

## Ejercicio 8: Comprobar si un archivo existe

Se creó un script que recibe un nombre de archivo como argumento y comprueba si existe mediante la condición -f. Se probaron un archivo existente y otro inexistente.

## Ejercicio 9: Permisos de ejecución con chmod

Se utilizó chmod +x para otorgar permiso de ejecución al script comprobar_archivo.sh. Después se ejecutó directamente utilizando ./ y se verificaron los dos resultados.

## Ejercicio 10: Depuración con set -x

Se creó un script que utiliza set -x para mostrar los comandos mientras Bash los ejecuta. Se utilizó set +x para desactivar la depuración.

## Ejercicio 10: Depuracion con set -x

Se utilizó set -x para mostrar las instrucciones mientras Bash las ejecuta. Con set +x se desactivó la depuración.

## Ejercicio 11: Copia de seguridad con fecha

Se utilizó cp para crear una copia del archivo frutas.txt. La sustitución de comandos $(date +%Y-%m-%d) permitió incluir la fecha actual en el nombre de la copia.

## Ejercicio 12: Argumentos en scripts Bash

Se creó un script que recibe instrucciones mediante argumentos.
- $1 representa el primer argumento.
- $@ representa todos los argumentos recibidos.
Se comprobó ejecutando echo y pwd desde el script.

## Ejercicio 12: Argumentos en scripts Bash

Se creó un script que recibe instrucciones mediante argumentos. $1 representa el primer argumento y $@ representa todos los argumentos. Se probó con echo y pwd.

## Ejercicio 13: Extensiones más comunes

Se combinaron find, awk, sort, uniq y head mediante tuberías para buscar archivos, extraer sus extensiones, contar las repeticiones y mostrar las cinco más frecuentes.

## Ejercicio 13: Extensiones más comunes

Se combinaron find, awk, sort, uniq y head mediante tuberías para encontrar y contar las cinco extensiones más frecuentes en la carpeta personal. Algunas carpetas protegidas de Windows no permitieron el acceso.

## Ejercicio 14: find y xargs

Se combinaron find y xargs para localizar archivos .sh y contar sus líneas con wc -l. Se utilizaron -print0 y -0 para manejar correctamente nombres de archivos con espacios.

## Ejercicio 15: Consulta web con curl

Se utilizó curl -sL para descargar el contenido de la página oficial de MIT. Con grep se extrajeron las fechas de las clases de 2026 y con wc -l se contó el total. El resultado fue 9 clases.

## Ejercicio 16: Consulta de datos JSON con jq

Se descargó un archivo JSON utilizando curl. Después, con jq se filtraron los registros cuya propiedad version es mayor que 6 y se mostraron sus nombres.

## Ejercicio 17: Filtrar datos con awk

Se utilizó awk para seleccionar las filas cuya segunda columna es mayor que 100. Después se imprimieron las columnas en el orden tercera, segunda y primera.

## Ejercicio 18: Análisis del historial de comandos

Se utilizó history para consultar los comandos ejecutados. Con sed se eliminaron los números del historial, awk descartó las líneas vacías, sort ordenó los comandos y uniq -c contó sus repeticiones. Finalmente, sort -nr organizó los resultados de mayor a menor y head mostró los primeros diez.

La tubería de registros SSH explicada en la clase utiliza una idea similar: filtrar registros, extraer un dato, agruparlo, contar sus apariciones y ordenar los resultados.

Ajuste del ejercicio 6: se utilizó [ -d /tmp/mydir ] || mkdir /tmp/mydir para crear el directorio únicamente cuando todavía no existe.

## Ejercicio 1: Entorno de shell

Se identificó el entorno Bash utilizado para realizar las actividades desde Git Bash en Windows.

## Ejercicio 2: Permisos de archivos en Unix

Se utilizó ls -l / para observar los permisos de los archivos y directorios del sistema. Se identificaron los caracteres que representan el tipo de archivo y los permisos de lectura, escritura y ejecución.

## Ejercicio 3: Patrones glob

Se utilizaron los patrones *.txt, file?.txt y {a,b,c}.txt para seleccionar archivos según sus nombres.

## Aclaración sobre el ejercicio 12

Se realizó una adaptación práctica del ejercicio utilizando un script propio que recibe argumentos mediante $1 y $@ y ejecuta comandos recibidos. No se modificó el script original de pruebas inestables de la clase.
