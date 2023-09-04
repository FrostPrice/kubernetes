#!/bin/sh

# Variables
DIRECTORY_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P ) # This will get the current directory absolute path

# helm repo add neuvector https://neuvector.github.io/neuvector-helm/
# helm repo update
kubectl create ns neuvector
kubectl label ns neuvector "pod-security.kubernetes.io/enforce=privileged"
helm install --namespace neuvector --values $DIRECTORY_PATH/values.yaml neuvector neuvector/core