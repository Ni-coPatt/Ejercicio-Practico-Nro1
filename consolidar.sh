#!/bin/bash

# consolidar.sh  -  Script de consolidación de archivos de alumnos
#
# Este script NO lo invoca directamente el usuario.
# Se lanza en background por menu.sh (opción 2).
#
#   Monitorea cada cierto tiempo la carpeta ~/EPNro1/entrada/ en busca de
#   archivos .txt. Para cada archivo:
#     1. Adjunta su contenido al final de ~/EPNro1/salida/$FILENAME.txt
#     2. Mueve el archivo original a ~/EPNro1/procesado/
#
# Requiere que la variable de entorno FILENAME esté exportada,
# lo cual es responsabilidad de menu.sh antes de lanzar este proceso.
