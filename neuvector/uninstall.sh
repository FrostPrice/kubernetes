#!/bin/sh

helm uninstall neuvector -n neuvector
kubectl delete ns neuvector