#!/bin/sh

# Install Cert Manager with Helm
helm repo add jetstack https://charts.jetstack.io
helm upgrade --install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --set installCRDs=true