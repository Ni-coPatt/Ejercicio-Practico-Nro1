#!/bin/bash

# consolidar.sh  -  Script de consolidación de archivos de alumnos
#
# Este script NO lo invoca directamente el usuario.
# Se lanza en background por menu.sh (opción 2).
#
#   Monitorea cada cierto tiempo la carpeta ~/EPNro1/entrada/ en busca de
#   archivos .txt.  Para cada archivo:
#     1. Adjunta su contenido al final de ~/EPNro1/salida/$FILENAME.txt
#     2. Mueve el archivo original a ~/EPNro1/procesado/
#
# Requiere que la variable de entorno FILENAME esté exportada,
# lo cual es responsabilidad de menu.sh antes de lanzar este proceso.

BASE="$HOME/EPNro1"
ENTRADA="$BASE/entrada"
SALIDA="$BASE/salida"
PROCESADO="$BASE/procesado"

# Verifica que la variable FILENAME esté definida
if [ -z "$FILENAME" ]; then
  echo "Defina FILENAME"
  exit 1
fi

ARCHIVO="$SALIDA/$FILENAME.txt"

# bucle que procesa los archivos en entrada
while true; do
  for archivo in "$ENTRADA"/*.txt; do
    [ -e "$archivo" ] || continue # Si no hay archivos, saltar

    # Agrega el contenido al archivo final
    cat "$archivo" >>"$ARCHIVO"
    echo "" >>"$ARCHIVO"

    # mueve el archivo procesado a la carpeta procesado
    mv "$archivo" "$PROCESADO/"

    echo "Procesado: $(basename "$archivo")" #con el basename muestra unicamente el nombre
  done

  sleep 3
done
