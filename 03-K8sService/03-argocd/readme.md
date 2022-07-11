## Deploy argocd
```
kubectl apply -k .
```
## Get Password
```
kubectl \
 --namespace argocd \
 get secret argocd-initial-admin-secret \
 --output jsonpath="{.data.password}" \
 | base64 --decode
 ```
  ### Website : https://argocd.ninox.com
 #### Username:admin
 #### Password: 
