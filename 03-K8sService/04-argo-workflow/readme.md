## Deploy Argo Workflow
```
kubectl apply -k .
```
## Login web
website needs to know which pod it can entry
```
kubectl get pod -n workflows #copy {pod-server-name}
kubectl -n workflows exec pod/{pod-server-name} -- argo auth token ## copy all
#open argoworkflow.ninox.com
#paste {copy all}
```
### Website : https://argoworkflow.ninox.com