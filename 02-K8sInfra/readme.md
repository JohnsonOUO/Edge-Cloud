# K8s-Infra
## Install Tools
After nodes are done, we need to set up basic config (like network or storage) for Kubernetes.
Before deployment, we will use those tools.
### kubectl
```
curl -LO https://dl.k8s.io/release/v1.22.8/bin/linux/amd64/kubectl
```
### kubeseal
```
wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.16.0/kubeseal-linux-amd64 -O kubeseal
```
### Tutoring
if we wnat to deploy yaml file, we will use this command.
```
kubectl apply -f 'filename'
```
If we have kustomization.yaml, we can use
```
kubectl apply -k . 
```
If you want to check pod/service namespace...
```
kubectl get ns or pod or service...
kubectl get pod -n {namespace}
kubectl logs {pod} -n {namespace}
kubectl describe {pod/service...}/{name} -n {namespace}
```
If you see
```
"The connection to the server localhost:8080 was refused - did you specify the right host or port?"
# enter following commands
export TALOSCONFIG=~/cloud/00-Prepare/talosconfig
export KUBECONFIG=~/cloud/kubeconfig
```
## Dependency
1. Network
Ingress-nginx : v1.1.3
2. Storage
Mayastor : v1.0.1
Local Path Provisioner : v0.0.22
3. Load-balancer
Metallb : v0.12.1

## Set up
follow 00~07 folders and see the readme.
