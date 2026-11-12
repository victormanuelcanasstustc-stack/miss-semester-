
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

# Actividad 2.4: multiplexor de terminal
# Estos comandos se ejecutaron manualmente en MSYS2.
# pacman -S tmux
# tmux -V
# tmux new -s missing-semester
# Ctrl+B, %       -> dividir verticalmente
# Ctrl+B, "       -> dividir horizontalmente
# Ctrl+B, o       -> cambiar de panel
# Ctrl+B, flecha  -> seleccionar panel

# Actividad 2.5: configuración permanente de alias
# Se agregó al ~/.bashrc:
# source ~/Desktop/miss-semester-/dia02/aliases.sh
# Se verificó con source ~/.bashrc y alias.
