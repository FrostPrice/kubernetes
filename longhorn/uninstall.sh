#!/bin/sh

helm uninstall longhorn -n longhorn-system
kubectl delete ns longhorn-system