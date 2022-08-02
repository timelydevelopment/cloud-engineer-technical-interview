locals {
  location           = "westus"
  environment        = "test"
  service_name       = "customer-bookings"
  service_name_short = "cstmrbkings"
}

resource "azurerm_resource_group" "customer_bookings_rg" {
  name     = "rg-customer-bookings-${local.location}-${local.environment}"
  location = local.location
}

module "customer_bookings_vault" {
  source                       = "./modules/keyvault"
  keyvault_service_name_prefix = local.service_name_short
  keyvault_environment         = local.environment
  keyvault_location            = azurerm_resource_group.customer_bookings_rg.location
  keyvault_resource_group_name = azurerm_resource_group.customer_bookings_rg.name
}

module "customer_bookings_sql_server" {
  source                         = "./modules/sql-server"
  sql_server_service_name_prefix = local.service_name
  sql_server_environment         = local.environment
  sql_server_resource_group_name = azurerm_resource_group.customer_bookings_rg.name
  sql_server_location            = azurerm_resource_group.customer_bookings_rg.location
  sql_server_administrator_login = "sqlServerAdminUserCustomerBookings"
  sql_server_keyvault_id         = module.customer_bookings_vault.keyvault_id
}

module "customer_bookings_sql_db" {
  source                     = "./modules/sql-db"
  sql_db_service_name_prefix = local.service_name
  sql_db_environment         = local.environment
  sql_db_server_id           = module.customer_bookings_sql_server.server_id
}


module "customer_bookings_app" {
  source                          = "./modules/web-app"
  app_service_name_prefix         = local.service_name
  app_service_environment         = local.environment
  app_service_resource_group_name = azurerm_resource_group.customer_bookings_rg.name
  app_service_location            = azurerm_resource_group.customer_bookings_rg.location
  app_service_current_stack       = "dotnet"
  app_service_dotnet_version      = "v5.0"
  app_service_app_settings = {
    ASPNETCORE_ENVIRONMENT = local.environment
  }
}
