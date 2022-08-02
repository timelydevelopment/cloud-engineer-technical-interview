## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_secret.DBConnectionString](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.DBPassword](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.DBUser](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_mssql_server.sql_server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server) | resource |
| [random_password.sql_server_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_sql_server_administrator_login"></a> [sql\_server\_administrator\_login](#input\_sql\_server\_administrator\_login) | The administrator login for the SQL Server | `any` | n/a | yes |
| <a name="input_sql_server_environment"></a> [sql\_server\_environment](#input\_sql\_server\_environment) | Name of the environment the SQL Server is in | `any` | n/a | yes |
| <a name="input_sql_server_keyvault_id"></a> [sql\_server\_keyvault\_id](#input\_sql\_server\_keyvault\_id) | The keyvault id for where the secrets for the SQL Server are stored | `any` | n/a | yes |
| <a name="input_sql_server_location"></a> [sql\_server\_location](#input\_sql\_server\_location) | The location the SQL Serve | `any` | n/a | yes |
| <a name="input_sql_server_resource_group_name"></a> [sql\_server\_resource\_group\_name](#input\_sql\_server\_resource\_group\_name) | The resource group the SQL Server would reside in | `any` | n/a | yes |
| <a name="input_sql_server_resource_tags"></a> [sql\_server\_resource\_tags](#input\_sql\_server\_resource\_tags) | The Azure tags for the SQL Server | `map(string)` | `{}` | no |
| <a name="input_sql_server_service_name_prefix"></a> [sql\_server\_service\_name\_prefix](#input\_sql\_server\_service\_name\_prefix) | Service Name prefix for SQL Server | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_server_id"></a> [server\_id](#output\_server\_id) | n/a |
