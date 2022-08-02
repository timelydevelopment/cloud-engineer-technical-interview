variable "app_service_name_prefix" {
  description = "value for app_service_name_prefix, this will tie into the app service name, e.g. if the input was webhooks, the output app service name will be webhooks-app-australiaeast-test"
}

variable "app_service_location" {
  description = "Location where this app service will be created, currently timely preference is westus and australiaeast, the app service name also ties into the app service name"
  type        = string
}

variable "app_service_environment" {
  description = "Environment that the app is being deployed, e.g. test, prod, etc, this value also forms part of the app service name"
  validation {
    condition     = can(regex("^test$|^prod$|^dev$", var.app_service_environment))
    error_message = "Validation condition of the app_service_environment variable did not validate, current inputs are 'prod' or 'test', case sensitive."
  }
}

variable "app_service_resource_group_name" {
  description = "The resource group this app service will be deployed to, expected to be the same as AppServicePlan ID"
  type        = string
}

variable "app_service_tags" {
  type    = map(string)
  default = {}
}

variable "app_service_app_settings" {
  type = map(string)
}

variable "app_service_common_app_settings" {
  description = "Common App settings as per timely standard to be set across all apps, vnet route all, dns server and local cache option"
  type        = map(string)
  default = {
    WEBSITE_DNS_SERVER                              = "168.63.129.16"
    WEBSITE_ADD_SITENAME_BINDINGS_IN_APPHOST_CONFIG = "1"
  }
}

variable "vnet_route_all_enabled" {
  type        = bool
  default     = true
  description = "All traffic on the app service outbound is routed through the vNet to the Internet"
}

variable "app_service_use_32_bit_worker_process" {
  default     = false
  description = "The app uses 64-bit worker process by default. If you want to use 32-bit worker process, set this to true."
}

variable "app_service_http2_enabled" {
  type    = bool
  default = true
}

variable "app_service_client_affinity_enabled" {
  description = "Should the App Service send session affinity cookies, which route client requests in the same session to the same instance, default to be set Off for Timely as we use Redis for session storage"
  default     = false
}

variable "app_service_file_system_log_level" {
  description = "The Filesystem option is for temporary debugging purposes, and turns itself off in 12 hours, long term logging preference is blobl storage, more information https://docs.microsoft.com/en-us/azure/app-service/troubleshoot-diagnostic-logs#enable-application-logging-windows"
  default     = "Information"
  validation {
    condition     = can(regex("^Information$|^Error$|^Verbose$|^Warning$|^Off$", var.app_service_file_system_log_level))
    error_message = "The app_service_file_system_log_level can only be set to either Information, Error, Verbose, Warning, Off."
  }
}

variable "app_service_always_on" {
  description = "Should the App Service be always on, default to be set Off though production can be set to on as required"
  default     = false
}


variable "app_service_dotnet_version" {
  description = "The version of .NET to use when current_stack is set to dotnet. Possible values include v3.0, v4.0, v5.0, and v6.0."

}

variable "app_service_current_stack" {
  description = "The Application Stack for the Windows Web App. Possible values include dotnet, dotnetcore, node, python, php, and java."
  type        = string
}

variable "app_service_preload_enabled" {
  type        = bool
  default     = false
  description = "Preload the app service to speed up the first request"
}

variable "app_service_plan_worker_count" {
  type        = number
  default     = 2
  description = "The number of workers to be allocated to the app service plan."
}

variable "app_service_plan_os_type" {
  type        = string
  default     = "Windows"
  description = "The O/S type for the App Services to be hosted in this plan. Possible values include Windows, Linux, and WindowsContainer."
}

variable "app_service_plan_size" {
  type        = string
  default     = "S1"
  description = "The SKU for the plan. Possible values include B1, B2, B3, D1, F1, I1, I2, I3, I1v2, I2v2, I3v2, P1v2, P2v2, P3v2, P1v3, P2v3, P3v3, S1, S2, S3, SHARED, EP1, EP2, EP3, WS1, WS2, WS3, and Y1."
}
