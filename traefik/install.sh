#!/bin/sh

# Variables
DIRECTORY_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P ) # This will get the current directory absolute path

# helm repo add traefik https://traefik.github.io/charts
# helm repo update
kubectl create ns traefik
helm install --namespace traefik --values $DIRECTORY_PATH/values.yaml traefik traefik/traefik