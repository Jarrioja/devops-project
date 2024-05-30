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

# Verificar que las variables necesarias estén definidas
if [[ -z "$MYSQL_USER" || -z "$MYSQL_PASSWORD" || -z "$MYSQL_HOST" || -z "$MYSQL_DB" ]]; then
    echo "Por favor, define MYSQL_USER, MYSQL_PASSWORD, MYSQL_HOST y MYSQL_DB en el archivo .env"
    exit 1
fi

# Crear un secreto de Kubernetes para MySQL
kubectl create secret generic mysql-secret \
    --from-literal=MYSQL_USER="$MYSQL_USER" \
    --from-literal=MYSQL_DATABASE="$MYSQL_DB" \
    --from-literal=MYSQL_PASSWORD="$MYSQL_PASSWORD" \
    --from-literal=MYSQL_ROOT_PASSWORD="$MYSQL_PASSWORD" \
    --dry-run=client -o yaml | kubectl apply -f -

kubectl create secret generic todo-app-secret \
    --from-literal=MYSQL_USER="$MYSQL_USER" \
    --from-literal=MYSQL_DB="$MYSQL_DB" \
    --from-literal=MYSQL_PASSWORD="$MYSQL_PASSWORD" \
    --from-literal=MYSQL_ROOT_PASSWORD="$MYSQL_PASSWORD" \
    --from-literal=MYSQL_HOST="$MYSQL_HOST" \
    --dry-run=client -o yaml | kubectl apply -f -

# Crear un secreto de Kubernetes para Grafana
kubectl create secret generic grafana-secret \
    -n monitoring \
    --from-literal=admin-password="$GRAFANA_ADMIN_PASSWORD" \
    --dry-run=client -o yaml | kubectl apply -f -
