# **Kubectl**

Link: [Kubernetes Tools](https://kubernetes.io/docs/tasks/tools/)

It's a command line tool (CLI) for any type of K8's Cluster, and you can use it with Minikube. And with it you can do anything you want with K8's

To use a configuration created in a file: kubectl apply -f FILE_NAME.yaml

## Get basic info about k8s components

```bash
kubectl get node
kubectl get pod
kubectl get svc
kubectl get all
```

## Get extended info about components

```bash
kubectl get pod -o wide
kubectl get node -o wide
```

## Get detailed info about a specific component

```bash
kubectl describe svc {svc-name}
kubectl describe pod {pod-name}
```

## Get application logs

```bash
kubectl logs {pod-name}
```

## List namespaces

```bash
kubectl get namespaces
```

## List pods in a namespace

```bash
kubectl -n {namespace} get pods
```

## Get every resource in all namespaces

```bash
kubectl get {resource} -A
```

or

```bash
kubectl get {resource} --all-namespaces
```

## exec command in pod (You may initiate a shell connection)

```bash
kubectl exec -it {container-pod-name} -- {command}
```
