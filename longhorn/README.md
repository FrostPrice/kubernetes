# Longhorn

Longhorn implements distributed block storage using containers and microservices. Longhorn creates a dedicated storage controller for each block device volume and synchronously replicates the volume across multiple replicas stored on multiple nodes. The storage controller and replicas are themselves orchestrated using Kubernetes. Here are some notable features of Longhorn:

- Link for the main page: [longhorn](https://longhorn.io/)
- Link for the docs and installation: [longhorn](https://longhorn.io/docs/)
- Link for Github: [Github](https://github.com/longhorn/longhorn)
- Link for Helm: [Helm](https://github.com/longhorn/longhorn/tree/master/chart)

## TODOs

- Implement the dashboard ingress with the generated random user credentials

## Configuration

Most of the time, there is no need to change the default configuration. But, you may change the `values.yaml` to fit your needs.
The ingress is disabled in the default configuration to ensure security. If you want to enable it, you can apply with the ingress.yaml file.

## Install

To install Longhorn, you can use the following command:

```bash
./install.sh
```

## Uninstall

To uninstall Longhorn, you can use the following command:

```bash
./uninstall.sh
```
