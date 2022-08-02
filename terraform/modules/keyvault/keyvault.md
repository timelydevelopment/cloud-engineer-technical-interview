## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault.vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_keyvault_environment"></a> [keyvault\_environment](#input\_keyvault\_environment) | Environment name for the keyvault, e.g. test, prod, etc. | `any` | n/a | yes |
| <a name="input_keyvault_location"></a> [keyvault\_location](#input\_keyvault\_location) | The location for the keyvault | `any` | n/a | yes |
| <a name="input_keyvault_resource_group_name"></a> [keyvault\_resource\_group\_name](#input\_keyvault\_resource\_group\_name) | The resource group for the keyvault | `any` | n/a | yes |
| <a name="input_keyvault_resource_tags"></a> [keyvault\_resource\_tags](#input\_keyvault\_resource\_tags) | A map of tags for the keyvault resource being created. | `map(string)` | `{}` | no |
| <a name="input_keyvault_service_name_prefix"></a> [keyvault\_service\_name\_prefix](#input\_keyvault\_service\_name\_prefix) | The service this keyvault is being created for | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_keyvault_id"></a> [keyvault\_id](#output\_keyvault\_id) | n/a |
