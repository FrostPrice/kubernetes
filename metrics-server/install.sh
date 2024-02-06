#!/bin/sh

# Install metrics-server components with yaml files, will install in the kube-system namespace
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.6.4/components.yaml
