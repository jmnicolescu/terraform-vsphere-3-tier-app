# -------------------------------------------------------------
# File Name: nat-web01.tf
# Deploy a new VM from a template.
#
# REQUIREMENTS #1: vsphere_tag_category and vsphere_tag must exist
#                  cd helpers/tags && terraform apply
# REQUIREMENTS #2: deploy_vsphere_folder and deploy_vsphere_sub_folder must exist
#                  cd helpers/folders && terraform apply
#
# Tue Nov 2 12:59:12 BST 2020 - juliusn - initial script
# -------------------------------------------------------------

# -------------------------------------------------------------
# Create web server - nat-web01
# -------------------------------------------------------------

module "nat-web01" {
    source          = "../modules/vsphere-deploy-linux-vm/"
    # -------------------------------------------------------------
    # INFRASTRUCTURE - VMware vSphere vCenter settings 
    # -------------------------------------------------------------
    vsphere_datacenter   = "EAST-DC"
    vsphere_cluster      = "EAST-Cluster"
    vsphere_datastore    = "vsanDatastore"
    vsphere_folder       = "Production"
    vsphere_sub_folder   = "Applications"

    # -------------------------------------------------------------
    # GUEST - VMware vSphere VM settings 
    # -------------------------------------------------------------
    guest_template          = "CentOS7-Template-noX"
    guest_template_folder   = "Templates"
    guest_vm_name           = "nat-web01"
    guest_vcpu              = "1"
    guest_memory            = "4096"
    guest_disk0_size        = "30"
    guest_network           = "lab-mgmt"
    guest_ipv4_address      = "192.168.111.49"
    guest_ipv4_netmask      = "24"
    guest_ipv4_gateway      = "192.168.111.1"
    guest_dns_servers       = "192.168.111.111"
    guest_dns_suffix        = "flexlab.local"
    guest_domain            = "flexlab.local"
       
    guest_category_name     = "CUSTOM-CATEGORY"
    guest_tag_name          = "CUSTOM-TAG"
}

output "nat-web01-VM-ip" {
	value = module.nat-web01.VM-ip
}
output "nat-web01-VM-guest-ip" {
	value = module.nat-web01.VM-guest-ip
}

