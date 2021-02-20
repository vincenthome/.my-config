# Kubernetes Cluster - Create, Connect, Deploy to Cluster

## Azure Kubernetes Service (AKS)

- Create a resource group `az group create --name myResourceGroup --location eastus`
- Create AKS cluster `az aks create --resource-group myResourceGroup --name myAKSCluster --node-count 1 --enable-addons monitoring --generate-ssh-keys`
- Connect to the cluster
  - Downloads credentials, config kubectl: `az aks get-credentials --resource-group myResourceGroup --name myAKSCluster` (use default location for the Kubernetes configuration file ~/.kube/config) 
  - Verify the connection: `kubectl get nodes`
- Deployment: `kubectl apply -f deployment.yaml`
- Service: `kubectl apply -f service.yaml`
  - type: ClusterIP/LoadBalancer
- Display Info Deployment/Service
  - `kubectl get pods -o=wide`
  - `kubectl get services`
  - `kubectl describe deployments nginx`
  - `kubectl describe services nginx`
- Cleanup
  - `kubectl delete services nginx`
  - `kubectl delete deployment nginx`

## Book - kubectl: Command-Line Kubernetes in a Nutshell 

- Code: [https://github.com/PacktPublishing/kubectl-Command-Line-Kubernetes-in-a-Nutshell](https://github.com/PacktPublishing/kubectl-Command-Line-Kubernetes-in-a-Nutshell)


