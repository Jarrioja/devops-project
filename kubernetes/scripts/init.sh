#!/bin/bash

chmod +x validate_env.sh create_secret.sh install_helm_charts.sh
kubectl create namespace monitoring
kubectl create namespace prod
kubectl create namespace dev
kubectl create namespace argocd
# Ejecutar el script para validar y cargar el archivo .env
./validate_env.sh

# Crear el secreto de Kubernetes para MySQL
./create_secret.sh

# Instalar los charts de Helm
./install_helm_charts.sh
