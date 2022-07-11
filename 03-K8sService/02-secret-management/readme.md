## Create secret
```
kubectl create secret generic gitea-general --from-literal=username=root --from-literal=token=64fc76f0b9a0e039434d9e322fee6a485ffa4a7b --dry-run=client -o yaml > secret/gitea-general-secret.yaml
kubectl create secret generic gitea-argocd --from-literal=type=git --from-literal=url=http://gitea-http.gitea.svc.cluster.local:3000/root --from-literal=username=root --from-literal=password=64fc76f0b9a0e039434d9e322fee6a485ffa4a7b --dry-run=client -o yaml > secret/gitea-argocd-secret.yaml
kubectl create secret docker-registry harbor-core-secret --docker-username=admin --docker-password=Harbor12345 --docker-server=harbor-core.harbor-system.svc.cluster.local --dry-run=client -o yaml > secret/harbor-registry-secret.yaml
```
## let secret -> sealedsecret
```
kubeseal <secret/gitea-general-secret.yaml -o yaml > sealed-secret/gitea-general-sealedsecret.yaml
kubeseal <secret/gitea-argocd-secret.yaml -o yaml > sealed-secret/gitea-argocd-sealedsecret.yaml
kubeseal <secret/harbor-registry-secret.yaml -o yaml > sealed-secret/harbor-registry-sealedsecret.yaml
```
## Modify sealedsecret that we can get those
Annotation : if we want to do it with configmaps, this is exactly the same process, we need this annotation. 
Label : we can get those in other namespaces
```
In gitea-general-sealedsecret.yaml, harbor-registry-sealedsecret.yaml
-> add spec.template.metadata.annotations: 
          kubed.appscode.com/sync: "cicd=kubed"

In gitea-argocd-sealedsecret.yaml
-> add spec.template.metadata.annotations: 
          kubed.appscode.com/sync: "argocd=kubed"
-> add spec.template.metadata.labels:
          argocd.argoproj.io/secret-type: repo-creds
```
## Deploy sealed secret
```
kubectl apply -k .
```