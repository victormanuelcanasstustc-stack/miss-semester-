# Buscar archivos Python
find . -type f -name "*.py" -not -path './.git/*'

# Buscar archivos de texto
find . -type f -name "*.txt" -not -path './.git/*'

# Buscar archivos mayores de 500 bytes
find dia01/pruebas -type f -size +500c

# Buscar archivos menores de 100 bytes
find dia01/pruebas -type f -size -100c

# Buscar palabras y mostrar el número de línea
grep -n "Python" dia01/pruebas/texto_busqueda.txt
grep -n "Linux" dia01/pruebas/texto_busqueda.txt

# Contar líneas, palabras y caracteres
wc -l dia01/pruebas/texto_busqueda.txt
wc -w dia01/pruebas/texto_busqueda.txt
wc -m dia01/pruebas/texto_busqueda.txt

# Ordenar frutas alfabéticamente
sort dia01/pruebas/frutas.txt

# Eliminar frutas duplicadas
sort dia01/pruebas/frutas.txt | uniq

# Contar las apariciones de cada fruta
sort dia01/pruebas/frutas.txt | uniq -c

# Redireccionar la salida a un archivo
sort dia01/pruebas/frutas.txt > dia01/pruebas/frutas_ordenadas.txt

# Agregar un título sin borrar el contenido anterior
echo "Lista de frutas ordenadas" >> dia01/pruebas/frutas_ordenadas.txt

# Mostrar el contenido del archivo
cat dia01/pruebas/frutas_ordenadas.txt

# Contar las líneas del archivo
wc -l dia01/pruebas/frutas_ordenadas.txt

# Declarar y utilizar una variable
nombre="Victor"
echo "Hola, $nombre"

# Obtener la fecha mediante sustitución de comandos
fecha=$(date +%Y-%m-%d)
echo "Fecha de ejecución: $fecha"

# Crear alias
alias ll='ls -lah'
alias buscarpy='find . -type f -name "*.py" -not -path "./.git/*"'

# Crear y consultar una variable de entorno
export PROYECTO="missing-semester"
echo "$PROYECTO"
printenv PROYECTO
env | grep PROYECTO

# Mostrar permisos y detalles de los archivos del sistema
ls -l /

# Mostrar permisos y detalles de los archivos de prueba
ls -l dia01/pruebas

# Mostrar permisos de los directorios
ls -ld dia01 dia01/pruebas

# Buscar todos los archivos TXT mediante glob
ls dia01/glob_pruebas/*.txt

# Buscar archivos file con un solo caracter adicional
ls dia01/glob_pruebas/file?.txt

# Buscar archivos con nombres especificos mediante expansion de llaves
ls dia01/glob_pruebas/{a,b,c}.txt

# Ejercicio 4: diferencias entre comillas
echo 'El texto $nombre permanece literal'
nombre="Victor"
echo "Hola, $nombre"
printf '%s\n' $'Precio: $5\nHola!'
echo "La variable se llama \$nombre"

# Ejercicio 5: separar stdout y stderr
ls /nonexistent dia01/pruebas > dia01/pruebas/salida.txt 2> dia01/pruebas/errores.txt

# Redirigir stdout y stderr al mismo archivo
ls /nonexistent dia01/pruebas > dia01/pruebas/salida_y_error.txt 2>&1

# Ejercicio 6: codigos de salida
true
echo $?
false
echo $?

# Operadores AND y OR
true && echo "El primer comando tuvo exito"
false || echo "El primer comando fallo"

# Combinar comandos
mkdir -p dia01/pruebas/condicional && echo "Carpeta creada correctamente"

# Ejercicio 7: comprobar que cd es parte del shell
pwd
cd dia01/pruebas
pwd
cd ../..
pwd
type cd
type ls

# Ejercicio 5: separar stdout y stderr
ls /nonexistent dia01/pruebas > dia01/pruebas/salida.txt 2> dia01/pruebas/errores.txt
ls /nonexistent dia01/pruebas > dia01/pruebas/salida_y_error.txt 2>&1

# Ejercicio 6: codigos de salida y operadores logicos
true
echo $?
false
echo $?
true && echo "El primer comando tuvo exito"
false || echo "El primer comando fallo"
mkdir -p dia01/pruebas/condicional && echo "Carpeta creada correctamente"

# Ejercicio 7: cd como comando interno del shell
pwd
cd dia01/pruebas
pwd
cd ../..
pwd
type cd
type -a ls

# Ejercicio 8: comprobar si un archivo existe
bash dia01/comprobar_archivo.sh dia01/pruebas/frutas.txt
bash dia01/comprobar_archivo.sh dia01/pruebas/no_existe.txt

# Ejercicio 9: dar permiso de ejecucion y ejecutar el script
chmod +x dia01/comprobar_archivo.sh
ls -l dia01/comprobar_archivo.sh
./dia01/comprobar_archivo.sh dia01/pruebas/frutas.txt
./dia01/comprobar_archivo.sh dia01/pruebas/no_existe.txt

# Ejercicio 10: depuracion de scripts con set -x
bash dia01/depuracion.sh

# Ejercicio 10: depuracion con set -x
bash dia01/depuracion.sh

# Ejercicio 11: crear copia de seguridad con fecha
cp dia01/pruebas/frutas.txt "dia01/pruebas/frutas_$(date +%Y-%m-%d).txt"

# Ejercicio 12: recibir argumentos en un script
./dia01/prueba_argumentos.sh echo Hola desde Bash
./dia01/prueba_argumentos.sh pwd

# Ejercicio 12: recibir argumentos en un script
./dia01/prueba_argumentos.sh echo Hola desde Bash
./dia01/prueba_argumentos.sh pwd

# Ejercicio 13: encontrar las cinco extensiones mas comunes
find ~ -type f -not -path '*/.git/*' | awk -F/ '{name=$NF; if (name ~ /\./ && name !~ /^\.[^.]+$/) {sub(/^.*\./,"",name); print "." name}}' | sort | uniq -c | sort -nr | head -n 5

# Ejercicio 12: recibir argumentos en un script
./dia01/prueba_argumentos.sh echo Hola desde Bash
./dia01/prueba_argumentos.sh pwd

# Ejercicio 13: encontrar las cinco extensiones mas comunes
find ~ -type f -not -path '*/.git/*' 2>/dev/null | awk -F/ '{name=$NF; if (name ~ /\./ && name !~ /^\.[^.]+$/) {sub(/^.*\./,"",name); print "." name}}' | sort | uniq -c | sort -nr | head -n 5

# Ejercicio 14: buscar scripts y contar lineas con xargs
find dia01 -type f -name "*.sh" -print0 | xargs -0 wc -l

# Ejercicio 15: consultar las fechas de las clases de MIT
curl -sL https://missing.csail.mit.edu/ | grep -oE '[0-9]+/[0-9]+/26' | wc -l

# Ejercicio 16: filtrar datos JSON con jq
curl -sL https://microsoftedge.github.io/Demos/json-dummy-data/64KB.json | jq -r '.[] | select(.version > 6) | .name'

# Ejercicio 17: filtrar y reorganizar columnas con awk
printf 'a 50 x\nb 150 y\nc 200 z\n' | awk '$2 > 100 {print $3, $2, $1}'

# Ejercicio 18: encontrar los 10 comandos más utilizados
history | sed -E 's/^[[:space:]]*[0-9]+[[:space:]]*//' | awk 'NF' | sort | uniq -c | sort -nr | head -n 10

# Ejercicio 6: crear /tmp/mydir solo si no existe
[ -d /tmp/mydir ] || mkdir /tmp/mydir
