#!/bin/sh

helm uninstall -n traefik traefik 
kubectl delete ns traefik