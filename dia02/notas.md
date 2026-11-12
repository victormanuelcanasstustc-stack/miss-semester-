
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
