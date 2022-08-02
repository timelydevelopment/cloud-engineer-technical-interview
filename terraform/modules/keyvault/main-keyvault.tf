resource "azurerm_key_vault" "vault" {
  name                        = "${var.keyvault_service_name_prefix}-${var.keyvault_environment}"
  location                    = var.keyvault_location
  resource_group_name         = var.keyvault_resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled    = false
  enable_rbac_authorization   = true

  sku_name                        = "standard"
  enabled_for_template_deployment = true

  # Permissions for Service calling the creation of the Key Vault
  access_policy {
    tenant_id          = data.azurerm_client_config.current.tenant_id
    object_id          = data.azurerm_client_config.current.tenant_id
    secret_permissions = ["Get", "Set", "List", "Backup", "Delete", "Purge", "Recover", "Restore"]
  }
  tags = var.keyvault_resource_tags
}
