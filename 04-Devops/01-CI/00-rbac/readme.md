## Control what action we can do in argo workflow
```
In sensor-rbac.yaml and workflow-rbac.yaml
-> rule/resource (kind)
-> rule/verbs (action)
```
## Deploy rbac
```
kubectl apply -k .
```