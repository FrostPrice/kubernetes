#!/bin/sh

# Variables
DIRECTORY_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P ) # This will get the current directory absolute path

# Install Nginx Ingress in the ingress-nginx namespace with default scripts yaml
# kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.1/deploy/static/provider/cloud/deploy.yaml

# helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
# helm repo update
kubectl create ns ingress-nginx
helm install --namespace ingress-nginx --values $DIRECTORY_PATH/values.yaml ingress-nginx ingress-nginx/ingress-nginx