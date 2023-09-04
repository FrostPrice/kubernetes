#!/bin/sh

# Install metrics-server components with yaml files
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.6.4/components.yaml

# Install metrics-server components with helm
# helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/
# helm repo update

