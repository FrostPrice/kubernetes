#!/bin/sh

# Uninstall metrics-server components
kubectl delete -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.6.4/components.yaml