# Actividad 6 — Entender Git por dentro

## 1. Modelo de datos de Git

Git almacena la información mediante objetos:

- **Commit:** registra una versión del proyecto, identifica un árbol y puede tener uno o varios commits padres.
- **Tree:** representa la estructura de directorios y relaciona nombres de archivos con otros árboles u objetos blob.
- **Blob:** almacena el contenido de un archivo.
- **Referencia:** es un nombre que apunta a un commit, como una rama.

El diagrama del repositorio se encuentra en `modelo_git`.

## 2. Inspección de objetos reales

Se utilizaron los siguientes comandos para inspeccionar el repositorio:

- `git branch -avv`
- `git cat-file -p 6a37f73`
- `git cat-file -p 9f3eb2a`
- `git cat-file -p fc96e67`
- `git ls-tree HEAD`
- `git ls-tree -r HEAD`

### Resultados encontrados

**Commit más reciente:**
- Identificador: `6a37f73`
- Árbol: `a6aa8b3940174e4d338ec60a17c094436a552c09`
- Padre: `9f3eb2a1afe8cbfaf6860af76d8b09e7781c1a4a`

**Commit anterior:**
- Identificador: `9f3eb2a`
- Árbol: `c60da1382974b9f1e95ec18c825319a8bd87aff4`
- Padre: `fc96e67b8a7219dfcda88db69457b5f2a8b5dd8f`

**Tercer commit:**
- Identificador: `fc96e67`
- Árbol: `5b29e85ebb8b49c48dc88d0c56fb9b54849e2a46`
- Padre: `15e54a796c6eb54f182ba3b3709f16abc3c7f507`

La inspección del árbol principal mostró las carpetas `.vscode`, `dia01`, `dia02`, `dia03`, `dia04` y `dia05`. La inspección recursiva permitió observar los objetos blob correspondientes a los archivos.

## 3. ¿Qué es una rama en Git?

Una rama en Git es una referencia móvil que apunta al commit más reciente de una línea de desarrollo.

## 4. Conflicto de fusión en tres archivos

Para practicar la resolución de conflictos, creé tres archivos: `tema.txt`, `configuracion.txt` y `resumen.txt`, dentro de `dia06/conflictos/`.

Primero preparé los archivos y creé el commit `69f4ed2`. Después creé dos ramas:

- `actividad6-alternativa`
- `actividad6-rama`

En cada rama modifiqué los mismos tres archivos con contenidos diferentes. Luego, desde `actividad6-rama`, ejecuté `git merge actividad6-alternativa`.

Git detectó conflictos de contenido en los tres archivos porque ambas ramas habían modificado las mismas líneas.

### Decisiones para resolver los conflictos

1. **tema.txt:** combiné las ideas de fundamentos del control de versiones y trabajo colaborativo con Git.
2. **configuracion.txt:** conservé tanto el trabajo individual como el desarrollo colaborativo con ramas.
3. **resumen.txt:** integré las ideas de guardar el historial del proyecto, registrar cambios y resolver conflictos entre ramas.

Realicé la resolución manualmente, eliminando las marcas de conflicto (`<<<<<<<`, `=======` y `>>>>>>>`) y dejando una versión final combinada en cada archivo.

Finalmente, ejecuté `git add` sobre los tres archivos y confirmé la fusión con el commit `b462fc8`, llamado `Resolver conflictos de fusion en tres archivos`.

La comprobación con `git log --oneline --graph --all` permitió observar las dos ramas y el commit de fusión con sus dos padres.

### Aprendizaje

Aprendí que un conflicto aparece cuando Git no puede combinar automáticamente cambios realizados sobre las mismas partes de un archivo. Para resolverlo es necesario revisar ambas versiones, decidir qué información conservar y confirmar el resultado mediante un nuevo commit.

## 5. Conclusión

La inspección permitió comprender cómo Git relaciona los commits con sus árboles y cómo estos contienen referencias a los archivos almacenados como objetos blob. También se comprobó que las ramas son referencias que identifican líneas de desarrollo.