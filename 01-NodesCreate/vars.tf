variable "proxmox_host" {
    default = "ninox"
}
variable "template_name" {
    default = "kubernetes"
}

variable "num_master" {
    default = 1
}

variable "num_worker" {
    default = 5
}