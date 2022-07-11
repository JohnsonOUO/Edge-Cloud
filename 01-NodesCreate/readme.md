# Nodes-Create
we will use terraform to create vm quickly.
## Install Terraform
terraform is the cli.
Hence we need to download first.
```
# If your UserAccount is root, remove 'sudo' in following commands
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt update
sudo apt install terraform
```

## Initialize
we can see Terraform basic information and provider installation
```
cd ~/cloud/terraform-proxmox/
terraform init
```
## Modify
we will modify terraform config in main.tf
```
nano ~/cloud/terraform-proxmox/main.tf
# modify those args
-> pm_api_url = "https://{ProxmoxIP:Port}/api2/json"
-> pm_api_token_id = "{Token_id from Proxmox}"
-> pm_api_token_secret = "{Secret from Proxmox}"
```
## Check
Use terraform plan to check config is correct.
if we finish, we can see.
```
cd ~/cloud/terraform-proxmox/
terraform plan
.
.
.
Plan: 0 to add, 6(by your setting) to change, 0 to destroy.

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run
"terraform apply" now.
```
## Create nodes
Execute the Terraform plan and watch the VMs appear!
```
cd ~/cloud/terraform-proxmox/
terraform apply
# Enter the value: yes
.
.
.
# see this message that means you are success.
Apply complete! Resources: 6 added, 0 changed, 0 destroyed.
```
## Set up nodes
Make nodes connect together.
Nodes will take a little time for ready.
```
cd ~/cloud
bash bootstrap.sh
```
bootstrap.sh
```
#!/bin/bash
export TALOSCONFIG=~/cloud/00-Prepare/talosconfig
export KUBECONFIG=~/cloud/kubeconfig

talosctl -e 10.20.0.11 -n 10.20.0.11 bootstrap # First time
talosctl kubeconfig  ~/cloud

```
## P.S
### Modify Numbers
If you want to controll nodes number, we can modify vars.tf
```
nano ~/cloud/01-NodesCreate/vars.tf 
-> master:{Number} 
-> worker:{Number}
```
### Mount Disk
If we wnat to mount disk on the node, we need to modify main.tf.
```
nano ~/cloud/01-NodesCreate/main.tf
# storage we need to create on the proxmox first. 
disk {
    type = "scsi"
    storage = "outstore${count.index + 1}"
    size = "80G"
  }

```