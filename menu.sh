#!/bin/bash#

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

while true; do
    mostrar_menu
    read -r opcion
    case $opcion in
         6)
            echo ""
            echo "Saliendo. ¡Hasta luego!"
            exit 0
            ;;
    esac

done
