#!/bin/bash

# menu.sh  -  Ejercicio Práctico Nro. 1
#
# USO:
#   bash menu.sh          →  abre el menú interactivo
#   bash menu.sh -d       →  borra el entorno EPNro1 y mata procesos en background
#
# REQUISITO PREVIO:
#   La variable de entorno FILENAME debe estar definida antes de ejecutar:
#       export FILENAME=alumnos
#
# NOTA: Se invoca siempre con "bash menu.sh", por lo que no se requiere
#       permisos de ejecución (+x) sobre el archivo.

# CONSTANTES: rutas del entorno
# Se definen una sola vez y se reutilizan en todas las funciones.
BASE_DIR="$HOME/EPNro1"
ENTRADA_DIR="$BASE_DIR/entrada"
SALIDA_DIR="$BASE_DIR/salida"
PROCESADO_DIR="$BASE_DIR/procesado"

if [ "$1" == "-d" ]; then
  # ps -ef lista procesos, grep filtra consolidar.sh, awk toma ID
  proceso=$(ps -ef | grep "consolidar.sh" | grep -v grep | awk '{print $2}')

  if [ -n "$proceso" ]; then
    kill $proceso # Mata el proceso
    echo "Proceso detenido"
  else
    echo "No hay proceso en ejecución"
  fi

  # Borramos todo el entorno
  rm -rf "$BASE_DIR"
  echo "Entorno eliminado"
  exit 0
fi

# Función: mostrar_menu
# Imprime el menú de opciones en pantalla.
mostrar_menu() {
  echo ""
  echo "-------------------------------------"
  echo "   Ejercicio Práctico Nro. 1 - BASH  "
  echo "-------------------------------------"
  echo "  1) Crear entorno"
  echo "  2) Correr proceso (background)"
  echo "  3) Listar alumnos por padrón"
  echo "  4) Ver las 10 notas más altas"
  echo "  5) Buscar alumno por padrón"
  echo "  6) Salir"
  echo "-------------------------------------"
  echo -n "Seleccione una opción: "
}

# Variable de entorno obligatoria
if [ -z "$FILENAME" ]; then
  echo "Error: definí la variable de entorno FILENAME"
  exit 1
fi

ARCHIVO="$SALIDA_DIR/$FILENAME.txt"

while true; do
  mostrar_menu
  read -r opcion
  case $opcion in
  1) # Crea el directorio base EPNro1 con sus subcarpetas entrada, salida y procesado.
      mkdir -p "$ENTRADA_DIR" "$SALIDA_DIR" "$PROCESADO_DIR"
      cp "$(dirname "$0")/consolidar.sh" "$BASE_DIR/consolidar.sh"
      echo "Entorno creado en $BASE_DIR"
    ;;
  2)
    if [ ! -d "$BASE_DIR" ]; then
      echo "Primero crea el entorno (opción 1)"
    else
      export FILENAME
      bash "$BASE_DIR/consolidar.sh" &
      echo "Proceso consolidar.sh corriendo en background"
    fi
    ;;
  3) #muestra todo ordenado por número de padrón
    if [ -f "$ARCHIVO" ]; then
      echo "Listado de alumnos ordenado por número de padrón:"
      sort -k1,1 -n "$ARCHIVO"
    else
      echo "Archivo $ARCHIVO no existe."
    fi
    ;;
  4) #muestra las 10 notas más altas ordenadas de mayor a menor
    if [ -f "$ARCHIVO" ]; then
      echo "Top 10 notas más altas:"
      sort -k5 -nr "$ARCHIVO" | head -n 10 # -k5 = columna 5(nota) -nr= toma num de mayor a menor| muestra en pantalla
    else
      echo "Archivo $ARCHIVO no existe."
    fi
    ;;
  5) #Muestra los datos segun el padron ingresado
    read -p "Ingrese el numero de padron: " padron
    #Existencia del archivo y datos del padron
    if [ -f "$ARCHIVO" ]; then
      datos=$(grep "^$padron" "$ARCHIVO")
      if [ -n "$datos" ]; then
        echo "Datos Correspondientes: "
        echo "$datos"
      else
        echo "Sin coincidencias"
      fi
    else
      echo "El archivo $ARCHIVO no existe"
    fi
    ;;
  6)
    echo ""
    echo "Saliendo. ¡Hasta luego!"
    exit 0
    ;;
  esac

done
