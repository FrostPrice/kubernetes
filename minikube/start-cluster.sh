#!/bin/sh

function clean_exit(){
    local error_code="$?"
    local spawned=$(jobs -p)
    if [ -n "$spawned" ]; then
        sudo kill $(jobs -p)
    fi
    return $error_code
}

# Set default exit function 
trap "clean_exit" EXIT

# Check if docker is running
if ! docker info > /dev/null 2>&1; then
    echo "Docker is not running. Please start Docker and try again."
    exit 1
fi

# Check if minikube is installed
if ! command -v minikube > /dev/null 2>&1; then
    echo "Minikube is not installed. Please install Minikube and try again."
    exit 1
fi

# Start Minikube Cluster with the specified resources
minikube start --cpus 4 --memory 8192

MINIKUBE_OK="false"

echo "Waiting for minikube to start..."
# this for loop waits until kubectl can access the api server that Minikube has created
for i in {1..90}; do # timeout for 3 minutes
   kubectl get pods &> /dev/null
   if [ $? -ne 1 ]; then
      MINIKUBE_OK="true"
      break
  fi
  sleep 2
done

# Shut down CI if minikube did not start and show logs
if [ $MINIKUBE_OK == "false" ]; then
  sudo minikube logs
  exit 1 $LINENO "minikube did not start"
fi

# Get Minikube IP
MINIKUBE_IP=$(minikube ip)

# Enable most used Minikube Addons
minikube addons enable metallb
minikube addons enable dashboard
minikube addons enable metrics-server
minikube addons enable csi-hostpath-driver
minikube addons enable volumesnapshots

sleep 10

# Patch MetalLB config with updated IP address range
kubectl apply -f - -n metallb-system << EOF
apiVersion: v1
kind: ConfigMap
metadata:
  name: config
  namespace: metallb-system
data:
  config: |
    address-pools:
    - name: default
      protocol: layer2
      addresses:
      - ${MINIKUBE_IP}-${MINIKUBE_IP}
EOF

sleep 5

for COMPONENT in controller speaker
do
  kubectl wait \
    --for condition=ready pod \
    -l app=metallb -l component=${COMPONENT} \
    -n metallb-system \
    --timeout=90s
done

# Apply the Ingress for the Kubernetes Dashboard
kubectl apply -f ./k8s-dashboard-ingress.yaml

# TODO: Make this more dynamic
echo "------------------------------------------------------------"
echo "Minikube IP: $MINIKUBE_IP"
echo "Please configure the following DNS on the /etc/hosts with the IP above"
echo "minikube-ui.k8s"
echo "------------------------------------------------------------"
echo "Here are the default URL"
echo "https://minikube-ui.k8s"
echo "------------------------------------------------------------"
