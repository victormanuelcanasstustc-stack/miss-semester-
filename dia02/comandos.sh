
# Actividad 2.1: cargar y comprobar alias
source dia02/aliases.sh
alias
gs
ll
ultimos
buscarpy

# Actividad 2.2: control de procesos (secuencia manual)
# sleep 10000 (ejecutado manualmente)
# Ctrl + Z
bg
jobs -l
fg
# Ctrl + C

# Actividad 2.3: configuración SSH
ssh -T git@github.com
git remote -v
