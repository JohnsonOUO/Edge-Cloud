## Deploy Harbor
```
helm repo add harbor https://helm.goharbor.io
kubectl apply -k .
helm install -f helm-config.yaml -n harbor-system harbor harbor/harbor
```
## Website :  https://harbor.ninox.com

## P.S
In helm-config.yaml
there is a externalURL : https://harbor-core.harbor-system.svc.cluster.local. It's for argo workflow that it can know where is harbor.

expose/ingress/hosts/core: {Your harbor website}
