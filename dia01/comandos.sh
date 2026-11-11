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
