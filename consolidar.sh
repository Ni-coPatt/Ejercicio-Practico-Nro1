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
#ps -ef | grep "consolidar.sh" | awk '{printf $2}' para obtener el proceso
#proceso=$(ps -ef | grep -v grep | grep "consolidar.sh" | awk '{printf $2}')
#kill $proceso
#pa' matarlo
camino=$PWD
cd $HOME/EPNro1/entrada/
while true; do
  if [ -f *.txt ];then
    for i in *.txt; do
      cat $i >> $HOME/EPNro1/salida/$FILENAME.txt;
      mv $i $HOME/EPNro1/procesado/;
    done
  fi
  sleep 1
done&
