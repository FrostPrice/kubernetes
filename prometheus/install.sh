#!/bin/sh

# Variables
DIRECTORY_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P ) # This will get the current directory absolute path

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm upgrade --install --namespace prometheus --create-namespace --values $DIRECTORY_PATH/values.yaml prometheus prometheus-community/kube-prometheus-stack