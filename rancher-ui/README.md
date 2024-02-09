# Rancher

Rancher is a Kubernetes management tool to deploy and run clusters anywhere and on any provider.

Rancher can provision Kubernetes from a hosted provider, provision compute nodes and then install Kubernetes onto them, or import existing Kubernetes clusters running anywhere.

Rancher adds significant value on top of Kubernetes, first by centralizing authentication and role-based access control (RBAC) for all of the clusters, giving global admins the ability to control cluster access from one location.

Link for main page: [Rancher](https://rancher.com/)
Link for Documentation: [Rancher Documentation](https://ranchermanager.docs.rancher.com/)
Link for Github: [Rancher Github](https://github.com/rancher/rancher)
Link for Helm: [Helm](https://artifacthub.io/packages/helm/rancher-stable/rancher)

## Configuration

If you want to install Rancher, first check the Version Support Matrix to see if your Kubernetes version is supported

**[Rancher Support Matrix](https://www.suse.com/suse-rancher/support-matrix/all-supported-versions)**

**OBS:** The namespace should always be cattle-system.

If you're using DNS01 for the certificate, you need to change the following in the `values.yaml` file:
1 - ingress.tls.source: `secret`
2 - ingress.tls.secretName: `rancher-tls`
3 - ingress.extraAnnotations: `cert-manager.io/cluster-issuer: <YOUR_CLUSTER_ISSUER_DNS01>`

If you're using HTTP01 for the certificate, you need to change the following in the `values.yaml` file:
1 - ingress.tls.source: `letsEncrypt` or `rancher`
2 - ingress.tls.secretName: `rancher-tls`
3 - Do NOT add cert-manager.io/cluster-issuer to ingress.extraAnnotations as it will generate errors an not create the certificate.

## Install

To install Rancher, you can use the following command:

```bash
./install.sh
```

**NOTE:** Rancher takes a long time to start, so be patient.

After the PODs are running, you can access the Rancher UI using the following command:

```bash
echo https://rancher.kolukisa.org/dashboard/?setup=$(kubectl get secret --namespace cattle-system bootstrap-secret -o go-template='{{.data.bootstrapPassword|base64decode}}')
```

Or to get just the bootstrap password on its own, run:

```bash
kubectl get secret --namespace cattle-system bootstrap-secret -o go-template='{{.data.bootstrapPassword|base64decode}}{{ "\n" }}'
```

## Uninstall

**WARNING:** Be careful when uninstalling Rancher, since many resources was managed by it.

To uninstall Rancher, you must use the Rancher Cleanup tool:

1 - Clone it from Github: [https://github.com/rancher/rancher-cleanup](https://github.com/rancher/rancher-cleanup)
2 - Run the script `cleanup.sh`
