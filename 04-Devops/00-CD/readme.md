# Continuous Deployment
## Push repo to gitea first
```
git init .
git add -A
git commit -m "str"
#if git remote -v has some url -> git remote remove origin
git remote add origin https://gitea.ninox.com/root/{repo_name}.git
git push -u origin master
#if push fail -> git config --global http.sslVerify false
```
## Deploy Service
```
kubectl apply -k .
```