#!/bin/bash

./validate_env.sh

## Añadir y actualizar repositorios de Helm
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

# Instalar ingress-nginx
helm install ingress-nginx ingress-nginx/ingress-nginx

# Instalar Prometheus
helm install prometheus prometheus-community/prometheus -n monitoring

helm install mysql-exporter prometheus-community/prometheus-mysql-exporter \
    -n monitoring \
    --set mysql.user="$MYSQL_USER" \
    --set mysql.pass="$MYSQL_PASSWORD" \
    --set mysql.host="$MYSQL_HOST"

# Instalar Grafana
helm install grafana grafana/grafana \
    -n monitoring \
    --set persistence.enabled=true \
    --set persistence.storageClassName=standard \
    --set persistence.accessModes={ReadWriteOnce} \
    --set persistence.size=10Gi

echo
kubectl get secret --namespace monitoring grafana -o jsonpath="{.data.admin-password}" | base64 --decode
echo
echo "Ingress-Nginx, Prometheus y Grafana han sido instalados."