## K8s-Service
After K8s-Infra is finished, we can deploy those Application.
## Install Helm
We will use helm to install.
```
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```
## Dependency
Gitea : v5.0.6
Harbor : v1.9.0
ArgoCD : v2.3.3
ArgoWorkdlow : v3.3.3
Velero : v2.30.1

## Deploy Applications
follow 00~05 folders and see the readme.
