# -------------------------------------------------------------
# File Name: output.tf
# Query Data with Output Variables.
#
# Tue Nov 2 12:59:12 BST 2020 - juliusn - initial script
# -------------------------------------------------------------

output "VM-name" {
  description = "VM Names"
  value       = vsphere_virtual_machine.myvm.*.name
}
 
output "VM-ip" {
  description = "default ip address of the deployed VM"
  value       = vsphere_virtual_machine.myvm.*.default_ip_address
}
 
output "VM-guest-ip" {
  description = "all the registered ip address of the VM"
  value       = vsphere_virtual_machine.myvm.*.guest_ip_addresses
}
 
output "VM-uuid" {
  description = "UUID of the VM in vSphere"
  value       = vsphere_virtual_machine.myvm.*.uuid
}