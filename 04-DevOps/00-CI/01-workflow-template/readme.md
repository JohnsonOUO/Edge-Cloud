## workflow pipeline 
First we check " secret, url , --destination" in yaml are correct.  
```
clusterworkflowtemplate/*.yaml -> check git/repo is gitea website and secret is correct
workflowtemplate/{WhichYouUse}.yaml harbor secret is correct
kustomization.yaml -> check files I want to apply
```
### Modify pipeline
If I want to modify process
```
In workflowtemplate
create or delete work : template/name/(depend)
```
If I want to modify each pod's work
```
In clusterworkflowtemplate
create or delete : container/args
```
### Execute
```
kubectl apply -k .
```