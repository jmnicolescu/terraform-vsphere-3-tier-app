# -------------------------------------------------------------
# File Name: main.tf
# Deploy a new VM from a template.
#
# REQUIREMENTS #1: vsphere_tag_category and vsphere_tag must exist
#                  cd helpers/tags && terraform apply
# REQUIREMENTS #2: deploy_vsphere_folder and deploy_vsphere_sub_folder must exist
#                  cd helpers/folders && terraform apply
#
# Tue Nov 2 12:59:12 BST 2020 - juliusn - initial script
# -------------------------------------------------------------

# -- Provider
provider "vsphere" {
    user                    = var.provider_vsphere_user
    password                = var.provider_vsphere_password
    vsphere_server          = var.provider_vsphere_host
    allow_unverified_ssl    = var.provider_vsphere_unverified_ssl
}

# -------------------------------------------------------------
# VM deployment - VM configuration files
# -------------------------------------------------------------

module "vm-deployment" {
    source = "./vm-deployment"
}

# -------------------------------------------------------------
# Example - output files
# -------------------------------------------------------------

output "nat-web01-VM-ip" {
	value = module.vm-deployment.nat-web01-VM-ip
}

output "nat-app01-VM-ip" {
	value = module.vm-deployment.nat-app01-VM-ip
}

output "nat-db01-VM-ip" {
	value = module.vm-deployment.nat-db01-VM-ip
}
