
variable "keyvault_service_name_prefix" {
  description = "The service this keyvault is being created for"
}

variable "keyvault_environment" {
  description = "Environment name for the keyvault, e.g. test, prod, etc."
}

variable "keyvault_location" {
  description = "The location for the keyvault"
}

variable "keyvault_resource_group_name" {
  description = "The resource group for the keyvault"
}

variable "keyvault_resource_tags" {
  type        = map(string)
  description = "A map of tags for the keyvault resource being created."
  default     = {}
}
