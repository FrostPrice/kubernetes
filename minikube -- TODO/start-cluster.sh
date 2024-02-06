#!/bin/sh

# Start Minikube Cluster with the specified resources
minikube start --cpus 4 --memory 8192
# --kubernetes-version=v1.27.0

# Enable most used Minikube Addons
minikube addons enable dashboard
minikube addons enable metrics-server
minikube addons enable csi-hostpath-driver
# minikube addons enable ingress-dns # This will be configured later, since I'll need to check if this addon only works with other addon "Ingress"

# Apply the Ingress for the Kubernetes Dashboard
kubectl apply -f ./k8s-dashboard-ingress.yaml

# Install the helm programs
# ./nginx/install.sh
./traefik/install.sh
# ./neuvector/install.sh

MINIKUBE_IP=$(minikube ip)

# TODO: Make this more dynamic
echo "------------------------------------------------------------"
echo "Minikube IP: $MINIKUBE_IP"
echo "Please configure the following DNS on the /etc/hosts with the IP above"
echo "minikube-ui.k8s"
echo "traefik-ui.k8s"
echo "neuvector-ui.k8s"
echo "------------------------------------------------------------"
echo "Here are the default URL"
echo "https://minikube-ui.k8s"
echo "http://traefik-ui.k8s/dashboard/"
echo "http://neuvector-ui.k8s"
echo "------------------------------------------------------------"
