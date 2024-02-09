#!/bin/sh

# Variables
DIRECTORY_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P ) # This will get the current directory absolute path

helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
helm upgrade --install --namespace cattle-system --create-namespace --values $DIRECTORY_PATH/values.yaml rancher rancher-latest/rancher
