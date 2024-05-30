# Todo:
- [x] Repositorio de código en un SVC como GitHub, GitLab o Bitbucket.
- [ ] Documentación que describa la arquitectura del proyecto, la configuración de la infraestructura, los pasos de implementación de DevOps y las prácticas seguidas.
- [ ] Pipeline de CI/CD configurado y funcionando para el despliegues.
- [x] Aplicación desplegada y ejecutándose correctamente en un clúster de Kubernetes
- [ ] Herramientas de observabilidad configuradas y proporcionando información útil sobre el estado y rendimiento de la aplicación
- [ ] Cómo funciona, cómo se conecta
- [ ] Puntos clave que quieran destacar


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