# Module - Azure Load Test  
[![COE](https://img.shields.io/badge/Created%20By-CCoE-blue)]()
[![HCL](https://img.shields.io/badge/language-HCL-blueviolet)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/provider-Azure-blue)](https://registry.terraform.io/providers/hashicorp/azurerm/latest)

Module developed to standardize the Azure Load Testing creation.

## Compatibility Matrix

| Module Version | Terraform Version | AzureRM Version |
|----------------|-------------------| --------------- |
| v1.0.0         | v1.5.6            | 3.71.0          |

## Specifying a version

To avoid that your code get updates automatically, is mandatory to set the version using the `source` option. 
By defining the `?ref=***` in the the URL, you can define the version of the module.

Note: The `?ref=***` refers a tag on the git module repo.

## Important note

This module grantees the role "Load Test Contributor" for the azure AD groups listed using the var azure_ad_groups.

## Use case

```hcl
module "<lt-system-env-001>" {
  source = "git::https://github.com/danilomnds/terraform-azurerm-load-test?ref=v1.0.0" 
  name = "<lt-system-env-001>"
  location = "<your-region>"
  resource_group_name = "<resource-group>"
  descriptio = "description"
  azure_ad_groups = ["group id 1","group id 2"]
  tags = {
    key1 = "value1"
    key2 = "value2"    
  }  
}
output "lt-system-env-001-name" {
  value = module.<lt-system-env-001>.name
}
output "lt-system-env-001-id" {
  value = module.<lt-system-env-001>.id
}
```

## Input variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | load testing name | `string` | n/a | `Yes` |
| location | azure region | `string` | n/a | `Yes` |
| resource_group_name | resource group name where the resource(s) will be created | `string` | n/a | `Yes` |
| description | description of the resource | `string` | `null` | `No` |
| identity | block as defined below | `object()` | n/a | No |
| tags | tags for the resource | `map(string)` | `{}` | No |
| azure_ad_groups | list of azure AD groups that will be granted the Application Insights Component Contributor role  | `list` | `[]` | No |

## Object variables for blocks

| Variable Name (Block) | Parameter | Description | Type | Default | Required |
|-----------------------|-----------|-------------|------|---------|:--------:|
| identity | type | specifies the type of managed service identity that should be configured on this event hub namespace | `string` | `null` | No |
| identity | identity_ids | specifies a list of user assigned managed identity ids to be assigned to this eventhub namespace | `list(string)` | `null` | No |


## Output variables

| Name | Description |
|------|-------------|
| name | load testing name |
| id | load testing id |

## Documentation

Terraform Load Testing: <br>
[https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/load_test](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/load_test)<br>