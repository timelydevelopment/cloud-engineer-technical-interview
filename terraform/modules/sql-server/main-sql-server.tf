resource "random_password" "sql_server_password" {
  length           = 254
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

# Create a Temporary SQL Server in WestUS to Copy Over Primary DB onto and Also a temporary Scrub DB that data factory will execute against.
resource "azurerm_mssql_server" "sql_server" {
  name                          = "${var.sql_server_service_name_prefix}-sqlsrv-${var.sql_server_location}-${var.sql_server_environment}"
  resource_group_name           = var.sql_server_resource_group_name
  location                      = var.sql_server_location
  version                       = "12.0"
  administrator_login           = var.sql_server_administrator_login
  administrator_login_password  = random_password.sql_server_password.result
  minimum_tls_version           = "1.2"
  public_network_access_enabled = true
  tags                          = var.sql_server_resource_tags
}

# User running the Terraform will need to have contribute access to keyvault to add secrets via RBAC process.
# Details https://docs.microsoft.com/en-us/azure/key-vault/general/rbac-guide?tabs=azure-cli

# Create Secret inside keyvault for Deploy DB User
resource "azurerm_key_vault_secret" "DBUser" {
  name         = "DBUser"
  value        = azurerm_mssql_server.sql_server.administrator_login
  key_vault_id = var.sql_server_keyvault_id
  tags         = var.sql_server_resource_tags
}

# Create Secret inside keyvault for Deploy DB User
resource "azurerm_key_vault_secret" "DBPassword" {
  name         = "DBPassword"
  value        = azurerm_mssql_server.sql_server.administrator_login_password
  key_vault_id = var.sql_server_keyvault_id
  tags         = var.sql_server_resource_tags
}

# Create Secret inside keyvault for Deploy DB User
resource "azurerm_key_vault_secret" "DBConnectionString" {
  name         = "DBConnectionString"
  value        = "Server=tcp:${azurerm_mssql_server.sql_server.name}.database.windows.net,1433;Initial Catalog=customer-bookings-db-test;Persist Security Info=False;User ID=${azurerm_mssql_server.sql_server.administrator_login};Password=${azurerm_mssql_server.sql_server.administrator_login_password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  key_vault_id = var.sql_server_keyvault_id
  tags         = var.sql_server_resource_tags
}
