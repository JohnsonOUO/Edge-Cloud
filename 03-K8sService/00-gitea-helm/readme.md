## Deploy gitea
```
helm repo add gitea-charts https://dl.gitea.io/charts/
kubectl apply -k .
helm install -f helm-config2.yaml -n gitea gitea gitea-charts/gitea
```
#### Website : https://gitea.ninox.com
## About webhook in gitea
In helm-config.yaml, if we need webhook, we must add
-> gitea/config/webhook/ALLOWED_HOST_LIST: "*"
-> gitea/config/webhook/SKIP_TLS_VERIFY: "true"