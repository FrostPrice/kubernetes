# Nginx

The Nginx Ingress Controller is a Kubernetes Ingress controller that uses ConfigMap to store the Nginx configuration. This configuration is the same configuration file that you would use with the `nginx` command to start a standalone Nginx server.

- Link for the main page: [nginx](https://www.nginx.com/)
- Link for the docs and installation: [nginx-ingress](https://kubernetes.github.io/ingress-nginx/)
- Link for Github: [Github](https://github.com/kubernetes/ingress-nginx)
- Link for Helm: [Helm](https://github.com/kubernetes/ingress-nginx/tree/main/charts/ingress-nginx)

## Configuration

Most of the time, there is no need to change the default configuration. But, you may change the `values.yaml` to fit your needs.

The only point of attention if the `controller.service.type`, if you have an LB available, you can can leave the service type to LoadBalancer, and the service will be exposed to the internet. Else, you can use the ClusterIP type with `controller.service.externalIPs` with your machine IP.

## Install

You can deploy and update Nginx using the following command:

```bash
./install.sh
```

## Uninstall

You can uninstall Nginx using the following command:

```bash
./uninstall.sh
```
