# -------------------------------------------------------------
# File Name: create_folders.tf
# Create a VM folder and sub folder on given datacenter.
#
# Tue Nov 3 12:59:12 BST 2020 - juliusn - initial script
# -------------------------------------------------------------

# -- Provider
provider "vsphere" {
    user                    = var.provider_vsphere_user
    password                = var.provider_vsphere_password
    vsphere_server          = var.provider_vsphere_host
    allow_unverified_ssl    = var.provider_vsphere_unverified_ssl
}

# -- Data sources
data "vsphere_datacenter" "target_dc" {
    name = var.vsphere_datacenter
}

resource "vsphere_folder" "parent_folder" {
    path          = var.vsphere_folder
    type          = "vm"
    datacenter_id = data.vsphere_datacenter.target_dc.id
}

resource "vsphere_folder" "sub_folder" {
    path          = "${vsphere_folder.parent_folder.path}/${var.vsphere_sub_folder}"
    type          = "vm"
    datacenter_id = data.vsphere_datacenter.target_dc.id
    depends_on    = [vsphere_folder.parent_folder]
}