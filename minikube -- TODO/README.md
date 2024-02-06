# **Minikube**

Link: [Minikube Docs](https://minikube.sigs.k8s.io/docs/start/)

## TODOs

- Improve the start-cluster.sh
- Create the stop-cluster.sh
- Fix the nginx, neuvector and traefik deployments

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
