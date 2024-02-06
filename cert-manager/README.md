# Cert-Manager

Cert-Manager is a Kubernetes add-on to automate the management and issuance of TLS certificates from various issuing sources. It will ensure certificates are valid and up to date, and attempt to renew certificates at a configured time before expiry.

- Link to the main page: [Cert-manager](https://cert-manager.io/)
- Link to the documentation: [Cert-manager documentation](https://cert-manager.io/docs/)
- Link to GitHub : [GitHub](https://github.com/cert-manager/cert-manager)
- Link to Helm: [Helm](https://cert-manager.io/docs/installation/helm/)

## TODOs

- While in the install.sh script, add the issuers automatically from the issuers folder.

## Configurations

For this deploy there no need to change the default helm configurations. But there is need to change the issuer configurations. The issuer configurations are located in the issuers folder.

**OBS:** All the issuers originally presented are **ClusterIssuers**. If you want to use **Issuers** you need to add the configurations yaml in the issuers folder.

After installing the Cert-Manager, check the issuers .yaml files and change the necessary items. And them apply them:

For the LetsEncrypt HTTP01 Cluster Issuers:

- Check the E-mail
- Check the IngressClass

If the values above are correct, apply the files:

```bash
kubectl apply -f issuers/letsencrypt-production.yaml
kubectl apply -f issuers/letsencrypt-staging.yaml
```

For the Cloudflare DNS01 Cluster Issuers:

- **You need a Cloudflare Account with the Root Domain registered at Cloudflare.**
- Check the E-mail
- Get the API Token from the Cloudflare account and add it in the secret. It Must have the following permissions:
  - Zone.Zone:Read
  - Zone.DNS:Edit

```bash
kubectl apply -f issuers/cloudflare-production.yaml
kubectl apply -f issuers/cloudflare-staging.yaml
```

The Cloudflare ClusterIssuer is usefull for when you need to have local DNS to your cluster. It is very usefull when you are using a local cluster and you don't have a public IP. Or also when you want to pass it through Cloudflare DNS validation;.

## Install

You can deploy Cert-Manager using the following command:

```bash
./install.sh
```

## Test

To test if the Cert-Manager is working, you can deploy the following test:

```bash
kubectl apply -f examples-cert.yaml
kubectl apply -f examples-ingress.yaml
```

## Uninstall

You can uninstall Cert-Manager using the following command:

```bash
./uninstall.sh
```
