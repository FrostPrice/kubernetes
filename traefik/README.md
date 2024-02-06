# Traefik

Traefik is a modern HTTP reverse proxy and load balancer that makes deploying microservices easy. Traefik integrates with your existing infrastructure components and configures itself automatically and dynamically.

- Link for the main page: [traefik](https://traefik.io/)
- Link for the docs and installation: [traefik-docs](https://doc.traefik.io/traefik/)
- Link for Github: [Github](https://github.com/traefik/traefik/)
- Link for Helm: [Helm](https://github.com/traefik/traefik-helm-chart)

## TODOs

- The username and password for the dashboard could be done in the ./install.sh script. And generate a random password for the user after installing traefik.

## Configuration

The basic configuration in the `values.yaml` already have the basic configuration for the Traefik, but you can change the configuration as you want.

If you plan on using Neuvector with Traefik, you must uncomment the annotations in the `values.yaml` file. The annotations are:

```yaml
annotations:
  neuvector.com/scan: "true"
  neuvector.com/scan-time: "300"
  traefik.ingress.kubernetes.io/auth-type: "forward"
  traefik.ingress.kubernetes.io/auth-response-headers: "X-Forwarded-User"
  traefik.ingress.kubernetes.io/auth-url: "http://neuvector-controller-service.neuvector:1025/k8s_auth"
```

**OBS:** The dashboard is NOT enabled in the helm chart, due to security concerns it's better to enabled it manually.

Please, check the following files:

- In the 0-cert.yaml file, change the issuer to your issuer, and the domain to your domain.
- In the 1-dashboard-auth.yaml, cahnge the data.user value to a strong username and password:
- Linux command to generate a base64 credential: `bash echo -n -e "<USERNAME>:$(openssl passwd -apr1 <PASSWORD>)" | base64`
- In the 2-ingress.yaml, change the host to your domain.

## Install

You can deploy and update Traefik using the following command:

```bash
./install.sh
```

## Uninstall

You can uninstall Traefik using the following command:

```bash
./uninstall.sh
```
