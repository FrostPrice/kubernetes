#!/bin/sh

# Variables
DIRECTORY_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P ) # This will get the current directory absolute path

# helm repo add longhorn https://charts.longhorn.io
# helm repo update

# For generic Kubernetes
helm install longhorn longhorn/longhorn --namespace longhorn-system --create-namespace --version 1.5.1 --values $DIRECTORY_PATH/values.yaml

# Check that Longhorn is running
kubectl -n longhorn-system get pod

# For authentication and UI access
# USER=<USERNAME_HERE>; PASSWORD=<PASSWORD_HERE>; echo "${USER}:$(openssl passwd -stdin -apr1 <<< ${PASSWORD})" >> ./auth
# kubectl -n longhorn-system create secret generic basic-auth --from-file=auth