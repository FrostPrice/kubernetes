#!/bin/sh

helm uninstall kubernetes-dashboard -n kubernetes-dashboard
kubectl delete ns kubernetes-dashboard