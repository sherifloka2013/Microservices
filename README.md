# Azure login using my supscription ID

```bash
Azure CLI
az login
az account set --subscription b059d3da-d469-4620-a868-895ad5e41dc2
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/b059d3da-d469-4620-a868-895ad5e41dc2"
```
# Managing Azure Kubernetes Service (AKS)
```bash
az aks create --resource-group MyResourceGroup --name MyAKSCluster --node-count 1 --enable-addons monitoring --generate-ssh-keys
az aks get-credentials --resource-group MyResourceGroup --name MyAKSCluster
```

# Terraform Initialization and Planning
```bash
terraform init
terraform plan
terraform apply
```

# K8s cluster deployment
```bash
kubectl get nodes
kubectl apply -f deployment.yaml 
kubectl apply -f service.yaml
kubectl get deployment && kubectl get service 
kubectl describe deployment pwc-microservice-task
```
