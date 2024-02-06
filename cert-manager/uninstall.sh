#!/bin/sh

# Verify that there is no resource created by cert-manager
kubectl get Issuers,ClusterIssuers,Certificates,CertificateRequests,Orders,Challenges --all-namespaces

# Uninstall cert-manager
helm --namespace cert-manager delete cert-manager

# Delete namespace cert-manager
kubectl delete namespace cert-manager