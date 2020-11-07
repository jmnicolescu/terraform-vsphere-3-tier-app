# Automating Infrastructure Provisioning and Deployment of a Three-Tier App on VMware vSphere with Terraform

Deploying 3 VMs as following: nat-web01, nat-app01, nat-db01

### Configuration
```
├── helpers
│   ├── folders
│   │   ├── create_folders.tf
│   │   ├── terraform.tfvars
│   │   ├── variables.tf
│   │   └── versions.tf
│   └── tags
│       ├── create_tags.tf
│       ├── terraform.tfvars
│       ├── variables.tf
│       └── versions.tf
├── main.tf
├── modules
│   └── vsphere-deploy-linux-vm
│       ├── main.tf
│       ├── output.tf
│       └── variables.tf
├── nat-app01.tf
├── nat-db01.tf
├── nat-web01.tf
├── Readme_gpg.md
├── Readme.md
├── variables.tf
└── versions.tf
```

1. The `main.tf` file contains my provider definition as well as the **logic**: while _data sources_ allow data to be fetched or computed for use elsewhere in the configuration (e.g., vSphere cluster, datastore, portgroup, and so on), the _resource_ blocks describe the virtual machines to create. 
2. The `variables.tf` file contains the variables definition within your Terraform configuration (but not the values of those variables which are defined in  `terraform.tfvars`).
3. For all files which match `terraform.tfvars` or `*.auto.tfvars` present in the current directory, Terraform automatically loads them to populate variables. **This file has to be updated to match your infrastructure settings**.
4. (optional) The `output.tf` file provides useful information for troubleshooting purposes.

### Requirements

1. vsphere_tag_category and vsphere_tag must exist
   To create the category and tag execute: cd helpers/tags && terraform apply

2. deploy_vsphere_folder and deploy_vsphere_sub_folder must exist
   To create vSphere folder and sub-folder execute: cd helpers/folders && terraform apply

### Execution

To deploy a new VM first create the VM configuration file and place the configuration file in vm-deployment directory.

   \> terraform init

Init - The first command to run for a new configuration is terraform init, which initializes various local settings and data that will be used by subsequent commands. This command will also automatically download and install any provider defined in the configuration.

   If the vCenter credentials are managed via GPG and Pass, set the apropiate environment variables

   export TF_VAR_provider_vsphere_host=$(pass provider_vsphere_host)

   export TF_VAR_provider_vsphere_user=$(pass provider_vsphere_user)

   export TF_VAR_provider_vsphere_password=$(pass provider_vsphere_password)


   \> terraform plan

Plan - The terraform plan command is used to create an execution plan. Terraform performs a refresh, unless explicitly disabled, and then determines what actions are necessary to achieve the desired state specified in the configuration files.

   \> terraform apply

   \> terraform apply -auto-approve

Apply - The terraform apply command is used to apply the changes required to reach the desired state of the configuration.

   \> terraform destroy

   \> terraform destroy -auto-approve

Destroy - Resources can be destroyed using the terraform destroy command, which is similar to terraform apply, but it behaves as if all of the resources have been removed from the configuration.
