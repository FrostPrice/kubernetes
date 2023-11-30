# **Kubernetes**

Link to Docs: https://kubernetes.io/docs/home/

This is a small explanation of what a understood about Google Kubernetes

> _I can't even understand my own feelings... How am I supposed to understand Kubernetes? - Anyone learning Kubernetes_

---

## References

Kubernetes Crash Course for Absolute Beginners -
TechWorld with Nana: https://www.youtube.com/watch?v=s_o8dwzRlu4&ab_channel=TechWorldwithNana

---

## **Definition**

It's an open source orchestrator tool for containers developed by Google. It means that it will help you manage your containerized application in a variaty of environments (Local Machine, Virtual Machine, Cloud Based, or Hybrid environments)

This tool is necessary because of the growth of Microservices applications or independent application in general, and decrease of Monolith applications.This means that you'll have to manage hundreads or thousands of containers, and doing so by hand, you're better of shooting yourself in the foot and leaving the tech industry

It has these usefull features:

- High availability: No downtime
- Scalability: High performance, it's easier and faster to add more services or remove them as needed - Disaster Recovery: Backup and restoration of data, if something happens with the infrastructure

---

## **Architecture**

- **Master Node (Control Panel)**: It has at least one master Node, which is a Virtual or Physical Machine. It runs several K8's processes to manage the Cluster. The control plane orchestrates the workers together. More important than the Worker Nodes, beacause it holds all the configuration and state of the Cluster, make a Backup of the Master Node!!!
  - _Node processes for Master Node_: The various components that you use to connect and manage Kubernetes. Control plane processes include API servers, ectd, Scheduler, kube-controller-manager, and cloud-controller-manager
    - _API Server_: It's a container that has the Entrypoint to the K8"s Cluster, basically it gives you access to magage the Cluster, be it by UI, API or CLI, these Entrypoint send the configurations to the Cluster (using YAML or JSON)
    - _Controller Manager_: Keeps track of what happening in the Cluster
    - _Scheduler_: Ensures the Pods placement, basically it will decide in which Node should schedule a Pod on, based on the workload and server resources on the Node
    - _etcd_: K8's backing store, it will hold the current state of the K8's in the given time, so it will save all the configuration data and the Nodes and Containers status
- **Virtual Network**: Makes it possible to craete the communication of the Nodes, by creating one unified machine
- **Worker Nodes (Node)**: Mostly referred as just "Nodes", these are connected to the Master Node. Each Node has a Kubelet process runiing on them. And each Worker Node has containers running your application. Basically all the work (nice) of running the containers, it's done by the Worker Nodes. The workers run your workloads, so they have move resources and are bigger in size
  - _Node processes for Master Node_: Include kubelet, kube-proxy, and your container runtime.
    - _Kubelet (Primary Node Agent)_ is a K8's process running on each Worker Node that makes it possible to the Worker Node to communicate with the Master Node, and even execute tasks on the Worker Node

---

## **Main Components**

### **Node & Pod**

- **Worker Node**: Simple physical or Virtual Machine, to run a process (Pod)
- **Pod**: The smallest unit that contains one or more containers along with attached storage resources, and configuration definitions. Pods are grouped together in ReplicaSets and all pods in a set run the same container images. It's basically an abstraction over Containers, you'll only work with K8's layer, never directly with Docker. A Pod will run your application, and especialy **1 application per Pod**, but you can run multiple containers in one Pod. Pods are Ephemeral, they can 'die' very easilly
  - _Communication between Pod's_: K8's will create a Virtual Network, in which each Pod will have it's own IP address (_Only Internal IP_), and they can communicate with each other using their IP address. If the Pod gets recreated, a new IP address is designated for the Pod (not the old one)

### **Service & Ingress**

- **Service**: It's a static/permanent IP Address attached to each Pod, the Lifecycle of the Pods and Service are NOT connected, that means that if a Pod 'dies' it's service will remain the same, together with it's IP address for example. You specify the type of Service on creation, it can be External or Interal Service, but the _default it's the Internal Service_. It can also work as a Load Balance between the Nodes and Replicas
- **Ingress**: As the Service only returns an IP Address, the Ingress takes the job of creating a DNS and enabling HTTPS, it's basically a specialized version of the Nginx that redirect/forward the requested URL to the correct endpoint, it works as a DNS of some sort

### **ConfigMap & Secret**

