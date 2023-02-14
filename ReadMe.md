# Azure Virtual Machine with Active Directory forest Terraform Module

This terraform module is designed to deploy azure Windows 2012R2/2016/2019 virtual machines with Public IP, Availability Set and Network Security Group support.

## Terraform Usage

To run this example you need to execute following Terraform commands

```hcl
terraform init
terraform plan
terraform apply
```

## Outputs

|Name | Description|
|---- | -----------|
`windows_vm_password`|Password for the windows Virtual Machine
`windows_vm_public_ips`|Public IP's map for the all windows Virtual Machines
`windows_vm_private_ips`|Public IP's map for the all windows Virtual Machines
`windows_virtual_machine_ids`|The resource id's of all Windows Virtual Machine
`network_security_group_ids`|List of Network security groups and ids
`vm_availability_set_id`|The resource ID of Virtual Machine availability set
`active_directory_domain`|The name of the active directory domain
`active_directory_netbios_name`|The name of the active directory netbios name
```

```
You'll see resources like below in the portal
 ![Azure Portal](/images/AzurermActiveDirectory.png)
```
Run `terraform destroy` when you don't need these resources