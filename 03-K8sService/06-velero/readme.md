## Deploy velero
Velero is a backup application
we can choose S3 or C2 to backup
Now we use C2 be a storage place.
```
kubectl apply -k .
helm -n velero install velero vmware-tanzu/velero -f velero_values.yaml --set-file credentials.secretContents.cloud=/tmp/credentials-velero-c2
```