- **ConfigMap**: It's the external configuration of the application, like URL's. This ConfigMaps are connected to the Pod, so that the Pod can get those configuration. Using this feature remove the necessity to rebuld the Container Image for changes that are so intense. _Only used for non-confidential data, do NOT use it to store credentials_
- **Secret**: _Used to store secret data, like credentials, certificates, etc_. All data inside this configuration are encoded in base64, but it still not secure enough. By default, **the built-in security mechanism is not enabled!**, read the docs for more info (https://kubernetes.io/docs/concepts/configuration/secret/). So the Secret are meant to be encrypted using a Third-Party API or Cloud Providers, since K8's doesn't encrypt them automatically. You them reference/connect a Secret in a Deployment/Pod, so that they can use that information/data

PS: You may used the environment variables or properties files of your Pods/Deployments to gets the Secret of ConfigMap data

### **Volumes**

REMEMBER: A container is volatile, without a volume all data 'stored' in the container will be lost after the container is down. To save the data use a volume

If a Pod has data inside of it and is redeployed, all the data will be gone, unless you use a Volume to save the data.
A Volume is a Physical Storage HD/SSD that is attached to the Pod. That Storage can be on the Local Machine (where K8's Cluster is running) or on a Remote Storage (Outside the K8's Cluster).

The Remote Storage can be on a Cloud Based or your own service of storage

**Kubernetes doesn't manage any data persistence! You must manage the persistent data youself (Backup, Restoration, etc...)**

### **Deployments & StatefulSet**

With distribuited systems you can Replicate Everything, meaning that you'd reduce the downtime of the application to basically none, together with some other benefits:

- Besides copying everything in the Node for reducing the downtime
- The Service in the 'original' Pod will be accessed also by the replicas
- The Service will create a Load Balance and will send the request to the apropriate Pod

To create the replicas of the Pods you must use the **Deployment**. Usually to create a Pod, you would also use a **Deployment**

**Deployment**: Configured and operational resources. Deployments are the overall processes that enable you to orchestrate your resources. It's a blueprint for the Pods, you can define the amount of Replicas you want this Pods to have. It's an abstraction of Pods. Used for StateLess Apps

PS: If you need to replicate a Pod that has Persistent Data (aka Volume), _you CANNOT use Deployment, and MUST use the StatefulSet_

**StatefulSet**: Used for StateFul Apps or Databases. It takes care of replicating the Pods and scaling them. But it's not as easy as an Deployment to configure. Databases are often hosted outside the K8's Cluster.

---

## **Configuring Kubernetes**

The configuration in K8's is **Declarative**, and can be done through UI, APIor CLI

Some attributes of the configuration:

- kind: It's the tipe of Component you're creating (Service, Deployment, Ingress, etc...)
- apiVersion: The API used by the component. It can be a K8's API or an Third Party one

There is 3 parts when configuring K8's:

- Metadata: Of the component your creating, like Name of the component itself
- Specifications: Every configuration that you want to apply to that component, like the amount of Replicas. The Specification atributes are specific also to the kind of the component, so a kind Deployment will have different attributes to be used when compared to a kind Service
- Status: _Automatically generated and added by Kubernetes_. It's the current state of the component

The K8's will compare the desired state (based on the Speficitaions) with the actual state of the component (based on the Status), and if there is a difference, the K8's will on it's own try to fix the problem. K8's will update the state continuously

**REMEMBER: The etcd holds the current status of anu K8's component**

The YAML file has Strict Identation. And is a common practice to store the YAML config failes with the Code of the application or have an onw Git repository only for the YAML Config Files

## **Minikube**

Link: https://minikube.sigs.k8s.io/docs/start/

Production Cluster Setup:

- Multiple Master and Worker Nodes
- Separated Physical or Virtual Machine

Test/Local Setup (With Minikube):

- One Master and One Worker Node
- Run on a single machine
- Must have Docker pre-installed

Minikube has a Docker pre-installed to run the container in the Cluster. but you need to have Docker on your machine to run Minukube

Driver means we are hosting Minikube as a container on our local machine

The Structure is as follows:

1. Minikube runs as a Docker Container
2. Docker inside Minikube to run our application Containers

##### start Minikube and check status

    minikube start --vm-driver=hyperkit
    minikube status

##### get minikube node's ip address

    minikube ip

##### stop your Minikube cluster

    minikube stop

---

## **Kubectl**

Link: https://kubernetes.io/docs/tasks/tools/

It's a command line tool (CLI) for any type of K8's Cluster, and you can use it with Minikube. And with it you can do anything you want with K8's

To use a configuration created in a file: kubectl apply -f FILE_NAME.yaml

##### get basic info about k8s components

    kubectl get node
    kubectl get pod
    kubectl get svc
    kubectl get all

##### get extended info about components

    kubectl get pod -o wide
    kubectl get node -o wide

##### get detailed info about a specific component

    kubectl describe svc {svc-name}
    kubectl describe pod {pod-name}

##### get application logs

    kubectl logs {pod-name}

#### list namespaces

    kubectl get namespaces

##### list pods in a namespace

    kubectl -n {namespace} get pods

#### get every resource in all namespaces

    kubectl get {resource} -A

    or

    kubectl get {resource} --all-namespaces

#### exec command in pod (You may initiate a shell connection)

    kubectl exec -it {container-pod-name} -- {command}
---

## **Misc**

**ReplicaSet**: Sets of pods that provide the resources for your services.

**Node cluster**: Control plane and worker nodes that each contain one or more pods. This is what is created by Minikube.

**Container**: The image you create to hold your applications.

It's common to add the Deployment and Service in the same configuration file

The template attribute is a configuration of the Pod within the configuration of the Deployment. The template has it's own metadata and spec. You can have multiple containers inside the containers attribute.

- Label: Is a key/value pair that are attached to K8's resources. You can give any K8's component a label. They are identifiers, in which should be meaningful and relevant to users. They do NOT provide uniquiness, all Pods have unique names but they can have the same Label. With labels you can select multiple components at the same time

- Selector: is a way to select the Labels, in a way to identify the resources and determine which Pod belongs to the Deployment
  - matchLabels: a selector working like a if statement that searches for the key/value pair Labels

To separate multiple YAML configuration within 1 file use this: ---

Instaling kube-config manually:
   
    mkdir -p $HOME/.kube
    sudo cp -i my-kube-config.conf $HOME/.kube/config
    sudo chown $(id -u):$(id -g) $HOME/.kube/config
