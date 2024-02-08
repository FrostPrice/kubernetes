# Kubernetes Dashboard

Kubernetes Dashboard is a general purpose, web-based UI for Kubernetes clusters. It allows users to manage applications running in the cluster and troubleshoot them, as well as manage the cluster itself.

**OBS:** The helm chart used is V6.\*, the values of the file `values-v7.yaml` will NOT work in lower versions. Use the respective `values-v6.yaml` file.

Link for the docs: [kubernetes-dashboard](https://github.com/kubernetes/dashboard)
Link for Helm: [Helm](https://github.com/kubernetes/dashboard/tree/master/charts/helm-chart/kubernetes-dashboard)

## Install

You can deploy Dashboard using the following command:

```bash
./install.sh
```

## Access-Control

To access the dashboard, you need to create a token. You can do this by creating a service account and cluster role binding. By default the helm will create a user. Check the documentation for more information.

**OBS**: This user will have admin priviledges

```bash
kubectl apply -f ./service-account.yaml
kubectl apply -f ./cluster-role-binding.yaml
```

Then, get the token:

```bash
kubectl get secret kubernetes-dashboard-admin -n kubernetes-dashboard -o jsonpath={".data.token"} | base64 -d
```

## Uninstall

You can uninstall Dashboard using the following command:

```bash
./uninstall.sh
```
