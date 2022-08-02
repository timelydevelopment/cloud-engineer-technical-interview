## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_mssql_database.db](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_database) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_sql_db_environment"></a> [sql\_db\_environment](#input\_sql\_db\_environment) | Name of the environment the SQL DB is in | `any` | n/a | yes |
| <a name="input_sql_db_resource_tags"></a> [sql\_db\_resource\_tags](#input\_sql\_db\_resource\_tags) | The Azure tags for the SQL DB | `map(string)` | `{}` | no |
| <a name="input_sql_db_server_id"></a> [sql\_db\_server\_id](#input\_sql\_db\_server\_id) | The keyvault id for where the secrets for the SQL Server are stored | `any` | n/a | yes |
| <a name="input_sql_db_service_name_prefix"></a> [sql\_db\_service\_name\_prefix](#input\_sql\_db\_service\_name\_prefix) | Service Name prefix for SQL DB | `any` | n/a | yes |

## Outputs

No outputs.
