#!/bin/sh

helm uninstall -n ingress-nginx ingress-nginx 
kubectl delete ns ingress-nginx