## Deploy Mayastor
Mayastor will use hugepage_2Mi, so we need to modify node hugepage . Furthermore, we need to label mayastor on the node.
```
cd ~/mayastor
bash nodeconfig.sh
```
After preparing all config, we can deploy mayastor yaml
```
cd ~/mayastor/
kubectl apply -k .
```
After deploy mayastor config, we can deploy MSP which is defined by maystor crd.
In MSP, we need to check that was dev mounted on the node or not.
```
# If you don't have disk, see 00-Prepare and 01-NodesCreate
taloctl disks -n {node ip}
```
Check msp yamls are fine, then deploy them.
```
cd ~/mayastor/Config/basic
kubectl apply -k .
```