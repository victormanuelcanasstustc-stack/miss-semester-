
# Día 2 — Actividad 2: Configurar la terminal

## 1. Alias personales

Se creó el archivo aliases.sh con ocho alias para facilitar tareas frecuentes.

| Alias | Comando | Justificación |
|---|---|---|
| cproyecto | cd ~/Desktop/miss-semester- | Entrar rápidamente al repositorio. |
| ll | ls -lah | Consultar archivos ocultos y tamaños legibles. |
| gs | git status | Revisar los cambios del repositorio. |
| ultimos | git log -5 --oneline | Consultar los últimos cinco commits. |
| guardar | git add . | Preparar los cambios para un commit. |
| subir | git push origin main | Publicar los commits en GitHub. |
| py | python | Ejecutar programas Python más rápidamente. |
| buscarpy | find ... | Localizar archivos Python sin recorrer .git ni .venv. |

Los alias se cargan mediante source dia02/aliases.sh.
Se probaron los comandos gs, ll, ultimos y buscarpy en Git Bash.

## 2. Control de procesos y trabajos

Se utilizó el proceso sleep 10000 para practicar el control de trabajos.

Secuencia realizada:

1. sleep 10000: inició un proceso de larga duración.
2. Ctrl + Z: envió una señal de suspensión al proceso.
3. bg: reanudó el proceso en segundo plano.
4. jobs -l: permitió comprobar que estaba ejecutándose.
5. fg: devolvió el proceso al primer plano.
6. Ctrl + C: terminó el proceso mediante una señal de interrupción.

La práctica permitió comprender la diferencia entre un proceso suspendido,
uno ejecutándose en segundo plano y uno en primer plano.

## 3. Configuración de acceso SSH a GitHub

Se generó una clave ED25519 para autenticar el computador con GitHub.
La clave pública se agregó a la configuración SSH de la cuenta.

Se inició el agente SSH y se agregó la identidad privada mediante ssh-add.
La conexión se comprobó con ssh -T git@github.com y fue autenticada correctamente.

Finalmente, se configuró el remoto origin mediante SSH para realizar
operaciones de Git sin utilizar autenticación HTTPS.

## 4. Multiplexor de terminal: tmux

Se instaló MSYS2 y, mediante su administrador de paquetes pacman,
se instaló tmux. La versión comprobada fue tmux 3.8.

Se creó una sesión llamada missing-semester con:

tmux new -s missing-semester

Se utilizaron los siguientes atajos:
- Ctrl + B y %: dividir verticalmente.
- Ctrl + B y ": dividir horizontalmente.
- Ctrl + B y o: cambiar entre paneles.
- Ctrl + B y una flecha: seleccionar un panel específico.

Se organizaron tres paneles con funciones diferentes:
1. Panel superior izquierdo: consultar archivos y carpetas.
2. Panel inferior izquierdo: localizar archivos de la actividad.
3. Panel derecho: consultar la ubicación y fecha del sistema.

En MSYS2, los comandos git no estaban disponibles, por lo que
se utilizaron comandos de navegación y consulta de archivos.
Las operaciones de Git se realizaron desde Git Bash.

La evidencia visual se encuentra en:
evidencias/03_tmux_tres_paneles.png

## 5. Carga automática de alias

Se agregó la carga de dia02/aliases.sh al archivo ~/.bashrc.
El archivo ~/.bash_profile ya carga ~/.bashrc al iniciar Git Bash.

Se recargó la configuración con source ~/.bashrc y se verificó
que los ocho alias estuvieran disponibles.
