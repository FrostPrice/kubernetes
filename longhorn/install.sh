#!/bin/sh

DIRECTORY_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P ) # This will get the current directory absolute path

# Used to create a new random user credentials
DEFAULT_USER=$(cat $DIRECTORY_PATH/.DEFAULT_USER 2>/dev/null)
DEFAULT_PASSWORD=$(cat $DIRECTORY_PATH/.DEFAULT_PASSWORD 2>/dev/null)

if [ -z "$DEFAULT_USER" ]; then
  DEFAULT_USER=$(
    echo $RANDOM | md5sum | head -c 20
    echo
  )
  echo $DEFAULT_USER >$DIRECTORY_PATH/.DEFAULT_USER
fi
if [ -z "$DEFAULT_PASSWORD" ]; then
  DEFAULT_PASSWORD=$(
    echo $RANDOM | md5sum | head -c 20
    echo
  )
  echo $DEFAULT_PASSWORD >$DIRECTORY_PATH/.DEFAULT_PASSWORD
fi

# helm repo add longhorn https://charts.longhorn.io
# helm repo update

# For generic Kubernetes
helm install longhorn longhorn/longhorn --namespace longhorn-system --create-namespace --version 1.5.1 --values $DIRECTORY_PATH/values.yaml

# Check that Longhorn is running
kubectl -n longhorn-system get pod

# For authentication and UI access
USER=$DEFAULT_USER; PASSWORD=$DEFAULT_PASSWORD; echo "${USER}:$(openssl passwd -stdin -apr1 <<< ${PASSWORD})" >> auth
kubectl -n longhorn-system create secret generic basic-auth --from-file=auth

echo ///////////////////////////////////////////////////////
echo 
echo Credential for the newly created User
echo Username: $(cat $DIRECTORY_PATH/.DEFAULT_USER)
echo Password: $(cat $DIRECTORY_PATH/.DEFAULT_PASSWORD)
echo 
echo ///////////////////////////////////////////////////////

unset DEFAULT_USER
unset DEFAULT_PASSWORD
unset USER
unset PASSWORD