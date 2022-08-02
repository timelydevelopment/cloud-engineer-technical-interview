resource "azurerm_service_plan" "service_plan" {
  name                = "${var.app_service_name_prefix}-plan-${var.app_service_location}-${var.app_service_environment}"
  location            = var.app_service_location
  resource_group_name = var.app_service_resource_group_name
  os_type             = var.app_service_plan_os_type
  sku_name            = var.app_service_plan_size
  worker_count        = var.app_service_plan_worker_count
  tags                = var.app_service_tags
}

resource "azurerm_windows_web_app" "app_service" {
  name                    = "${var.app_service_name_prefix}-app-${var.app_service_location}-${var.app_service_environment}"
  location                = var.app_service_location
  resource_group_name     = var.app_service_resource_group_name
  service_plan_id         = azurerm_service_plan.service_plan.id
  https_only              = true
  tags                    = var.app_service_tags
  app_settings            = merge(var.app_service_app_settings, var.app_service_common_app_settings)
  client_affinity_enabled = var.app_service_client_affinity_enabled

  site_config {
    remote_debugging_version = "VS2019"
    ftps_state               = "Disabled"
    always_on                = var.app_service_always_on
    http2_enabled            = var.app_service_http2_enabled
    minimum_tls_version      = "1.2"
    use_32_bit_worker        = var.app_service_use_32_bit_worker_process
    vnet_route_all_enabled   = var.vnet_route_all_enabled
    websockets_enabled       = false
    default_documents        = []

    application_stack {
      current_stack  = var.app_service_current_stack
      dotnet_version = var.app_service_dotnet_version
    }
  }

  logs {
    application_logs {
      file_system_level = var.app_service_file_system_log_level
    }
    http_logs {
      file_system {
        retention_in_days = 0
        retention_in_mb   = 25
      }
    }
  }

  lifecycle {
    ignore_changes = [
      app_settings["WEBSITE_RUN_FROM_PACKAGE"],
      site_config[0].default_documents,
      site_config[0].virtual_application
    ]
  }

  timeouts {
    delete = "40m"
  }
}
