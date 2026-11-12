# Alias personales para trabajar con Git y proyectos

# 1. Entrar rápidamente a la carpeta principal del proyecto.
alias cproyecto='cd ~/Desktop/miss-semester-'

# 2. Mostrar archivos con detalles y tamaños legibles.
alias ll='ls -lah'

# 3. Consultar el estado de Git.
alias gs='git status'

# 4. Ver los últimos cinco commits.
alias ultimos='git log -5 --oneline'

# 5. Agregar todos los cambios al área de preparación.
alias guardar='git add .'

# 6. Subir los cambios a la rama principal.
alias subir='git push origin main'

# 7. Ejecutar archivos de Python.
alias py='python'

# 8. Buscar archivos Python sin entrar en .git ni .venv.
alias buscarpy='find . -type f -name "*.py" -not -path "./.git/*" -not -path "./.venv/*"'
