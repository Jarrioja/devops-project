#!/bin/bash

./validate_env.sh

## Añadir y actualizar repositorios de Helm
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update

# Instalar ingress-nginx
helm install nginx-ingress ingress-nginx/ingress-nginx --set controller.publishService.enabled=true
kubectl delete validatingwebhookconfiguration nginx-ingress-ingress-nginx-admission

# Instalar Argo CD
helm install my-argo-cd argo/argo-cd --version 7.0.0 --namespace argocd

sleep 5

echo "ArgoCD Password:"
kubectl get secret --namespace argocd argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 --decode
