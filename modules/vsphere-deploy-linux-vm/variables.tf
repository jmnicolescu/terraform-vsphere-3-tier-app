# -------------------------------------------------------------
# File Name: variables.tf
# Defining simple variables required for VM deployment
#
# Tue Nov 3 12:59:12 BST 2020 - juliusn - initial script
# -------------------------------------------------------------

# -------------------------------------------------------------
# INFRASTRUCTURE - VMware vSphere vCenter settings 
# -------------------------------------------------------------

variable "vsphere_datacenter" {
    description = "vSphere datacenter in which the virtual machine will be deployed."
}

variable "vsphere_cluster" {
    description = "vSphere cluster in which the virtual machine will be deployed."
}

variable "vsphere_datastore" {
    description = "Datastore in which the virtual machine will be deployed."
}

variable "vsphere_folder" {
    description = "The path to the folder to put this virtual machine in, relative to the datacenter that the resource pool is in."
}

variable "vsphere_sub_folder" {
    description = "The path to the sub folder to put this virtual machine in."
}

# -------------------------------------------------------------
# GUEST - VMware vSphere VM settings 
# -------------------------------------------------------------

variable "guest_template" {
    description = "The source virtual machine or template to clone from."
}

variable "guest_template_folder" {
    description = "The templates folder."    
}

variable "guest_vm_name" {
    description = "VM Name" 
}

variable "guest_vcpu" {
    description = "The number of virtual processors to assign to this virtual machine."
}

variable "guest_memory" {
    description = "The size of the virtual machine's memory, in MB. Default: 1024 (1 GB)."
}

variable "guest_disk0_size" {
    description = "The size of the virtual first disk. The size of the disk, in GB."
}

variable "guest_network" {
    description = "Porgroup to which the virtual machine will be connected."
}

variable "guest_ipv4_address" {
    description = "The IPv4 address."
}

variable "guest_ipv4_netmask" {
    description = "The IPv4 subnet mask, in bits (example: 24 for 255.255.255.0)."
}

variable "guest_ipv4_gateway" {
    description = "The IPv4 default gateway."
}

variable "guest_dns_servers" {
    description = "The list of DNS servers to configure on the virtual machine."
}

variable "guest_dns_suffix" {
    description = "A list of DNS search domains to add to the DNS configuration on the virtual machine."
}

variable "guest_domain" {
    description = "The domain name for this machine."
}

variable "guest_category_name" {
    description = "Tag category."
}

variable "guest_tag_name" {
    description = "Tag name."
}

variable "guest_annotation" {
    description = "Annotation."
    default = "Annotation."
}