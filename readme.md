# Ejercicio Práctico Nro. 1 - Bash

## Archivos

`menu.sh`: Script principal con el menú interactivo.
`consolidar.sh`: Script de consolidación (lanzado automáticamente por la opción 2).

## Este archivo servira como un manual para cualquier persona que quiera entender como utilizar el menu y como subir sus propios archivos de texto con la informacion correcta para que queden registrados en el padron.

### Paso 1 — Definir la variable de entorno FILENAME
```
export FILENAME=alumnos
```

### Paso 2 — Ejecutar el menú
```
bash menu.sh
```

### Paso 3 — Crear el entorno (opción 1)
Desde el menú, elegir la opción **1**. Esto crea `~/EPNro1/` con las carpetas `entrada/`, `salida/` y `procesado/`, y copia `consolidar.sh` dentro del mismo directorio.

### Paso 4 — Iniciar el proceso de consolidación (opción 2)
Elegir la opción **2**. Lanza `consolidar.sh` en background, que monitorea `entrada/`

### Paso 5 — Colocar archivos en entrada/
Copiar archivos `.txt` con el formato correcto en `~/EPNro1/entrada/`. El proceso los consolidará en `~/EPNro1/salida/alumnos.txt` automáticamente.

### Para borrar todo el entorno
```
bash menu.sh -d
```

## Formato de los archivos de entrada

```
122332 Juan Lopez jlopez@fi.uba.ar 8
100998 Pedro Valdéz pvaldez@fi.uba.ar 5
```

Columnas: `Nro_Padrón  Nombre  Apellido  email  nota`
