#!/bin/sh

# Variables
DIRECTORY_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P ) # This will get the current directory absolute path

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm upgrade --install --namespace ingress-nginx --create-namespace --values $DIRECTORY_PATH/values.yaml ingress-nginx ingress-nginx/ingress-nginx