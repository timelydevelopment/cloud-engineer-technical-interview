
variable "sql_server_service_name_prefix" {
  description = "Service Name prefix for SQL Server"
}

variable "sql_server_environment" {
  description = "Name of the environment the SQL Server is in"
}

variable "sql_server_resource_group_name" {
  description = "The resource group the SQL Server would reside in"
}

variable "sql_server_location" {
  description = "The location the SQL Serve"
}

variable "sql_server_administrator_login" {
  description = "The administrator login for the SQL Server"
}

variable "sql_server_resource_tags" {
  description = "The Azure tags for the SQL Server"
  default     = {}
  type        = map(string)
}

variable "sql_server_keyvault_id" {
  description = "The keyvault id for where the secrets for the SQL Server are stored"
}
