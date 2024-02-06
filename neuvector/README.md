# Neuvector

NeuVector is a Kubernetes security platform that delivers end-to-end vulnerability management, automated CI/CD pipeline security, and complete run-time security. NeuVector integrates with K8s to provide a comprehensive security solution for your K8s clusters.

- Link for the main page: [neuvector](https://www.suse.com/pt-br/products/neuvector/)
- Link for the docs and installation: [neuvector-docs](https://open-docs.neuvector.com/)
- Link for Github: [Github](https://github.com/neuvector/neuvector)
- Link for Helm Doc: [Helm](https://github.com/neuvector/neuvector-helm)

## Configuration

Check the `values.yaml` file for the configuration options, you can change anything with the # TODO comment.

But mainly you need to change the following:

- manager.ingress.ingressClassName: this must be your ingress class name installed
- (Optional) k3s.enabled: If your cluster is in a k3s, you need to enable this option for it to work

## Install

You can deploy and update Neuvector using the following command:

```bash
./install.sh
```

## Uninstall

You can uninstall Neuvector using the following command:

```bash
./uninstall.sh
```
