#!/bin/sh

# It will automatically create the kubernetes-dashboard namespace

# Variables
DIRECTORY_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P ) # This will get the current directory absolute path

helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
helm upgrade --install --namespace kubernetes-dashboard --create-namespace kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard --values $DIRECTORY_PATH/values-v6.yaml --version 6.0.8