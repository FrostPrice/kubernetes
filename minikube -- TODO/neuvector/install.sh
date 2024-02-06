#!/bin/sh

# Variables
DIRECTORY_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P ) # This will get the current directory absolute path

helm repo add neuvector https://neuvector.github.io/neuvector-helm/
kubectl label ns neuvector "pod-security.kubernetes.io/enforce=privileged"
helm upgrade --install --namespace neuvector --create-namespace --values $DIRECTORY_PATH/values.yaml neuvector neuvector/core