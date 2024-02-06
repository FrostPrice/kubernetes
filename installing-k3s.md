# Start K3s Cluster

## Install Script

For most instalations it's preferred to add the followging flags to the install script:

- --prefer-bundled-bin: so the k3s binary is used instead of the system one, to avoid problems with iptables.
- --write-kubeconfig-mode=644: so the kubeconfig file is created with the right permissions, and remove the necessity to change it later.
- --disable=traefik: so no the default ingress and you must configure one from the ground up, so to have more control of the ingress.

```bash
curl -sfL https://get.k3s.io | sh -s - --prefer-bundled-bin --write-kubeconfig-mode=644 --disable=traefik
```

## Uninstall Script

To uninstall k3s, you can use the following for the server:

```bash
/usr/local/bin/k3s-uninstall.sh
```

And the following for the agent:

```bash
/usr/local/bin/k3s-agent-uninstall.sh
```
