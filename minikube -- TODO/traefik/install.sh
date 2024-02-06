#!/bin/sh

# Variables
DIRECTORY_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P ) # This will get the current directory absolute path

helm repo add traefik https://traefik.github.io/charts
helm upgrade --install --namespace traefik --create-namespace --values $DIRECTORY_PATH/values.yaml traefik traefik/traefik

#TODO * Implement the dashboard ingress and generate a random user