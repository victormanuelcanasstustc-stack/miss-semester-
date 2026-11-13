# Actividad 7 – Git: reescritura de historial y recuperación

## 1. Reescritura del historial

Se crearon cinco commits con mensajes poco descriptivos para practicar la reorganización del historial.

Los cinco commits iniciales fueron:

- inicio
- cambio
- otra cosa
- ajuste
- final

Se utilizó el comando `git rebase -i HEAD~5` para agruparlos mediante `fixup` y cambiar el mensaje del último commit mediante `reword`.

El resultado fue un historial de tres commits más organizados:

- `e0275d5`: inicio
- `b0f050a`: otra cosa
- `ecba97f`: Documentar resultado de la reescritura del historial

Todos los cambios del archivo README se conservaron.

## 2. Búsqueda de errores con git bisect

Se creó una calculadora de promedio y se agregaron pruebas automáticas.

La versión inicial funcionaba correctamente. Después se introdujo intencionalmente un error al cambiar el divisor de `len(notas)` a `len(notas) - 1`.

Se utilizó el siguiente procedimiento:

1. `git bisect start`
2. `git bisect bad`
3. `git bisect good 04fd03f`
4. Se ejecutaron las pruebas en el commit intermedio `525381f`, que pasó correctamente.
5. Se marcó ese commit como bueno con `git bisect good`.

Git identificó `b85f560` como el primer commit defectuoso.

Después se corrigió la función y las pruebas automáticas volvieron a pasar.

## 3. Recuperación mediante reflog

Se creó un commit con el archivo `recuperacion.txt`.

El commit original fue `7c959ad`. Luego se simuló su eliminación mediante `git reset --hard HEAD~1`.

Se utilizó `git reflog -10` para localizar el commit perdido y se recuperó mediante:

`git cherry-pick 7c959ad`

La recuperación generó el commit `0413f3c`. Se verificó que el archivo `dia07/pruebas/recuperacion.txt` estuviera nuevamente disponible.

## 4. Regla para reescribir el historial

Es seguro reescribir el historial cuando se trabaja en una rama local que todavía no ha sido compartida, porque los cambios afectan principalmente al historial propio.

No es recomendable reescribir el historial de una rama compartida sin coordinarlo con los demás integrantes del equipo, ya que puede generar conflictos y diferencias entre las versiones locales y remotas. En ramas públicas o compartidas es preferible utilizar `git revert` para deshacer cambios sin modificar los commits anteriores.

## 5. Conclusión

En esta actividad aprendí a organizar commits con `git rebase -i`, localizar errores utilizando `git bisect` y recuperar cambios mediante `git reflog`.

También comprendí la importancia de mantener un historial claro y de tener precaución al modificar commits que ya fueron compartidos con otras personas.