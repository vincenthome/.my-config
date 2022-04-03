# To explore k8s 

## Modify nginx.conf server -> listen port # to anything other than 80

## Use Dockerfile to build a custom nginx image

## Use Kubectl apply -f nginx.yaml (kaf) to deploy 

## Use curl to test 
  - Loop `for i in {1..3}; do curl xyz:port; done`

  - Inside Cluster (ClusterIP) -> Inside Pod/Container -> kubectl exec pod/container
    - `curl service_name_or_serviceIp:Port`  
    - `curl localhost_or_podIp:TargetPort` 
  
  - Outside Cluster -> Inside Node [Link](https://docs.microsoft.com/en-us/azure/aks/node-access#create-an-interactive-shell-connection-to-a-linux-node)
    - `kubectl debug node/node_name -it --image=mcr.microsoft.com/dotnet/runtime-deps:6.0`
    - `apt update && apt upgrade && apt install curl`
    - `curl localhost_or_NodeIP:NodePort`

  - Outside Cluster -> Public w/ LoadBalancer
    - `curl external_ip:Port`

## Use an HTTP Proxy to Access the Kubernetes API

  - `kubectl Proxy --port=port#` 
  - `kubectl get <object> -v 6` this will discover the api url for the object 
  - `curl localhost:port#/apis/apps/v1/namespaces/default/deployments` same as kubectl get deployments
