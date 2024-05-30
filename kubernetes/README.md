# Instalar nginx-ingress en kubernetes

```bash
helm install nginx-ingress ingress-nginx/ingress-nginx --set controller.publishService.enabled=true
```

Espera que levante el LoadBalancer y se refleja la IP

```bash
kubectl --namespace default get services -o wide -w nginx-ingress-ingress-nginx-controller
```

Elimina el validador del ingress

```bash
ubectl delete validatingwebhookconfiguration nginx-ingress-ingress-nginx-admission
```

Aplica y despluega el ingress


# Inicializar secretos y helm charts
```bash
chmod +x /kubernetes/scripts/init.sh
```

```bash
cd /kubernetes/scripts
./install_apps.sh
```