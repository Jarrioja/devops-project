#!/bin/bash
kubectl delete namespace monitoring
kubectl delete service --all
kubectl delete deployment --all
kubectl delete ingress --all
kubectl delete pvc --all
kubectl delete pv --all
terraform -chdir=../../terraform/ destroy -auto-approve
