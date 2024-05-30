#!/bin/bash

# Verificar que el archivo .env existe
if [[ ! -f .env ]]; then
    echo "Archivo .env no encontrado. Por favor, asegúrate de que el archivo .env existe en el directorio actual."
    exit 1
fi

# Cargar variables de entorno desde el archivo .env
set -a
source .env
set +a
