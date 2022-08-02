
resource "azurerm_mssql_database" "db" {
  name                 = "${var.sql_db_service_name_prefix}-db-${var.sql_db_environment}"
  server_id            = var.sql_db_server_id
  max_size_gb          = 2
  sku_name             = "Basic"
  storage_account_type = "Local"
  tags                 = var.sql_db_resource_tags
}
