## RBAC
here is to control what actions we can do in argo workflow
```
In sensor-rbac.yaml and workflow-rbac.yaml
-> rule/resource (kind)
-> rule/verbs (action)
```
## Deploy rbac
```
kubectl apply -k .
```