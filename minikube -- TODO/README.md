# **Minikube**

Minikube is a tool that makes it easy to run Kubernetes locally. Minikube runs a single-node Kubernetes cluster inside a VM on your laptop for users looking to try out Kubernetes or develop with it day-to-day.

**OBS:** This is a simple setup to run a local Kubernetes Cluster using Minikube. This is NOT a production setup.

Link: [Minikube Docs](https://minikube.sigs.k8s.io/docs/start/)

Production Cluster Setup:

- Multiple Master and Worker Nodes
- Separated Physical or Virtual Machine

Test/Local Setup (With Minikube):

- One Master and One Worker Node
- Run on a single machine
- Must have Docker pre-installed

Minikube has a Docker pre-installed to run the container in the Cluster. but you need to have Docker on your machine to run Minukube

Driver means we are hosting Minikube as a container on our local machine

The Structure is as follows:

1. Minikube runs as a Docker Container
2. Docker inside Minikube to run our application Containers

## Start Cluster

You can run the following script to start the Minikube Cluster

```bash
./start-cluster.sh
```

The script will do the following:

- Start Minikube with 4 CPUs and 8GB of RAM
- Enable the addons:
  - metallb
  - metrics-server
  - dashboard
  - csi-hostpath-driver
  - volumesnapshots
- Configure the Metallb LoadBalancer IP to be the Minkube IP
- Apply the Kubernetes Dashboard Ingress
- After the script is done, you may use the Minkube as you desire. You can even install the other services informed in this repository.

### Start Minikube and check status

```bash
minikube start --vm-driver=hyperkit
minikube status
```

### Get minikube node's ip address

```bash
minikube ip
```

### Stop your Minikube cluster

```bash
minikube stop
```
